import 'dart:convert';

import 'package:get/get.dart';
import 'package:plotrol/data/repository/assignees/get_assignees_repo.dart';
import 'package:plotrol/model/response/book_service/pgr_create_response.dart';
import 'package:plotrol/model/response/employee_response/employee_search_response.dart';
import 'package:plotrol/view/gig_views/gig_home_view.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/book_your_service/book_your_service_repository.dart';
import '../globalWidgets/flutter_toast.dart';
import '../helper/utils.dart';
import '../model/response/autentication_response/autentication_response.dart';
import '../model/response/common_models.dart';
import '../view/main_screen.dart';

class OrderDetailsController extends GetxController {
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  GetAssigneesRepository assigneesRepository = GetAssigneesRepository();
  BookServiceRepository updatePropertiesRepository = BookServiceRepository();

  RxInt currentIndex = 0.obs;
  RxBool isAssigneesLoading = true.obs;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  var items = <Map<String, dynamic>>[].obs;
  List<Employee>? assignees;
  Employee? selectedAssignee;
  bool isDistributor = false;
  bool isHelpDeskUser = false;
  bool isPGRAdmin = false;
  Employee? assignedStaff;
  List<String> checkBoxOptions = [];
  List<String> selectedCheckBoxItems = [];

  void setItems(List<String> itemList) {
    items.value =
        itemList.map((item) => {"name": item, "isChecked": false}).toList();
  }

  void toggleCheck(int index) {
    items[index]['isChecked'] = !items[index]['isChecked'];
    items.refresh();
  }

  getCheckList() {
    checkBoxOptions = [
      "Fence Broken",
      "Filled with bushes",
      "No parking inside",
      "No Building inside"
    ];
    update();
  }

  selectAssignee(Employee? selectedEmployee) {
    selectedAssignee = selectedEmployee;
  }

  getAssignees(ServiceWrapper? order) {
    checkForRole();
    getFilteredAssignees(order);
    getStaffAssigned(order);
  }

  getStaffAssigned(ServiceWrapper? order) async {
    if ((order?.workflow?.assignes ?? []).isNotEmpty) {
      isAssigneesLoading.value = true;
      EmployeeResponse? assignee = await assigneesRepository.getAssignees({
        // "userUuid": [order?.workflow?.assignes?.first]
        "codes": "PLOTHELPDESK"
      });
      assignedStaff = assignee?.employees.first;
      isAssigneesLoading.value = false;
      update();
    }
  }

  checkForRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoString = prefs.getString('userInfo');
    UserRequest? user =
        UserRequest.fromJson(jsonDecode(userInfoString.toString()));
    isDistributor = AppUtils().checkIsHousehold(user.roles ?? []);
    isHelpDeskUser = AppUtils().checkIsGig(user.roles ?? []);
    isPGRAdmin = AppUtils().checkIsPGRAdmin(user.roles ?? []);
    update();
  }

  getFilteredAssignees(ServiceWrapper? order) async {
    isAssigneesLoading.value = true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoString = prefs.getString('userInfo');
    String? userUuid = prefs.getString('userUuid');
    UserRequest? userRequest = (userInfoString ?? "").isNotEmpty
        ? UserRequest.fromJson(jsonDecode(userInfoString!))
        : null;
    bool isHelpDeskUser = AppUtils().checkIsGig(userRequest?.roles ?? []);
    bool isDistributor = AppUtils().checkIsHousehold(userRequest?.roles ?? []);
    EmployeeResponse? employeeResponse =
        await assigneesRepository.getAssignees(isHelpDeskUser || isDistributor
            ? {
                // "userUuid": [order?.workflow?.assignes?.first]
                "codes": "PLOTHELPDESK"
              }
            : {"roles": "HELPDESK_USER"});

    List<Employee>? filteredEmployees =
        employeeResponse?.employees.where((employee) {
      final hasValidAssignment = (employee.assignments.isNotEmpty ?? false) &&
          employee.assignments.any((assignment) =>
              assignment.department != null &&
              assignment.designation != null &&
              assignment.department == "eGov");

      final hasValidUser =
          employee.user?.userServiceUuid != null && employee.user?.uuid != null;

      return hasValidAssignment && hasValidUser;
    }).toList();

    if (filteredEmployees != null && filteredEmployees.isNotEmpty) {
      assignees = filteredEmployees;
    }

    isAssigneesLoading.value = false;
    update();
  }

  updateBooking(ServiceWrapper order) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userUuid = prefs.getString('userUuid');
    String? tenantId = prefs.getString('tenantId');

    String? userInfoString = prefs.getString('userInfo');
    UserRequest? user =
        UserRequest.fromJson(jsonDecode(userInfoString.toString()));
    if ((isPGRAdmin &&
            selectedAssignee != null &&
            order.service?.applicationStatus != "RESOLVED") ||
        (isHelpDeskUser && order.service?.applicationStatus != "RESOLVED")) {
      if (isHelpDeskUser && order.service?.applicationStatus != "RESOLVED" && selectedCheckBoxItems.isEmpty) {
        Toast.showToast('Please verify checklist items');
        btnController.reset();
      } else {
        try {
          final Map<String, dynamic> additionalDetailMap =
          (order.service!.additionalDetail != null && order.service!.additionalDetail!.isNotEmpty)
              ? Map<String, dynamic>.from(jsonDecode(order.service!.additionalDetail.toString()))
              : {};
        AuditDetails auditDetails = AuditDetails(
          createdBy: order.service?.auditDetails?.createdBy,
          createdTime: order.service?.auditDetails?.createdTime,
          lastModifiedBy: userUuid,
          lastModifiedTime: AppUtils().millisecondsSinceEpoch(),
        );
        Service? service = order.service != null
            ? Service.fromJson(order.service!.toJson())
            : null;

        Workflow? workflow = order.workflow != null
            ? Workflow.fromJson(order.workflow!.toJson())
            : null;
        service?.applicationStatus = order.service?.applicationStatus;
        service?.auditDetails = auditDetails;
        workflow?.action =
        order.service?.applicationStatus == "PENDING_ASSIGNMENT" &&
            AppUtils().checkIsGig(user.roles ?? [])
            ? "RESOLVE"
            : "ASSIGN";
        workflow?.assignes =
        order.service?.applicationStatus == "PENDING_ASSIGNMENT" &&
            AppUtils().checkIsGig(user.roles ?? [])
            ? null
            : selectedAssignee?.user?.userServiceUuid != null
            ? [selectedAssignee?.user?.userServiceUuid]
            : [];
        service?.additionalDetail =
        AppUtils().checkIsGig(user.roles ?? []) ? service.additionalDetail !=
            null
            ? jsonEncode(
            {
              ...additionalDetailMap,
              "checklist": selectedCheckBoxItems.join("|").toString()
            }
        )
            : jsonEncode({
          "checklist": selectedCheckBoxItems.join("|").toString()

        }) : order.service?.additionalDetail;
        workflow?.hrmsAssignes =
        order.service?.applicationStatus == "PENDING_ASSIGNMENT" &&
            AppUtils().checkIsGig(user.roles ?? [])
            ? null
            : [selectedAssignee?.user?.uuid];
        PgrServiceResponse? result =
        await updatePropertiesRepository.updateBooking(ServiceWrapper(
          service: service,
          workflow: workflow,
        ));
        if ((result?.serviceWrappers ?? []).isNotEmpty) {
          Toast.showToast(isPGRAdmin ? 'Booking has been assigned successfully' : "Task completed successfully");
          Get.offAll(() => GigHomeView(selectedIndex: 0));
        } else {
          Toast.showToast(
              'There is some issue in assigning the booking, Please Try Again Later');
        }
      }
      catch (e) {
          btnController.reset();
        Toast.showToast(
            'There is some issue in assigning the booking, Please Try Again Later');
      }
      }
    } else {
      if ((isPGRAdmin &&
          selectedAssignee == null &&
          order.service?.applicationStatus == "PENDING_ASSIGNMENT")) {
        Toast.showToast('Please select whom you want to assign');
      } else {
        Get.offAll(() => isDistributor
            ? HomeView(selectedIndex: 0)
            : GigHomeView(selectedIndex: 0));
      }
    }
  }

  // New observable for selected item
  RxnString? selectedCity = RxnString();
}

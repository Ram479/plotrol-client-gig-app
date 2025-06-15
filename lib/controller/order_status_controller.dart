import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/utils.dart';
import '../model/response/autentication_response/autentication_response.dart';

class OrderStatusController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;
  RxBool isDistributor = false.obs;
  RxBool isHelpDeskUser = false.obs;
  RxBool isPGRAdmin = false.obs;
  RxBool isScreenLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
  }

  void changeTabIndex(int index) async{
    await Future.delayed(const Duration(milliseconds: 1000));
    tabController.index = index;
    update();
  }

  checkForRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userInfoString =  prefs.getString('userInfo');
    UserRequest? user = UserRequest.fromJson(jsonDecode(userInfoString.toString()));
    isDistributor.value = AppUtils().checkIsHousehold(user.roles ?? []);
    isHelpDeskUser.value = AppUtils().checkIsGig(user.roles ?? []);
    isPGRAdmin.value = AppUtils().checkIsPGRAdmin(user.roles ?? []);
    isScreenLoading.value = false;
    update();
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plotrol/controller/bottom_navigation_controller.dart';
import 'package:plotrol/controller/home_screen_controller.dart';
import 'package:plotrol/globalWidgets/custom_scaffold_widget.dart';
import 'package:plotrol/helper/const_assets_const.dart';
import 'package:plotrol/helper/utils.dart';
import 'package:plotrol/view/main_screen.dart';
import 'package:plotrol/view/properties_details.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../globalWidgets/text_widget.dart';
import 'book_your_service.dart';

class AllProperties extends StatelessWidget {
  final String? selectedCategory;
  final String? selectedCategoryID;
  final bool? isFromCategory;

  AllProperties(
      {super.key,
      this.selectedCategory,
      this.selectedCategoryID,
      this.isFromCategory});

  final HomeScreenController controller = Get.put(HomeScreenController());

  final BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      return CustomScaffold(
        body: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            title: const ReusableTextWidget(
              text: 'All Properties',
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: controller.getPropertiesDetails.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ReusableTextWidget(
                        text: 'Please add properties to Book a service',
                        fontSize: 18,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      RoundedLoadingButton(
                        color: Colors.black,
                        controller: controller.btnController,
                        onPressed: () {
                          Get.to(() => HomeView(
                                selectedIndex: 2,
                              ));
                          controller.btnController.reset();
                        },
                        borderRadius: 10,
                        child: const ReusableTextWidget(
                          text: 'Add Properties',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                    itemCount: controller.getPropertiesDetails.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => PropertiesDetailsScreen(
                                propertyImage: [controller
                                    .getPropertiesDetails[
                                index].imageUrls?.first ?? ImageAssetsConst.sampleRoomPage],
                                address: AppUtils().formatAddress(controller.getPropertiesDetails[index].address),
                            contactNumber: controller
                                .getPropertiesDetails[
                            index]
                                .additionalFields?.fields?.where((a) => a.key == 'contactNo').first.value ??
                                '',
                              ));
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 0.3,
                              ) // Adjust radius
                              ),
                          child: SizedBox(
                            height: 130,
                            width: Get.width,
                            child: Row(
                              //mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                  child:
                                  // (controller.getPropertiesDetails[index]
                                  //             .tenantimage?.firstOrNull !=
                                  //         null)
                                  //     ? Image.network(
                                  //         height: 130, width: Get.width / 3,
                                  //         errorBuilder: (BuildContext context,
                                  //             Object exception,
                                  //             StackTrace? stackTrace) {
                                  //         return Image.asset(
                                  //             'assets/images/no_image.jpg'); // Custom placeholder image
                                  //       },
                                  //         fit: BoxFit.fill,
                                  //         '${controller.getPropertiesDetails[index].tenantimage?.first}')
                                  //     :
                                  const SizedBox(),

                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ReusableTextWidget(
                                            text:
                                                '${controller.getPropertiesDetails[index].additionalFields?.fields?.where((a) => a.key == 'notes').first.value }',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.location_on,
                                                size: 15,
                                              ),
                                              Expanded(
                                                child: ReusableTextWidget(
                                                  maxLines: 2,
                                                  text: AppUtils().formatAddress(controller.getPropertiesDetails[index].address),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                size: 15,
                                              ),
                                              Expanded(
                                                child: ReusableTextWidget(
                                                  maxLines: 2,
                                                  text:
                                                      '${controller.getPropertiesDetails[index].additionalFields?.fields?.where((a) => a.key == 'contactNo').first.value}',
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    padding:
                                                        WidgetStateProperty.all(
                                                            EdgeInsets.only(
                                                                left: 5,
                                                                right: 5)),
                                                    backgroundColor:
                                                        WidgetStateProperty.all(
                                                            Colors.black),
                                                    foregroundColor:
                                                        WidgetStateProperty.all(
                                                            Colors.white),
                                                    shape: WidgetStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                5), // Adjust radius
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Get.to(
                                                        () => BookYourService(
                                                              tenantImage: [ImageAssetsConst.sampleRoomPage],
                                                              householdModel: controller.getPropertiesDetails[index],
                                                              address: AppUtils().formatAddress(controller.getPropertiesDetails[index].address),
                                                              contactNumber: controller
                                                                      .getPropertiesDetails[
                                                                          index]
                                                                      .additionalFields?.fields?.where((a) => a.key == 'contactNo').first.value ??
                                                                  '',
                                                              selectedCategory:
                                                                  selectedCategory ??
                                                                      '',
                                                              // locationID: controller
                                                              //         .getPropertiesDetails[
                                                              //             index]
                                                              //         .locationid ??
                                                              //     0,
                                                              isFromCategories:
                                                                  isFromCategory,
                                                            ));
                                                  },
                                                  child:
                                                      const ReusableTextWidget(
                                                    text: 'BOOK SERVICE',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ),
      );
    });
  }
}

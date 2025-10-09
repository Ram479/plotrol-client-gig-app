import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plotrol/globalWidgets/custom_scaffold_widget.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

import '../controller/autentication_controller.dart';
import '../controller/create_account_controller.dart';
import '../controller/edit_profile_controller.dart';
import '../controller/home_screen_controller.dart';
import '../globalWidgets/text_field_widget.dart';
import '../globalWidgets/text_widget.dart';
import '../helper/const_assets_const.dart';

class ProfileInformationScreen extends StatelessWidget {
  ProfileInformationScreen({super.key});

  final CreateAccountController createAccountController =
      Get.put(CreateAccountController());

  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());

  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const ReusableTextWidget(
            text: 'Profile Information',
            fontSize: 21,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<EditProfileController>(initState: (_) {
            editProfileController.getInitialData();
          }, builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.getProfileImage();
                        },
                        child: CircleAvatar(
                          minRadius: 50,
                          maxRadius: 50,
                          backgroundColor: Colors.grey.withOpacity(0.4),
                          child: controller.profileImage != null
                              ? ClipOval(
                                  child: Image.file(
                                    width: 100,
                                    height: 100,
                                    File(controller.profileImage?.path ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : (homeScreenController.tenantProfileImage.value
                                          .isNotEmpty ||
                                      createAccountController.profileImage !=
                                          null)
                                  ? ClipOval(
                                      child: homeScreenController
                                              .tenantProfileImage
                                              .value
                                              .isNotEmpty
                                          ? Image.network(
                                              fit: BoxFit.cover,
                                              width: 100,
                                              height: 100,
                                              homeScreenController
                                                  .tenantProfileImage.value,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.network(
                                              ImageAssetsConst.sampleRoomPage,
                                              width: 120,
                                              height: 140,
                                              fit: BoxFit.fill,
                                            );
                                          }
                                            )
                                          : Image.file(
                                              width: 100,
                                              height: 100,
                                              File(createAccountController
                                                      .profileImage?.path ??
                                                  ''),
                                              fit: BoxFit.cover,
                                            ),
                                    )
                                  : ReusableTextWidget(
                                      text: authenticationController
                                              .getInitials(
                                                  homeScreenController
                                                          .tenantFirstName
                                                          .value ??
                                                      '',
                                                  homeScreenController
                                                      .tenantLastName.value) ??
                                          authenticationController.getInitials(
                                              createAccountController
                                                  .firstName.value,
                                              createAccountController
                                                  .lastNameController.text) ??
                                          '',
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                    ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextFormField(
                    controller: controller.firstNameController,
                    labelText: 'First Name',
                    prefixIcon: const Icon(Icons.person),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: controller.lastNameController,
                    labelText: 'Last Name',
                    prefixIcon: const Icon(Icons.person),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: controller.emailController,
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    controller: controller.contactNumber,
                    labelText: 'phone',
                    prefixIcon: const Icon(Icons.phone),
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const ReusableTextWidget(
                        text: 'Address',
                        fontSize: 16,
                      ),
                      const Spacer(),
                      Obx(() {
                        return GestureDetector(
                          onTap: controller.toggleDropdownForAddress,
                          child: Icon(
                              controller.isDropdownOpenedForAddress.value
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down),
                        );
                      })
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                    controller: controller.addressController,
                    maxLines: 3,
                    onChanged: (value) {
                      controller.onSearchTextChanged(value);
                    },
                    readOnly: true,
                  ),
                  controller.predictions.isNotEmpty
                      ? Container(
                          height: Get.height * 0.20,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15)),
                          child: Obx(() {
                            return ListView.builder(
                              itemCount: controller.predictions.length,
                              itemBuilder: (context, index) {
                                final prediction = controller.predictions[index]
                                    ['description'];
                                return ListTile(
                                  title: Text(
                                    prediction,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  onTap: () {
                                    final placeId = controller
                                        .predictions[index]['place_id'];
                                    controller.getPlaceDetails(
                                        placeId, prediction);
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                );
                              },
                            );
                          }),
                        )
                      : const SizedBox(),
                  controller.isDropdownOpenedForAddress.value
                      ? Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              controller: controller.suburbController,
                              labelText: 'Suburb',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              controller: controller.cityController,
                              labelText: 'City',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              controller: controller.stateController,
                              labelText: 'State',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextFormField(
                              controller: controller.postCodeController,
                              labelText: 'Pincode',
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),

                  /// TODO for the account details,
                  // SizedBox(height: 15,),
                  // Row(
                  //   children: [
                  //     Icon(Icons.account_balance_sharp),
                  //     SizedBox(height: 15,),
                  //     ReusableTextWidget(text: 'Bank Details', fontSize: 16,),
                  //     Spacer(),
                  //     Obx(() {
                  //       return GestureDetector(
                  //         onTap: controller.toggleDropdownForBankDetails,
                  //         child: Icon(
                  //             controller.isDropdownOpenedForBankDetails.value ?
                  //             Icons.keyboard_arrow_up :
                  //             Icons.keyboard_arrow_down
                  //         ),
                  //       );
                  //     })
                  //   ],
                  // ),
                  // SizedBox(height: 5,),
                  // CustomTextFormField(
                  //     controller: controller.accountNumber,
                  //     labelText: 'Account Number'
                  // ),
                  // controller.isDropdownOpenedForBankDetails.value
                  //     ? Column(
                  //   children: [
                  //     SizedBox(height: 10,),
                  //     CustomTextFormField(
                  //       controller: controller.accountName,
                  //       labelText: 'Account Name',
                  //     ),
                  //     SizedBox(height: 10,),
                  //     CustomTextFormField(
                  //       controller: controller.ifscCode,
                  //       labelText: 'IFSSCODE',
                  //     ),
                  //     SizedBox(height: 10,),
                  //     CustomTextFormField(
                  //       controller: controller.bankName,
                  //       labelText: 'Bank Name',
                  //     ),
                  //     SizedBox(height: 10,),
                  //     CustomTextFormField(
                  //       controller: controller.branchName,
                  //       labelText: 'Branch Name',
                  //     ),
                  //     SizedBox(height: 10,),
                  //     CustomTextFormField(
                  //       controller: controller.accountType,
                  //       labelText: 'Account Type',
                  //     ),
                  //   ],
                  // )
                  //     : const SizedBox.shrink(),
                ],
              ),
            );
          }),
        ),
        // bottomNavigationBar: SizedBox(
        //   child: Padding(
        //     padding: EdgeInsets.all(10),
        //     child: RoundedLoadingButton(
        //       width: Get.width,
        //       color: Colors.black,
        //       onPressed: () async {
        //         editProfileController.updateApiWithImage();
        //       },
        //       borderRadius: 10,
        //       controller: editProfileController.btnController,
        //       child: const ReusableTextWidget(
        //         text: 'Update',
        //         color: Colors.white,
        //         fontSize: 16,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';
import '../controller/create_account_controller.dart';
import '../globalWidgets/text_field_widget.dart';
import '../globalWidgets/text_widget.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final CreateAccountController createAccountController = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return GetBuilder<CreateAccountController>(
              builder: (controller) {
                return Scaffold(
                  appBar: AppBar(
                    title: ReusableTextWidget(
                      text: 'Edit Profile',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: SingleChildScrollView(
                      child: Obx((){
                        return Column(
                          children: [
                            // GestureDetector(
                            //     onTap: (){
                            //       controller.shareNetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/a1/Nachusa_Grasslands_Spring_2016.jpg');
                            //     },
                            //     child: Icon(Icons.share, color: Colors.black,)
                            // ),
                            Stack(
                              children: [
                                InkWell(
                                  onTap : (){
                                   // controller.shareNetworkImages();
                                  },
                                  child: CircleAvatar(
                                    minRadius: 8.h,
                                    maxRadius: 8.h,
                                    backgroundColor: Colors.grey.shade300,
                                    child: ClipOval(
                                      child: controller.profileImage == null ?
                                      Image.asset(
                                        'assets/images/noProfile.png', // Placeholder image or use NetworkImage/AssetImage
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      ) :
                                      Image.file(
                                        width: 100,
                                        height : 100,
                                        File(controller.profileImage?.path ?? ''),
                                        fit: BoxFit.cover,
                                      ),
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
                            SizedBox(height: 4.h,),
                            CustomTextFormField(
                              controller: controller.firstNameController,
                              labelText: 'First Name',
                              prefixIcon: const Icon(Icons.person),
                            ),
                            SizedBox(height: 4.h,),
                            CustomTextFormField(
                              controller: controller.lastNameController,
                              labelText: 'Last Name',
                              prefixIcon: const Icon(Icons.person),
                            ),
                            SizedBox(height: 4.h,),
                            CustomTextFormField(
                              controller: controller.emailController,
                              labelText: 'Email',
                              prefixIcon: const Icon(Icons.email),
                            ),
                            SizedBox(height: 4.h,),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                ReusableTextWidget(text: 'Address', fontSize: 16,),
                                Spacer(),
                                Obx(() {
                                  return GestureDetector(
                                    onTap: controller.toggleDropdown,
                                    child: Icon(
                                        controller.isDropdownOpened.value ?
                                        Icons.keyboard_arrow_up :
                                        Icons.keyboard_arrow_down
                                    ),
                                  );
                                })
                              ],
                            ),
                            SizedBox(height: 1.h,),
                            CustomTextFormField(
                              controller: controller.addressController,
                              maxLines: 3,
                              onChanged: (value){
                                controller.onSearchTextChanged(value);

                              },
                            ),
                            controller.predictions.isNotEmpty?Container(
                              height: Get.height * 0.20,
                              width: Get.width,
                              decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(15)),
                              child: Obx(() {
                                return ListView.builder(
                                  itemCount:  controller.predictions.length,
                                  itemBuilder: (context, index) {
                                    final prediction =
                                    controller.predictions[index]['description'];
                                    return ListTile(
                                      title: Text(prediction,style: const TextStyle(color: Colors.black),),
                                      onTap: () {
                                        final placeId =
                                        controller.predictions[index]['place_id'];
                                        controller.getPlaceDetails(placeId,prediction);
                                        FocusManager.instance.primaryFocus?.unfocus();
                                      },
                                    );
                                  },
                                );

                              }),):const SizedBox(),
                            controller.isDropdownOpened.value
                                ? Column(
                              children: [
                                SizedBox(height: 4.h),
                                CustomTextFormField(
                                  controller: controller.suburbController,
                                  labelText: 'Suburb',
                                ),
                                SizedBox(height: 4.h),
                                CustomTextFormField(
                                  controller: controller.cityController,
                                  labelText: 'City',
                                ),
                                SizedBox(height: 4.h),
                                CustomTextFormField(
                                  controller: controller.stateController,
                                  labelText: 'State',
                                ),
                                SizedBox(height: 4.h),
                                CustomTextFormField(
                                  controller: controller.postCodeController,
                                  labelText: 'Pincode',
                                ),
                              ],
                            )
                                : const SizedBox.shrink(),
                          ],
                        );
                      }),
                    ),
                  ),
                  bottomNavigationBar: SizedBox(
                    child:  Padding(
                      padding: EdgeInsets.only(left: 4.h , right:  4.h, bottom: 0.5.h),
                      child: RoundedLoadingButton(
                        width: Get.width,
                        color: Colors.black,
                        onPressed: () async {
                          controller.btnController.reset();
                        },
                        borderRadius: 10,
                        controller: controller.btnController,
                        child: const ReusableTextWidget(
                          text: 'Update Changes',
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              }
          );
        },
      ),
    );
  }
}

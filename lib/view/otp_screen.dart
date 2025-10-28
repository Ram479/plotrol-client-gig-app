import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';
import 'package:plotrol/controller/autentication_controller.dart';
import 'package:plotrol/controller/book_your_service_controller.dart';
import 'package:plotrol/helper/Logger.dart';
import 'package:plotrol/helper/const_assets_const.dart';
import 'package:plotrol/helper/const_ui_strings.dart';
import 'package:plotrol/view/create_account.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../globalWidgets/flutter_toast.dart';
import '../globalWidgets/text_widget.dart';
import 'main_screen.dart';

class OtpScreen extends StatelessWidget {
  final String otp;
  final int authMode;
  final bool logInStatus;
  OtpScreen(
      {super.key, this.otp = '', this.authMode = 0, this.logInStatus = false});

  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  final BookYourServiceController bookYourServiceController =
      Get.put(BookYourServiceController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey.shade100,
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.grey.shade300,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthenticationController>(builder: (controller) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  right: 2.h,
                  bottom: 2.h,
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        const ReusableTextWidget(
                          text: ConstUiStrings.plotRol,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Image.asset(
                          ImageAssetsConst.plotRolLogo,
                          height: 120,
                          width: 120,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const ReusableTextWidget(
                          text: ConstUiStrings.verification,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        const ReusableTextWidget(
                          text: ConstUiStrings.otpVerificationText,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        AutofillGroup(
                          child: Pinput(
                              length: 6,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              defaultPinTheme:
                                  defaultPinTheme, // Default theme for all fields
                              focusedPinTheme:
                                  focusedPinTheme, // Theme for the focused field
                              submittedPinTheme:
                                  submittedPinTheme, // Theme for the submitted state
                              pinputAutovalidateMode: PinputAutovalidateMode
                                  .onSubmit, // Validation behavior
                              showCursor: true,
                              onChanged: (text) async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                if (controller.resendOtp.value == text) {
                                  if (controller.authMode.value == 1) {
                                    text = controller.resendOtp.value ?? '';
                                  }
                                  if (logInStatus == true) {
                                    prefs.setString('userFcmToken',
                                        controller.userFcmToken.value ?? '');
                                    prefs.setString('contactNo',
                                        controller.contactNo.value ?? '');
                                    Get.to(() => HomeView(
                                          selectedIndex: 0,
                                        ));
                                  } else {
                                    showModalBottomSheet(
                                        context: Get.context!,
                                        isDismissible: true,
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20)),
                                        ),
                                        builder: (context) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: Get.context
                                                            ?.orientation ==
                                                        Orientation.landscape
                                                    ? Get.height * 0.6
                                                    : Get.height * 0.3,
                                                // width: Get.width * 0.10,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  child: Center(
                                                      child: Lottie.asset(
                                                    'assets/images/nodatafound.json',
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: Get.width * 0.85,
                                                child: const Center(
                                                  child: Text(
                                                    "Oops, we couldn't find your account. Instead, would you like to create a new one?",
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontFamily: "Raleway",
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                    ),
                                                    maxLines: 3,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                        CreateAccountScreen(
                                                          contactNumber: controller
                                                              .mobileController
                                                              .text,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      height: Get.height * 0.06,
                                                      width: Get.width * 0.4,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              'Create Account',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                              ))),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: Get.height * 0.06,
                                                      width: Get.width * 0.4,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Center(
                                                          child: Text('Cancel',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                              ))),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              },
                              onCompleted: (text) {
                                if (text != controller.resendOtp.value) {
                                  controller.otpController.clear();
                                  logger.i('textonCompleted $text');
                                  logger.i(
                                      'otpCompleted ${controller.resendOtp}');
                                  Toast.showToast('Please Enter Valid Otp');
                                }
                                // else {
                                //   bookYourServiceController.getCategories();
                                // }
                              }),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ReusableTextWidget(
                              text: ConstUiStrings.didNtReceiveCode,
                            ),
                            OtpTimerButton(
                              buttonType: ButtonType.text_button,
                              controller: controller.otpTimerController,
                              onPressed: () {
                                controller.sendSmsOtp(
                                    controller.mobileController.text);
                              },
                              radius: 30,
                              text: const Text(
                                ConstUiStrings.resendAgain,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Raleway',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                              duration: 60,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}

// Tool chain for android build
// keytool -genkey -v -keystore D:\legendaryadmin\legendaryadmin-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000
// -alias legendaryadmin

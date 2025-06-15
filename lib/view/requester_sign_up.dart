import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:pinput/pinput.dart';
import 'package:plotrol/controller/autentication_controller.dart';
import 'package:plotrol/helper/const_assets_const.dart';
import 'package:plotrol/helper/const_ui_strings.dart';
import 'package:plotrol/view/privacy_and_policy_page.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';
import '../controller/requester_login_controller.dart';
import '../globalWidgets/text_widget.dart';

class RequesterSignup extends StatelessWidget {
  RequesterSignup({super.key,});

  final RequesterLoginController authenticationController = Get.put(RequesterLoginController());
  final passwordRegex = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%])(?=\S+$).{8,15}$');


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
      body: GetBuilder<RequesterLoginController>(
          builder: (controller) {
            return Sizer(
              builder: (context, orientation, screenType) {
                return Center(
                  child: Padding(
                    padding:  EdgeInsets.only(
                      left: 2.h,
                      right: 2.h,
                      bottom: 2.h,
                    ),
                    child: SingleChildScrollView(
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
                            height: 4.h,
                          ),
                          const ReusableTextWidget(
                            text: ConstUiStrings.signInToContinue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          TextFormField(
                              controller: controller.mobileController,
                              onTap: () {
                                controller.isScrollView.value = true;
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                if (text.length == 10) {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                hintText: ConstUiStrings.enterPhoneNumber,
                                hintStyle: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 15,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    // Set the color you want when the field is focused
                                    width: 1.0, // Set the width of the border side
                                  ),
                                ),
                                prefixIcon: SizedBox(
                                  width: Get.width * 0.3,
                                  height: Get.height * 0.04,
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      InkWell(
                                        child: CountryPickerUtils
                                            .getDefaultFlagImage(
                                            controller.selectedDialogCountry),
                                        // onTap: _openCountryPickerDialog,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          "+${controller.selectedDialogCountry
                                              .phoneCode}"),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Offstage(
                            offstage: false,
                          // offstage: authenticationController.showNameField.value == false,
                            child: TextFormField(
                                controller: controller.nameController,
                                onTap: () {
                                  controller.isScrollView.value = true;
                                },
                                onTapOutside: (event) {
                                  FocusScope.of(context).unfocus();
                                },
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                                keyboardType: TextInputType.text,
                                onChanged: (text) {
                                  // if (text.length == 10) {
                                  //   FocusScope.of(context).unfocus();
                                  // }
                                },
                                // inputFormatters: [
                                //   LengthLimitingTextInputFormatter(10),
                                //   FilteringTextInputFormatter.digitsOnly,
                                // ],
                                decoration: InputDecoration(
                                  hintText: ConstUiStrings.enterName,
                                  hintStyle: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 0,
                                    ),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      // Set the color you want when the field is focused
                                      width: 1.0, // Set the width of the border side
                                    ),
                                  ),
                                ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          // Offstage(
                          //   offstage: false,
                          //   // offstage: authenticationController.showOTPField.value == false,
                          //   child: AutofillGroup(
                          //     child: Pinput(
                          //       controller: controller.otpController,
                          //         length: 6,
                          //         autofocus: true,
                          //         keyboardType: TextInputType.number,
                          //         textInputAction: TextInputAction.next,
                          //         defaultPinTheme: defaultPinTheme, // Default theme for all fields
                          //         focusedPinTheme: focusedPinTheme, // Theme for the focused field
                          //         submittedPinTheme: submittedPinTheme, // Theme for the submitted state
                          //         pinputAutovalidateMode: PinputAutovalidateMode.onSubmit, // Validation behavior
                          //         showCursor: true,
                          //         androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                          //         onChanged: (text) async {
                          //           },
                          //         onCompleted: (text) {
                          //           // if (text != controller.resendOtp.value) {
                          //           //   controller.otpController.clear();
                          //           //   logger.i('textonCompleted $text');
                          //           //   logger.i('otpCompleted ${controller.resendOtp}');
                          //           //   Toast.showToast('Please Enter Valid Otp');
                          //           // }
                          //           // else {
                          //           //   bookYourServiceController.getCategories();
                          //           // }
                          //         }),
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 2.h,
                          // ),
                          // Offstage(
                          //   offstage: authenticationController.showOTPField.value == false,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       const ReusableTextWidget(
                          //         text: ConstUiStrings.didNtReceiveCode,
                          //       ),
                          //       OtpTimerButton(
                          //         buttonType: ButtonType.text_button,
                          //         controller: controller.otpTimerController,
                          //         onPressed: () {
                          //           controller.loginScreenValidation(controller.mobileController.text, context,);
                          //         },
                          //         radius: 30,
                          //         text: const Text(
                          //           ConstUiStrings.resendAgain,
                          //           style: TextStyle(
                          //               color: Colors.black,
                          //               fontFamily: 'Raleway',
                          //               fontSize: 11,
                          //               fontWeight: FontWeight.bold
                          //           ),
                          //         ),
                          //         duration: 60,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Offstage(
                            offstage: false,
                            // offstage: authenticationController.showNameField.value == false,
                            child: TextFormField(
                              controller: controller.passwordController,
                              onTap: () {
                                controller.isScrollView.value = true;
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                              keyboardType: TextInputType.text,
                              obscureText: !controller.isPasswordVisible.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }
                                if (!passwordRegex.hasMatch(value)) {
                                  return 'Password must be 8-15 chars, include upper, lower, digit, and @#\$%';
                                }
                                return null; // valid
                              },
                              onChanged: (text) {
                                // if (text.length == 10) {
                                //   FocusScope.of(context).unfocus();
                                // }
                              },
                              decoration: InputDecoration(
                                hintText: ConstUiStrings.enterPassword,
                                hintStyle: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 15,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off ,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    controller.togglePasswordVisibility();
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    // Set the color you want when the field is focused
                                    width: 1.0, // Set the width of the border side
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Offstage(
                            offstage: false,
                            // offstage: authenticationController.showNameField.value == false,
                            child: TextFormField(
                              controller: controller.confirmPasswordController,
                              onTap: () {
                                controller.isScrollView.value = true;
                              },
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                              keyboardType: TextInputType.text,
                              obscureText: !controller.isConfirmPasswordVisible.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Confirm Password is required';
                                }
                                if (!passwordRegex.hasMatch(value)) {
                                  return 'Password must be 8-15 chars, include upper, lower, digit, and @#\$%';
                                }
                                if (value.toString() != controller.passwordController.value.text) {
                                  return 'Passwords do not match';
                                }
                                return null; // valid
                              },
                              onChanged: (text) {
                                // if (text.length == 10) {
                                //   FocusScope.of(context).unfocus();
                                // }
                              },
                              decoration: InputDecoration(
                                hintText: ConstUiStrings.confirmPassword,
                                hintStyle: const TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 15,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isConfirmPasswordVisible.value ? Icons.visibility : Icons.visibility_off ,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    controller.toggleConfirmPasswordVisibility();
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 0,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    // Set the color you want when the field is focused
                                    width: 1.0, // Set the width of the border side
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
      ),
      bottomNavigationBar:  Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 2.h,
                right: 2.h,
                bottom: 2.h,
              ),
              child: RoundedLoadingButton(
                width: Get.width,
                color: Colors.black,
                controller: authenticationController.btnController,
                onPressed: () {
                  authenticationController.loginScreenValidation(
                      authenticationController.mobileController.text,
                      context
                  );
                },
                borderRadius: 10,
                child: const ReusableTextWidget(
                  text: ConstUiStrings.continueText,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class WebView extends StatelessWidget {
//
//    WebViewController controller = WebViewController();
//
//    WebView({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

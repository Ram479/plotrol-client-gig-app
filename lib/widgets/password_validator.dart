import 'package:flutter/material.dart';

Widget buildPasswordRuleItem(String text, bool conditionMet) {
  return Row(
    children: [
      Expanded(child: Text(text, style: TextStyle(fontSize: 14, color: Colors.white))),
      Icon(
        conditionMet ? Icons.check_circle : Icons.radio_button_unchecked,
        color: conditionMet ? Colors.white : Colors.grey,
        size: 18,
      ),
    ],
  );
}

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

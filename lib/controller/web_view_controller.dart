import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebSiteController extends GetxController {
  var isLoading = true.obs;
  late WebViewController webViewController;

  void onPageStarted(String url) {
    isLoading.value = true;
  }

  void onPageFinished(String url) {
    isLoading.value = false;
  }

  void setWebViewController(WebViewController controller) {
    webViewController = controller;
  }
}

import 'package:flutter/material.dart';
import 'package:plotrol/globalWidgets/custom_scaffold_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../globalWidgets/text_widget.dart';

class WebViewApp extends StatefulWidget {
  final String url;
  final String appBarText;

  const WebViewApp({
    super.key,
    required this.url,
    required this.appBarText,
  });

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: ReusableTextWidget(
            text: widget.appBarText,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        body: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}

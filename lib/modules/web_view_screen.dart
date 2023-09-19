import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

  WebViewScreen(this.url);

  String? url;
  static WebViewController? controller;
  @override
  Widget build(BuildContext context) {
    controller = WebViewController()..loadRequest(Uri.parse(url!));
    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller!),
    );

  }

}

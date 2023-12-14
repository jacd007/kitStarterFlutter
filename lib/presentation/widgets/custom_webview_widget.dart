import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewCustom extends StatefulWidget {
  final String url;
  const WebViewCustom({required this.url, super.key});

  @override
  State<WebViewCustom> createState() => _WebViewCustomState();
}

class _WebViewCustomState extends State<WebViewCustom> {
  String currentUrl = '';
  late WebViewController controller;

  @override
  void initState() {
    currentUrl = widget.url;
    init();
    super.initState();
  }

  init() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) => setState(() => currentUrl = url),
          onPageFinished: (String url) => setState(() => currentUrl = url),
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<String?>(
          future: controller.currentUrl(),
          builder: (context, snap) {
            if (snap.data == null) {
              return const Center(
                child: SizedBox.square(
                  dimension: 40.0,
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return WebViewWidget(controller: controller);
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardScreen extends StatefulWidget {
  final String dashboardUrl;

  const DashboardScreen({super.key, required this.dashboardUrl});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.dashboardUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: WebViewWidget(controller: controller),
    );
  }
}
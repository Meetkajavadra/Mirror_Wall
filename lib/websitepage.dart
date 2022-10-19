import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'global.dart';

class WebSitePage extends StatefulWidget {
  const WebSitePage({Key? key}) : super(key: key);

  @override
  State<WebSitePage> createState() => _WebSitePageState();
}

class _WebSitePageState extends State<WebSitePage> {

  PullToRefreshController pullToRefreshController = PullToRefreshController();
  String url = "";
  final urlController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(color: Colors.indigo),
      onRefresh: () async {
        if (Platform.isAndroid) {
          await Global.inAppWebViewController.reload();
        }
        if (Platform.isAndroid) {
          Uri? uri = await Global.inAppWebViewController.getUrl();

          await Global.inAppWebViewController.loadUrl(
            urlRequest: URLRequest(url: uri),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(useHybridComposition: true),
          ),
          pullToRefreshController: pullToRefreshController,
          initialUrlRequest: URLRequest(
            url: Uri.parse(Global.ChoosenSite['website']),
          ),
        ),
      ),
    );
  }
}

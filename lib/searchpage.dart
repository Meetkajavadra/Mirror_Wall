import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'global.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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

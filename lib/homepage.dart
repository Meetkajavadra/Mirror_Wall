import 'dart:io';
import 'package:browser/bookmarkpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PullToRefreshController pullToRefreshController = PullToRefreshController();
  String url = "";
  final urlController = TextEditingController();
  var searchurl;
  double progress = 0;

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
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search Here...",
            icon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onSubmitted: (val) {
            searchurl = Uri.parse(val);
            searchurl = Uri.parse("https://www.google.com/search?q=$val");
            Global.inAppWebViewController
                .loadUrl(urlRequest: URLRequest(url: searchurl));
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (await Global.inAppWebViewController.canGoBack()) {
                await Global.inAppWebViewController.goBack();
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
          IconButton(
            onPressed: () async {
              if (Platform.isAndroid) {
                await Global.inAppWebViewController.reload();
              }

              if (Platform.isIOS) {
                Uri? uri = await Global.inAppWebViewController.getUrl();

                await Global.inAppWebViewController.loadUrl(
                  urlRequest: URLRequest(url: uri),
                );
              }
            },
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              if (await Global.inAppWebViewController.canGoForward()) {
                await Global.inAppWebViewController.goForward();
              }
            },
            icon: Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () async {
              await Global.inAppWebViewController.loadUrl(
                urlRequest: URLRequest(
                  url: Uri.parse("https:/www.google.co.in"),
                ),
              );
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
              android: AndroidInAppWebViewOptions(useHybridComposition: true),
            ),
            pullToRefreshController: pullToRefreshController,
            initialUrlRequest: URLRequest(
              url: Uri.parse("https://www.google.co.in/"),
            ),
            onWebViewCreated: (InAppWebViewController val) {
              setState(() {
                Global.inAppWebViewController = val;
              });
            },
            onLoadStop: (controller, uri) async {
              await pullToRefreshController.endRefreshing();
            },
            onProgressChanged: (controller, progress) {
              if (progress == 100) {
                pullToRefreshController.endRefreshing();
              }
              setState(
                () {
                  this.progress = progress / 100;
                  urlController.text = url;
                },
              );
            },
          ),
          progress < 1.0
              ? LinearProgressIndicator(
                  value: progress,
                  color: Colors.blue,
                )
              : Container(),
        ],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              Uri? url = await Global.inAppWebViewController.getUrl();

              Global.BookmarkList.add(url.toString());
            },
            child: Icon(Icons.bookmark_add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              Navigator.of(context).pushNamed('bookmarkpage');
            },
            child: Icon(Icons.apps),
          ),
        ],
      ),
    );
  }
}

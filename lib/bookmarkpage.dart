import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'global.dart';

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BookMark Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child:
            Column(
              children: Global.BookmarkList.map(
                (e) => Column(
                  children: [
                    ListTile(
                      title: Text(e),
                      leading: Icon(Icons.ac_unit),
                      shape: OutlineInputBorder(),
                      iconColor: Colors.blue,
                      onTap: () async {
                        Navigator.of(context).pop();

                        await Global.inAppWebViewController
                            .loadUrl(urlRequest: URLRequest(url: Uri.parse(e)));
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ).toList(),
            ),
      ),
    );
  }
}

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Global {
  static late InAppWebViewController inAppWebViewController;
  static List BookMarkList = [];
  static Map ChoosenSite = {};
  static List ottwebsites = [
    {
      "name": "Netflix",
      "image" : "assets/images/netflixlogo.jpg",
      "website": "https://www.netflix.com",
    },
    {
      "name": "ALT Balaji",
      "image" : "assets/images/altbalajilogo.jpg",
      "website": "https://www.altbalaji.com",
    },
    {
      "name": "Disney Plus",
      "image" : "assets/images/hotstarlogo.jpg",
      "website": "https://www.hotstar.com",
    },
    {
      "name": "Hulu",
      "image" : "assets/images/hululogo.jpeg",
      "website": "https://www.hulu.com",
    },
    {
      "name": "SonyLIV",
      "image" : "assets/images/sonylivlogo.jpg",
      "website": "https://www.sonyliv.com",
    },
    {
      "name": "Amazon Prime",
      "image" : "assets/images/primelogo.jpg",
      "website":
      "https://www.primevideo.com",
    },
  ];
}
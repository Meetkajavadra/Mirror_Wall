import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Global {
  static late InAppWebViewController inAppWebViewController;
  static Map ChoosenSite = {};
  static List Educationwebsites = [
    {
      "name": "Geeks for Geeks",
      "image" : "assets/images/geeks.png",
      "website": "https://www.geeksforgeeks.org",
    },
    {
      "name": "Stack Overflow",
      "image" : "assets/images/stack.jpg",
      "website": "https://www.stackoverflow.com",
    },
    {
      "name": "Java T Point",
      "image" : "assets/images/javatpoint.png",
      "website": "https://www.javatpoint.com",
    },
    {
      "name": "W3Schools",
      "image" : "assets/images/w3schools.jpg",
      "website": "https://www.w3schools.com",
    },
    {
      "name": "Wikipedia",
      "image" : "assets/images/wikipedia-logo.jpeg",
      "website": "https://www.wikipedia.org",
    },
  ];
}
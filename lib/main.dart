import 'package:flutter/material.dart';
import 'package:ott/homepage.dart';
import 'package:ott/searchpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage' : (context) => HomePage(),
        'searchpage' : (context) => SearchPage(),
      },
    );
  }
}

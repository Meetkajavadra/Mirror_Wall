import 'package:flutter/material.dart';
import 'package:ott/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTT Platform App"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(17),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 4 / 3.5,
            crossAxisSpacing: 25,
            mainAxisSpacing: 30),
        itemCount: Global.ottwebsites.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Global.ChoosenSite = Global.ottwebsites[index];
              Navigator.of(context).pushNamed('searchpage');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  width: 2,
                  color: Colors.blueAccent,
                  strokeAlign: StrokeAlign.outside,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    Global.ottwebsites[index]['image'],
                    height: 127,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20),
                  Text(Global.ottwebsites[index]['name'],style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

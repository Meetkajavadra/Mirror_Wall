import 'package:flutter/material.dart';
import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Education Websites App",style: TextStyle(color: Colors.green),),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(17),
        itemCount: Global.Educationwebsites.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Global.ChoosenSite = Global.Educationwebsites[index];
              Navigator.of(context).pushNamed('websitepage');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.greenAccent,
                  strokeAlign: StrokeAlign.outside,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(7.5),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(Global.Educationwebsites[index]['image']),
                      radius: 50,
                    ),
                    SizedBox(width: 50),
                    Text(
                      Global.Educationwebsites[index]['name'],
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

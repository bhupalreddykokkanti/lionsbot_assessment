import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utililties/Utils.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                        AssetImage("assets/bg.jpeg"),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                ),
                Container(
                  height: height,
                  child: Center(
                    child: Text('Coming Soon',
                      style: Utils.getHeaderFont(),),
                  ),
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}

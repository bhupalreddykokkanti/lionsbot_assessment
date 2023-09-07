import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utililties/Utils.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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

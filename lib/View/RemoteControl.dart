import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:lionsbot_assessment/Utililties/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:simple_joystick/simple_joystick.dart';

import '../Utililties/Utils.dart';
import 'BottomNavigationBar/BottomTabsCustomWidget.dart';

class RemoteControl extends StatefulWidget {

  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;

  const RemoteControl({Key? key,
    required this.menuScreenContext,
    required this.onScreenHideButtonPressed,
    required this.hideStatus}) : super(key: key);

  @override
  State<RemoteControl> createState() => _RemoteControlState();
}

class _RemoteControlState extends State<RemoteControl> with TickerProviderStateMixin {
  String _button = 'START';
  double _headerHeight = 70.0;
  double _bodyHeight = 180.0;
  BottomDrawerController _controller = BottomDrawerController();
  late AnimationController controller;
  double sliderValue = 0.3;
  bool switchWater = true;
  bool switchBrush = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _openPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
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
          Column(
            children: [
              SizedBox(height: height * 0.07),
              Stack(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: GestureDetector(
                      onTap: (){
                        pushNewScreen(
                          context,
                          screen: BottomTabsCustomWidget(
                            menuScreenContext: context,
                            selectedIndex: 0,
                          ),
                          withNavBar:
                          false, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                          PageTransitionAnimation
                              .cupertino,
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 50,
                        child: Image.asset('assets/back.png'),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Text('Remote Control',style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w700,
                          fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 30),
                child: Column(
                  children: [
                    Divider(
                      height: 14,
                      color: Colors.white,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 30,
                                child: Image.asset('assets/water.png'
                                ),
                              ),
                              Text('WATER',style: Utils.getContentBoldFont(Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: CupertinoColors.white, width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: SizedBox(
                                  width: 51,
                                  height: 31,
                                  child: CupertinoSwitch(
                                    // This bool value toggles the switch.
                                    value: switchWater,
                                    activeColor: CupertinoColors.link,
                                    thumbColor: CupertinoColors.white,
                                    onChanged: (bool? value) {
                                      // This is called when the user toggles the switch.
                                      setState(() {
                                        switchWater = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15, right: 5),
                            color: Colors.white,
                            width: 1,
                            height: 30,
                          ),

                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 30,
                                child: Image.asset('assets/brush.png'
                                ),
                              ),
                              Text('BRUSH',style: Utils.getContentBoldFont(Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: CupertinoColors.white, width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                child: SizedBox(
                                  width: 51,
                                  height: 31,
                                  child: CupertinoSwitch(
                                    // This bool value toggles the switch.
                                    value: switchBrush,
                                    activeColor: CupertinoColors.link,
                                    thumbColor: CupertinoColors.white,
                                    onChanged: (bool? value) {
                                      // This is called when the user toggles the switch.
                                      setState(() {
                                        switchBrush = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      child: RotationTransition(turns: new AlwaysStoppedAnimation(180 / 360),
                          child: Image.asset('assets/remote_arrow.png'))
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          child: RotationTransition(turns: new AlwaysStoppedAnimation(90 / 360),
                              child: Image.asset('assets/remote_arrow.png'))
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        child: JoyStick(
                          joyStickStickColor: appColor,
                          joyStickAreaColor: Color(0xFF384399),
                          200,
                          90,
                              (details) {
                            // nothing
                            // move(details.alignment);
                          },
                        ),
                      ),
                      Container(
                          height: 40,
                          width: 40,
                          child: RotationTransition(turns: new AlwaysStoppedAnimation(270 / 360),
                              child: Image.asset('assets/remote_arrow.png'))
                      ),
                    ],
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      child: RotationTransition(turns: new AlwaysStoppedAnimation(360 / 360),
                          child: Image.asset('assets/remote_arrow.png'))
                  ),
                ],
              ),


              Container(
                margin: EdgeInsets.only(top: 30),
                child:Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 60,
                    width: width,
                    child: ElevatedButton(
                      child: Text(_button),
                      onPressed: () async {
                        if(_button.characters.toString() == 'START'){
                          _button = 'STOP';
                        }else{
                          _button = 'START';
                        }
                        setState(() {

                        });

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: _button.characters.toString() == 'START' ?appColor : primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10), // <-- Radius
                          ),
                          textStyle: const TextStyle(
                            fontSize: 30,
                            fontFamily: 'DIN Next LT Pro',
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
          /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Pressed $_button'),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_upward,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _controller.open();
                          setState(() {
                            _button = 'Open Drawer';
                          });
                        },
                      ),
                      Divider(
                        height: 10.0,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          _controller.close();
                          setState(() {
                            _button = 'Close Drawer';
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),*/

          _buildBottomDrawer(context),
        ],
      ),
    );
  }

  Widget _buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: _buildBottomDrawerHead(context),
      body: _buildBottomDrawerBody(context),
      headerHeight: _headerHeight,
      drawerHeight: _bodyHeight,
      color: appColor,
      controller: _controller,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 60,
          spreadRadius: 5,
          offset: const Offset(2, -6), // changes position of shadow
        ),
      ],
    );
  }

  Widget _buildBottomDrawerHead(BuildContext context) {
    return Container(
      height: _headerHeight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              height: 4,
              width: 40,
              // color: Colors.white,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox.fromSize(
              size: Size(80, 56),
              child: Material(
                color: Colors.amberAccent.withOpacity(0.0),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 3,
                      ), // <-- Icon
                      Text(
                        "SETTINGS",
                        style: Utils.getContentNormalFont(Colors.white),
                      ), // <-- Text
                    ],
                  ),
                ),
              ),
            )
          ]),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildBottomDrawerBody(BuildContext context) {
    return Container(
      width: double.infinity,
      height: _bodyHeight,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        /*'Speed: ${(sliderValue * 100).round()}'*/ 'Speed: ${sliderValue.round()}',
                        style: Utils.getContentNormalFont(Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              //height: 18,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Color(0XFF136BE1),
                    trackHeight: 10,
                    thumbColor: Colors.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: sliderValue,
                    inactiveColor: Colors.transparent,
                    max: 100,
                    min: 0,
                    onChanged: (val) {
                      sliderValue = val;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

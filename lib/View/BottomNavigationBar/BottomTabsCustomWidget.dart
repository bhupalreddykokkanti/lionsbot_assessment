import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lionsbot_assessment/Utililties/colors.dart';
import 'package:lionsbot_assessment/View/RemoteControl.dart';
import 'package:lionsbot_assessment/View/Settings.dart';
import 'package:lionsbot_assessment/View/messages.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../Profile.dart';
import 'BottomNavigationBar.dart';

class BottomTabsCustomWidget extends StatefulWidget {
  final BuildContext menuScreenContext;
  final int? selectedIndex;
  const BottomTabsCustomWidget(
      {Key? key, required this.selectedIndex, required this.menuScreenContext})
      : super(key: key);

  @override
  _BottomTabsCustomWidgetState createState() => _BottomTabsCustomWidgetState();
}

class _BottomTabsCustomWidgetState extends State<BottomTabsCustomWidget> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  bool _isTransactionsAvailable = true;


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
    _controller.index = widget.selectedIndex ?? 0;
  }

  List<Widget> _buildScreens() {
    return [
      Profile(),
      Messages(),
      AlertDialog(),
      Settings(),
      RemoteControl(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: !_hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/bottombarImages/profile.png'),
        ),
        title: "Profile",
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/bottombarImages/messages.png'),
        ),
        title: ("Messages"),
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/bottombarImages/plus.png'),
        ),
        title: (""),
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/bottombarImages/settings.png'),
        ),
        title: ("Settings"),
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey, //activity.png
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/bottombarImages/remote.png'),
        ),
        title: ("Remote"),
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Confirm Exit?',
                style: new TextStyle(color: Colors.black, fontSize: 20.0)),
            content: new Text('Are you sure you want to exit the app? '),
            actions: <Widget>[
              new TextButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: new Text('Yes', style: new TextStyle(fontSize: 18.0)),
              ),
              new TextButton(
                onPressed: () => {
                  Navigator.pop(context)
                } /*Navigator.pop(context)*/, // this line dismisses the dialog
                child: new Text('No', style: new TextStyle(fontSize: 18.0)),
              )
            ],
          ),
        );

        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          // color: Colors.white,
          child: PersistentTabView.custom(
            context,
            controller: _controller,
            screens: _buildScreens(),
            confineInSafeArea: true,
            itemCount: 5,
            handleAndroidBackButtonPress: true,
            stateManagement: true,
            hideNavigationBar: _hideNavBar,
            screenTransitionAnimation: ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            backgroundColor: Colors.transparent,
            customWidget: BottomNavBar(
              items: _navBarsItems(),
              onItemSelected: (index) {
                if (index == 4) {
                  setState(() {
                    _hideNavBar = true;
                  });
                  setState(() {
                    _controller.index =
                        index; // THIS IS CRITICAL!! Don't miss it!
                  });

                } else {
                  setState(() {
                    _controller.index =
                        index; // THIS IS CRITICAL!! Don't miss it!
                  });
                }
              },
              selectedIndex: _controller.index,
            ),
          ),
        ),
      ),
    );
  }
}

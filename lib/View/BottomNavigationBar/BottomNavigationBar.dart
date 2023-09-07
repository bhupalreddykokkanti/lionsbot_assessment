import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });
  Widget _buildItem(
      PersistentBottomNavBarItem item, bool isSelected, bool isCenterIcon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0)),
      ),
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Flexible(
              child: IconTheme(
                data: IconThemeData(
                    size: (isCenterIcon) ? 46 : 26.0,
                    color: isSelected
                        ? (item.activeColorSecondary == null
                            ? item.activeColorPrimary
                            : item.activeColorSecondary)
                        : item.inactiveColorPrimary == null
                            ? item.activeColorPrimary
                            : item.inactiveColorPrimary),
                child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
              ),
            ),
          ),
          Visibility(
            visible: !isCenterIcon,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Text(
                  item.title ?? "",
                  style: TextStyle(
                      color: isSelected
                          ? (item.activeColorSecondary == null
                              ? item.activeColorPrimary
                              : item.activeColorSecondary)
                          : item.inactiveColorPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.0),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF).withOpacity(0.95),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((item) {
              int index = items.indexOf(item);
              return Flexible(
                child: GestureDetector(
                  onTap: () {
                    this.onItemSelected(index);
                  },
                  child: _buildItem(item, selectedIndex == index, index == 2),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

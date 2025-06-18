import 'package:flutter/material.dart';

class NavItemWidget extends BottomNavigationBarItem {
  NavItemWidget({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) : super(
         icon: _buildIcon(iconPath, isSelected),
         activeIcon: _buildActiveIcon(iconPath),
         label: label,
       );

  static Widget _buildIcon(String path, bool isSelected) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(path, width: 70, height: 46),
        ),
        if (isSelected)
          Positioned(
            top: 0,
            child: Container(
              width: 30,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
      ],
    );
  }

  static Widget _buildActiveIcon(String path) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(path, width: 70, height: 46),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: 40,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

class Utils {
  static getTitleFont(Color color1) {
    return TextStyle(
      fontSize: 16,
      color: color1,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );
  }

  static getHeaderFont() {
    return const TextStyle(
      fontSize: 28,
      color: Colors.white,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );
  }

  static getSubTitleFont(Color color1) {
    return TextStyle(
      fontSize: 12,
      color: color1,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
  }

  static getContentBoldFont(Color color1) {
    return TextStyle(
      fontSize: 14,
      color: color1,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
    );
  }
  static getContentNormalFont(Color color1) {
    return TextStyle(
      fontSize: 14,
      color: color1,
      fontFamily: 'Open Sans',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
  }
}

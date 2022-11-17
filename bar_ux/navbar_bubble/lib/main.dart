// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/features/app/demo.dart';
import 'package:navbar_bubble/presentation/themes/app_flex_theme_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appFlexThemeDataLight,
      darkTheme: appFlexThemeDataDark,
      highContrastDarkTheme: appFlexThemeDataDarkHC,
      highContrastTheme: appFlexThemeDataLightHC,
      home: BubbleTabBarDemo(),
    );
  }
}

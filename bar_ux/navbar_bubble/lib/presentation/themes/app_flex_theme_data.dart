// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/themes/app_flex_keys.dart';
import 'package:navbar_bubble/presentation/themes/app_text_themes.dart';

final ThemeData appFlexThemeDataLight = FlexThemeData.light(
  scheme: FlexScheme.bahamaBlue,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  lightIsWhite: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: const FlexSubThemesData(),
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: FlexTones.soft(Brightness.light),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appFlexThemeDataLightHC = FlexThemeData.light(
  scheme: FlexScheme.bahamaBlue,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  lightIsWhite: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: const FlexSubThemesData(),
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: FlexTones.highContrast(Brightness.light),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appFlexThemeDataDark = FlexThemeData.dark(
  scheme: FlexScheme.bahamaBlue,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  darkIsTrueBlack: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: const FlexSubThemesData(),
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: FlexTones.soft(Brightness.dark),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appFlexThemeDataDarkHC = FlexThemeData.dark(
  scheme: FlexScheme.bahamaBlue,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 1,
  transparentStatusBar: true,
  appBarElevation: 0,
  bottomAppBarElevation: 0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  darkIsTrueBlack: false,
  swapColors: false,
  tooltipsMatchBackground: false,
  subThemesData: const FlexSubThemesData(),
  keyColors: appFlexKeys,
  useMaterial3ErrorColors: false,
  tones: FlexTones.highContrast(Brightness.dark),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

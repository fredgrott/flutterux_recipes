// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'package:navbar_bubble/presentation/themes/app_colors.dart';
import 'package:navbar_bubble/presentation/themes/app_flex_keys.dart';
import 'package:navbar_bubble/presentation/themes/app_text_themes.dart';

final ColorScheme appLightColorScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: primaryBrandKeyColor,
  secondaryKey: secondaryBrandKeyColor,
  tertiaryKey: tertiaryBrandKeyColor,
  primary: primaryBrandKeyColor,
  // Blending the color but not the tones egenrated.

  tones: FlexTones.vivid(Brightness.light),
);

final FlexColorScheme appColorSchemeLight = FlexColorScheme.light(
  colorScheme: appLightColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.primary,
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
  // Needs to match tones supplied to the ColorScheme.
  tones: FlexTones.vivid(Brightness.light),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appThemeDataLight = appColorSchemeLight.toTheme;

final ColorScheme appLightHCColorScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
  primaryKey: primaryBrandKeyColor,
  secondaryKey: secondaryBrandKeyColor,
  tertiaryKey: tertiaryBrandKeyColor,
  primary: primaryBrandKeyColor,
  // Blending the color but not the tones egenrated.

  tones: FlexTones.highContrast(Brightness.light),
);

final FlexColorScheme appColorSchemeLightHC = FlexColorScheme.light(
  colorScheme: appLightHCColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.primary,
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
  // Needs to match tones supplied to the ColorScheme.
  tones: FlexTones.highContrast(Brightness.light),
  visualDensity: VisualDensity.comfortable,
  textTheme: appLightTextTheme,
  primaryTextTheme: appLightTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appThemeDataLightHC = appColorSchemeLightHC.toTheme;

final ColorScheme appDarkColorScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primaryBrandKeyColor,
  secondaryKey: secondaryBrandKeyColor,
  tertiaryKey: tertiaryBrandKeyColor,
  primary: primaryBrandKeyColor,
  // Blending the color but not the tones egenrated.

  tones: FlexTones.vivid(Brightness.dark),
);

final FlexColorScheme appColorSchemeDark = FlexColorScheme.dark(
  colorScheme: appDarkColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.primary,
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
  // Needs to match tones supplied to the ColorScheme.
  tones: FlexTones.vivid(Brightness.dark),
  visualDensity: VisualDensity.comfortable,
  textTheme: appDarkTextTheme,
  primaryTextTheme: appDarkTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appThemeDataDark = appColorSchemeDark.toTheme;

final ColorScheme appDarkHCColorScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: primaryBrandKeyColor,
  secondaryKey: secondaryBrandKeyColor,
  tertiaryKey: tertiaryBrandKeyColor,
  primary: primaryBrandKeyColor,
  // Blending the color but not the tones egenrated.

  tones: FlexTones.highContrast(Brightness.dark),
);

final FlexColorScheme appColorSchemeDarkHC = FlexColorScheme.dark(
  colorScheme: appDarkHCColorScheme,
  usedColors: 6,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 0,
  appBarStyle: FlexAppBarStyle.primary,
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
  // Needs to match tones supplied to the ColorScheme.
  tones: FlexTones.highContrast(Brightness.dark),
  visualDensity: VisualDensity.comfortable,
  textTheme: appDarkTextTheme,
  primaryTextTheme: appDarkTextTheme,
  typography: Typography.material2021(),
  applyElevationOverlayColor: true,
  useMaterial3: true,
);

final ThemeData appThemeDataDarkHC = appColorSchemeDarkHC.toTheme;

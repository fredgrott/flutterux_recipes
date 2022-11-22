// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/features/app/demo.dart';

import 'package:navbar_bubble/presentation/themes/app_colors.dart';
import 'package:navbar_bubble/presentation/themes/app_custom_flex_tones.dart';
import 'package:navbar_bubble/presentation/themes/app_flex_keys.dart';
import 'package:navbar_bubble/presentation/themes/app_flex_sub_theme_datas.dart';
import 'package:navbar_bubble/presentation/themes/app_text_themes.dart';
import 'package:navbar_bubble/presentation/themes/custom_dynamic_color_builder.dart';
import 'package:navbar_bubble/presentation/themes/semantic_colors.dart';
import 'package:navbar_bubble/presentation/themes/static_seed_color_schemes.dart';
import 'package:navbar_bubble/presentation/themes/static_theme_datas.dart';

SemanticColors _mySemanticColorsLight = SemanticColors(
  appSemanticOne: homeSemanticSrc,
  appSemanticTwo: gallerySemanticSrc,
  appSemanticThree: cameraSemanticSrc,
  appSemanticFour: likesSemanticSrc,
  appSemanticFive: savedSemanticSrc,
);
//
// ignore: prefer-correct-identifier-length
SemanticColors _mySemanticColorsLightHighContrast = SemanticColors(
  appSemanticOne: homeSemanticSrc,
  appSemanticTwo: gallerySemanticSrc,
  appSemanticThree: cameraSemanticSrc,
  appSemanticFour: likesSemanticSrc,
  appSemanticFive: savedSemanticSrc,
);
SemanticColors _mySemanticColorsDark = SemanticColors(
  appSemanticOne: homeSemanticSrc,
  appSemanticTwo: gallerySemanticSrc,
  appSemanticThree: cameraSemanticSrc,
  appSemanticFour: likesSemanticSrc,
  appSemanticFive: savedSemanticSrc,
);
//
// ignore: prefer-correct-identifier-length
SemanticColors _mySemanticColorsDarkHighContrast = SemanticColors(
  appSemanticOne: homeSemanticSrc,
  appSemanticTwo: gallerySemanticSrc,
  appSemanticThree: cameraSemanticSrc,
  appSemanticFour: likesSemanticSrc,
  appSemanticFive: savedSemanticSrc,
);

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDynamicColorBuilder(
      //
      // ignore: prefer-extracting-callbacks
      builder: (
        lightDynamic,
        lightHighContrastDynamic,
        darkDynamic,
        darkHighContrastDynamic,
      ) {
        ColorScheme lightColorScheme;
        ColorScheme lightHighContrastColorScheme;
        ColorScheme darkColorScheme;
        ColorScheme darkHighContrastColorScheme;
        FlexColorScheme derivedLightFlexColorScheme;
        //
        // ignore: prefer-correct-identifier-length
        FlexColorScheme derivedLightHighContrastFlexColorScheme;
        FlexColorScheme derivedDarkFlexColorScheme;
        //
        // ignore: prefer-correct-identifier-length
        FlexColorScheme derivedDarkHighContrastFlexColorScheme;
        ThemeData derivedLightThemeData;
        //
        // ignore: prefer-correct-identifier-length
        ThemeData derivedLightHighContrastThemeData;
        //
        // ignore: prefer-correct-identifier-length
        ThemeData derivedDarkHighContrastThemeData;
        ThemeData derivedDarkThemeData;

        if (lightDynamic != null &&
            darkDynamic != null &&
            lightHighContrastDynamic != null &&
            darkHighContrastDynamic != null) {
          lightColorScheme = lightDynamic.harmonized();
          lightHighContrastColorScheme = lightHighContrastDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
          darkHighContrastColorScheme = darkHighContrastDynamic.harmonized();

          // Okay, we need to specify what colors to keep.
          lightColorScheme = lightColorScheme.copyWith(
            primary: lightStaticSeedColorScheme.primary,
            primaryContainer: lightStaticSeedColorScheme.primaryContainer,
            onPrimary: lightStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: lightStaticSeedColorScheme.primaryContainer,
            inversePrimary: lightStaticSeedColorScheme.inversePrimary,
          );
          lightHighContrastColorScheme = lightHighContrastColorScheme.copyWith(
            primary: lighthighcontrastStaticSeedColorScheme.primary,
            primaryContainer: lighthighcontrastStaticSeedColorScheme.primaryContainer,
            onPrimary: lighthighcontrastStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: lighthighcontrastStaticSeedColorScheme.primaryContainer,
            inversePrimary: lighthighcontrastStaticSeedColorScheme.inversePrimary,
          );
          darkColorScheme = darkColorScheme.copyWith(
            primary: darkStaticSeedColorScheme.primary,
            primaryContainer: darkStaticSeedColorScheme.primaryContainer,
            onPrimary: darkStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: darkStaticSeedColorScheme.primaryContainer,
            inversePrimary: darkStaticSeedColorScheme.inversePrimary,
          );
          darkHighContrastColorScheme = darkHighContrastColorScheme.copyWith(
            primary: darkhighcontrastStaticSeedColorScheme.primary,
            primaryContainer: darkhighcontrastStaticSeedColorScheme.primaryContainer,
            onPrimary: darkhighcontrastStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: darkhighcontrastStaticSeedColorScheme.primaryContainer,
            inversePrimary: darkhighcontrastStaticSeedColorScheme.inversePrimary,
          );

          _mySemanticColorsLight =
              _mySemanticColorsLight.harmonized(lightDynamic);
          _mySemanticColorsLightHighContrast =
              _mySemanticColorsLightHighContrast
                  .harmonized(lightHighContrastDynamic);
          _mySemanticColorsDark = _mySemanticColorsDark.harmonized(darkDynamic);
          _mySemanticColorsDarkHighContrast = _mySemanticColorsDarkHighContrast
              .harmonized(darkHighContrastDynamic);

          derivedLightFlexColorScheme = FlexColorScheme.light(
            colorScheme: lightColorScheme,
            usedColors: 6,
            surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
            blendLevel: 10,
            appBarStyle: FlexAppBarStyle.primary,
            appBarOpacity: 1,
            transparentStatusBar: true,
            appBarElevation: 0,
            bottomAppBarElevation: 0,
            tabBarStyle: FlexTabBarStyle.forAppBar,
            lightIsWhite: false,
            swapColors: false,
            tooltipsMatchBackground: false,
            subThemesData: staticFlexSubThemesData,
            keyColors: appFlexKeys,
            useMaterial3ErrorColors: false,
            tones: appCustomVividFlexTones(Brightness.light),
            visualDensity: VisualDensity.comfortable,
            textTheme: appLightTextTheme,
            primaryTextTheme: appLightTextTheme,
            materialTapTargetSize: null,
            pageTransitionsTheme: null,
            typography: Typography.material2021(),
            applyElevationOverlayColor: true,
            useMaterial3: true,
            swapLegacyOnMaterial3: false,
            extensions: [_mySemanticColorsLight],
          );

          derivedLightThemeData = derivedLightFlexColorScheme.toTheme;

          derivedLightHighContrastFlexColorScheme = FlexColorScheme.light(
            colorScheme: lightHighContrastColorScheme,
            usedColors: 6,
            surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
            blendLevel: 10,
            appBarStyle: FlexAppBarStyle.primary,
            appBarOpacity: 1,
            transparentStatusBar: true,
            appBarElevation: 0,
            bottomAppBarElevation: 0,
            tabBarStyle: FlexTabBarStyle.forAppBar,
            lightIsWhite: false,
            swapColors: false,
            tooltipsMatchBackground: false,
            subThemesData: staticFlexSubThemesData,
            keyColors: appFlexKeys,
            useMaterial3ErrorColors: false,
            tones: appCustomHighContrastFlexTones(Brightness.light),
            visualDensity: VisualDensity.comfortable,
            textTheme: appLightTextTheme,
            primaryTextTheme: appLightTextTheme,
            materialTapTargetSize: null,
            pageTransitionsTheme: null,
            typography: Typography.material2021(),
            applyElevationOverlayColor: true,
            useMaterial3: true,
            swapLegacyOnMaterial3: false,
            extensions: [_mySemanticColorsLightHighContrast],
          );

          derivedLightHighContrastThemeData =
              derivedLightHighContrastFlexColorScheme.toTheme;

          derivedDarkFlexColorScheme = FlexColorScheme.dark(
            colorScheme: darkColorScheme,
            usedColors: 6,
            surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
            blendLevel: 10,
            appBarStyle: FlexAppBarStyle.primary,
            appBarOpacity: 1,
            transparentStatusBar: true,
            appBarElevation: 0,
            bottomAppBarElevation: 0,
            tabBarStyle: FlexTabBarStyle.forAppBar,
            darkIsTrueBlack: false,
            swapColors: false,
            tooltipsMatchBackground: false,
            subThemesData: staticFlexSubThemesData,
            keyColors: appFlexKeys,
            useMaterial3ErrorColors: false,
            tones: appCustomVividFlexTones(Brightness.dark),
            visualDensity: VisualDensity.comfortable,
            textTheme: appDarkTextTheme,
            primaryTextTheme: appDarkTextTheme,
            materialTapTargetSize: null,
            pageTransitionsTheme: null,
            typography: Typography.material2021(),
            applyElevationOverlayColor: true,
            useMaterial3: true,
            extensions: [_mySemanticColorsDark],
          );

          derivedDarkThemeData = derivedDarkFlexColorScheme.toTheme;

          derivedDarkHighContrastFlexColorScheme = FlexColorScheme.dark(
            colorScheme: darkHighContrastColorScheme,
            usedColors: 6,
            surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
            blendLevel: 10,
            appBarStyle: FlexAppBarStyle.primary,
            appBarOpacity: 1,
            transparentStatusBar: true,
            appBarElevation: 0,
            bottomAppBarElevation: 0,
            tabBarStyle: FlexTabBarStyle.forAppBar,
            darkIsTrueBlack: false,
            swapColors: false,
            tooltipsMatchBackground: false,
            subThemesData: staticFlexSubThemesData,
            keyColors: appFlexKeys,
            useMaterial3ErrorColors: false,
            tones: appCustomHighContrastFlexTones(Brightness.dark),
            visualDensity: VisualDensity.comfortable,
            textTheme: appDarkTextTheme,
            primaryTextTheme: appDarkTextTheme,
            materialTapTargetSize: null,
            pageTransitionsTheme: null,
            typography: Typography.material2021(),
            applyElevationOverlayColor: true,
            useMaterial3: true,
            swapLegacyOnMaterial3: false,
            extensions: [_mySemanticColorsDarkHighContrast],
          );

          derivedDarkHighContrastThemeData =
              derivedDarkHighContrastFlexColorScheme.toTheme;
          //
          // ignore: no-empty-block
        } else {
          derivedLightThemeData = lightStaticFlexColorScheme.toTheme;
          derivedLightHighContrastThemeData =
              lighthighcontrastStaticFlexColorScheme.toTheme;
          derivedDarkThemeData = darkStaticFlexColorScheme.toTheme;
          derivedDarkHighContrastThemeData =
              darkhighcontrastStaticFlexColorScheme.toTheme;
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: derivedLightThemeData,
          highContrastTheme: derivedLightHighContrastThemeData,
          darkTheme: derivedDarkThemeData,
          highContrastDarkTheme: derivedDarkHighContrastThemeData,
          home: BubbleTabBarDemo(),
        );
      },
    );
  }
}

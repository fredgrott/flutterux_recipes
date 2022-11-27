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

ExtraSemanticColors _mySemanticColorsLight = ExtraSemanticColors(
  appExtraSemanticOne: lightExtraSemanticOneStaticSeedColorScheme.primary,
  appExtraSemanticContainerOne: lightExtraSemanticOneStaticSeedColorScheme.primaryContainer,
  appExtraSemanticTwo: lightExtraSemanticTwoStaticSeedColorScheme.primary,
  appExtraSemanticContainerTwo: lightExtraSemanticTwoStaticSeedColorScheme.primaryContainer,
  appExtraSemanticThree: lightExtraSemanticThreeStaticSeedColorScheme.primary,
  appExtraSemanticContainerThree: lightExtraSemanticThreeStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFour: lightExtraSemanticFourStaticSeedColorScheme.primary,
  appExtraSemanticContainerFour: lightExtraSemanticFourStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFive: lightExtraSemanticFiveStaticSeedColorScheme.primary,
  appExtraSemanticContainerFive: lightExtraSemanticFiveStaticSeedColorScheme.primaryContainer,
);
//
// ignore: prefer-correct-identifier-length
ExtraSemanticColors _mySemanticColorsLightHighContrast = ExtraSemanticColors(
  appExtraSemanticOne: lighthighcontrastExtraSemanticOneStaticSeedColorScheme.primary,
  appExtraSemanticContainerOne: lighthighcontrastExtraSemanticOneStaticSeedColorScheme.primaryContainer,
  appExtraSemanticTwo: lighthighcontrastExtraSemanticTwoStaticSeedColorScheme.primary,
  appExtraSemanticContainerTwo: lighthighcontrastExtraSemanticTwoStaticSeedColorScheme.primaryContainer,
  appExtraSemanticThree: lighthighcontrastExtraSemanticThreeStaticSeedColorScheme.primary,
  appExtraSemanticContainerThree: lighthighcontrastExtraSemanticThreeStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFour: lighthighcontrastExtraSemanticFourStaticSeedColorScheme.primary,
  appExtraSemanticContainerFour: lighthighcontrastExtraSemanticFourStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFive: lighthighcontrastExtraSemanticFiveStaticSeedColorScheme.primary,
  appExtraSemanticContainerFive: lighthighcontrastExtraSemanticFiveStaticSeedColorScheme.primaryContainer,
);
ExtraSemanticColors _mySemanticColorsDark = ExtraSemanticColors(
  appExtraSemanticOne: darkExtraSemanticOneStaticSeedColorScheme.primary,
  appExtraSemanticContainerOne: darkExtraSemanticOneStaticSeedColorScheme.primaryContainer,
  appExtraSemanticTwo: darkExtraSemanticTwoStaticSeedColorScheme.primary,
  appExtraSemanticContainerTwo: darkExtraSemanticTwoStaticSeedColorScheme.primaryContainer,
  appExtraSemanticThree: darkExtraSemanticThreeStaticSeedColorScheme.primary,
  appExtraSemanticContainerThree: darkExtraSemanticThreeStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFour: darkExtraSemanticFourStaticSeedColorScheme.primary,
  appExtraSemanticContainerFour: darkExtraSemanticFourStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFive: darkExtraSemanticFiveStaticSeedColorScheme.primary,
  appExtraSemanticContainerFive: darkExtraSemanticFiveStaticSeedColorScheme.primaryContainer,
);
//
// ignore: prefer-correct-identifier-length
ExtraSemanticColors _mySemanticColorsDarkHighContrast = ExtraSemanticColors(
  appExtraSemanticOne: darkhighcontrastExtraSemanticOneStaticSeedColorScheme.primary,
  appExtraSemanticContainerOne: darkhighcontrastExtraSemanticOneStaticSeedColorScheme.primaryContainer,
  appExtraSemanticTwo: darkhighcontrastExtraSemanticTwoStaticSeedColorScheme.primary,
  appExtraSemanticContainerTwo: darkhighcontrastExtraSemanticTwoStaticSeedColorScheme.primaryContainer,
  appExtraSemanticThree: darkhighcontrastExtraSemanticThreeStaticSeedColorScheme.primary,
  appExtraSemanticContainerThree: darkhighcontrastExtraSemanticThreeStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFour: darkhighcontrastExtraSemanticFourStaticSeedColorScheme.primary,
  appExtraSemanticContainerFour: darkhighcontrastExtraSemanticFourStaticSeedColorScheme.primaryContainer,
  appExtraSemanticFive: darkhighcontrastExtraSemanticFiveStaticSeedColorScheme.primary,
  appExtraSemanticContainerFive: darkhighcontrastExtraSemanticFiveStaticSeedColorScheme.primaryContainer,
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

        // Note that the dynamic color package example has this wrong
        // as the Dynamic Color Builder and my custom one only 
        // primary shit per user input color the semantic colors of 
        // error, onError, errorContainer, and onErrorContainer.
        // Thus, we need to insert back in the non-semantic 
        //  colors from our original color scheme.
        //
        // Need to leave enough color change beyond the error semantic 
        // coolors. For example in two color brands we would keep the
        // changed tertiary as UI color change would show app 
        // user that the app responded to their wallpaper or accent color choice.
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
            secondary: lightStaticSeedColorScheme.secondary,
            secondaryContainer: lightStaticSeedColorScheme.secondaryContainer,
            onSecondary: lightStaticSeedColorScheme.onSecondary,
            onSecondaryContainer: lightStaticSeedColorScheme.onSecondaryContainer,
            scrim: lightStaticSeedColorScheme.scrim,
            shadow: lightStaticSeedColorScheme.shadow,
            tertiary: lightStaticSeedColorScheme.tertiary,
            tertiaryContainer: lightStaticSeedColorScheme.tertiaryContainer,
            onTertiary: lightStaticSeedColorScheme.onTertiary,
            onTertiaryContainer: lightStaticSeedColorScheme.onTertiaryContainer,
            surfaceTint: lightStaticSeedColorScheme.surfaceTint,
            surface: lightStaticSeedColorScheme.surface,
            onSurface: lightStaticSeedColorScheme.onSurface,
            surfaceVariant: lightStaticSeedColorScheme.surfaceVariant,
            onSurfaceVariant: lightStaticSeedColorScheme.onSurfaceVariant,
            inverseSurface: lightStaticSeedColorScheme.inverseSurface,
            onInverseSurface: lightStaticSeedColorScheme.onInverseSurface,
            onBackground: lightStaticSeedColorScheme.onBackground,
            background: lightStaticSeedColorScheme.background,
            outline: lightStaticSeedColorScheme.outline,
            outlineVariant: lightStaticSeedColorScheme.outlineVariant,
          );
          lightHighContrastColorScheme = lightHighContrastColorScheme.copyWith(
            primary: lighthighcontrastStaticSeedColorScheme.primary,
            primaryContainer: lighthighcontrastStaticSeedColorScheme.primaryContainer,
            onPrimary: lighthighcontrastStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: lighthighcontrastStaticSeedColorScheme.primaryContainer,
            inversePrimary: lighthighcontrastStaticSeedColorScheme.inversePrimary,
            secondary: lighthighcontrastStaticSeedColorScheme.secondary,
            secondaryContainer: lighthighcontrastStaticSeedColorScheme.secondaryContainer,
            onSecondary: lighthighcontrastStaticSeedColorScheme.onSecondary,
            onSecondaryContainer: lighthighcontrastStaticSeedColorScheme.onSecondaryContainer,
            scrim: lighthighcontrastStaticSeedColorScheme.scrim,
            shadow: lighthighcontrastStaticSeedColorScheme.shadow,
            surface: lighthighcontrastStaticSeedColorScheme.surface,
            surfaceVariant: lighthighcontrastStaticSeedColorScheme.surfaceVariant,
            onSurface: lighthighcontrastStaticSeedColorScheme.surfaceVariant,
            inverseSurface: lighthighcontrastStaticSeedColorScheme.inverseSurface,
            onInverseSurface: lighthighcontrastStaticSeedColorScheme.onInverseSurface,
            onSurfaceVariant: lighthighcontrastStaticSeedColorScheme.onSurfaceVariant,
            surfaceTint: lighthighcontrastStaticSeedColorScheme.surfaceTint,
            tertiary: lightStaticSeedColorScheme.tertiary,
            tertiaryContainer: lightStaticSeedColorScheme.tertiaryContainer,
            onTertiary: lightStaticSeedColorScheme.onTertiary,
            onTertiaryContainer: lightStaticSeedColorScheme.onTertiaryContainer,
            onBackground: lighthighcontrastStaticSeedColorScheme.onBackground,
            background: lighthighcontrastStaticSeedColorScheme.background,
            outline: lighthighcontrastStaticSeedColorScheme.outline,
            outlineVariant: lighthighcontrastStaticSeedColorScheme.outlineVariant,





          );
          darkColorScheme = darkColorScheme.copyWith(
            primary: darkStaticSeedColorScheme.primary,
            primaryContainer: darkStaticSeedColorScheme.primaryContainer,
            onPrimary: darkStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: darkStaticSeedColorScheme.primaryContainer,
            inversePrimary: darkStaticSeedColorScheme.inversePrimary,
            secondary: darkStaticSeedColorScheme.secondary,
            secondaryContainer: darkStaticSeedColorScheme.secondaryContainer,
            onSecondary: darkStaticSeedColorScheme.onSecondary,
            onSecondaryContainer: darkStaticSeedColorScheme.onSecondaryContainer,
            scrim: darkStaticSeedColorScheme.scrim,
            shadow: darkStaticSeedColorScheme.shadow,
            surface: darkStaticSeedColorScheme.surface,
            onSurface: darkStaticSeedColorScheme.onSurface,
            surfaceVariant: darkStaticSeedColorScheme.surfaceVariant,
            onSurfaceVariant: darkStaticSeedColorScheme.onSurfaceVariant,
            inverseSurface: darkStaticSeedColorScheme.inverseSurface,
            onInverseSurface: darkStaticSeedColorScheme.onInverseSurface,
            surfaceTint: darkStaticSeedColorScheme.surfaceTint,
            tertiary: darkStaticSeedColorScheme.tertiary,
            tertiaryContainer: darkStaticSeedColorScheme.tertiaryContainer,
            onTertiary: darkStaticSeedColorScheme.onTertiary,
            onTertiaryContainer: darkStaticSeedColorScheme.onTertiaryContainer,
            onBackground: darkStaticSeedColorScheme.onBackground,
            background: darkStaticSeedColorScheme.background,
            outline: darkStaticSeedColorScheme.outline,
            outlineVariant: darkStaticSeedColorScheme.outlineVariant,
          );
          darkHighContrastColorScheme = darkHighContrastColorScheme.copyWith(
            primary: darkhighcontrastStaticSeedColorScheme.primary,
            primaryContainer: darkhighcontrastStaticSeedColorScheme.primaryContainer,
            onPrimary: darkhighcontrastStaticSeedColorScheme.onPrimary,
            onPrimaryContainer: darkhighcontrastStaticSeedColorScheme.primaryContainer,
            inversePrimary: darkhighcontrastStaticSeedColorScheme.inversePrimary,
            secondary: darkhighcontrastStaticSeedColorScheme.secondary,
            secondaryContainer: darkhighcontrastStaticSeedColorScheme.secondaryContainer,
            onSecondary: darkhighcontrastStaticSeedColorScheme.onSecondary,
            onSecondaryContainer: darkhighcontrastStaticSeedColorScheme.onSecondaryContainer,
            scrim: darkhighcontrastStaticSeedColorScheme.scrim,
            shadow: darkhighcontrastStaticSeedColorScheme.shadow,
            surface: darkhighcontrastStaticSeedColorScheme.surface,
            onSurface: darkhighcontrastStaticSeedColorScheme.onSurface,
            surfaceVariant: darkhighcontrastStaticSeedColorScheme.surfaceVariant,
            onSurfaceVariant: darkhighcontrastStaticSeedColorScheme.onSurfaceVariant,
            inverseSurface: darkhighcontrastStaticSeedColorScheme.inverseSurface,
            onInverseSurface: darkhighcontrastStaticSeedColorScheme.onInverseSurface,
            surfaceTint: darkhighcontrastStaticSeedColorScheme.surfaceTint,
            tertiary: darkhighcontrastStaticSeedColorScheme.tertiary,
            tertiaryContainer: darkhighcontrastStaticSeedColorScheme.tertiaryContainer,
            onTertiary: darkhighcontrastStaticSeedColorScheme.onTertiary,
            onTertiaryContainer: darkhighcontrastStaticSeedColorScheme.onTertiaryContainer,
            onBackground: darkhighcontrastStaticSeedColorScheme.onBackground,
            background: darkhighcontrastStaticSeedColorScheme.background,
            outline: darkhighcontrastStaticSeedColorScheme.outline,
            outlineVariant: darkhighcontrastStaticSeedColorScheme.outlineVariant,


          );

          _mySemanticColorsLight =
              _mySemanticColorsLight.harmonizedExtraSemanticColors(lightDynamic);
          _mySemanticColorsLightHighContrast =
              _mySemanticColorsLightHighContrast
                  .harmonizedExtraSemanticColors(lightHighContrastDynamic);
          _mySemanticColorsDark = _mySemanticColorsDark.harmonizedExtraSemanticColors(darkDynamic);
          _mySemanticColorsDarkHighContrast = _mySemanticColorsDarkHighContrast
              .harmonizedExtraSemanticColors(darkHighContrastDynamic);

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

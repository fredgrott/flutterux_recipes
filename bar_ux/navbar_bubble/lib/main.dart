// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/features/app/demo.dart';
import 'package:navbar_bubble/presentation/themes/app_color_schemes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      //
      // ignore: prefer-extracting-callbacks
      builder: (
        ColorScheme? lightDynamic,
        ColorScheme? darkDynamic,
      ) {
        ColorScheme lightColorScheme;
        ColorScheme lightHCColorScheme;
        ColorScheme darkColorScheme;
        ColorScheme darkHCColorScheme;

        if (lightDynamic != null && darkDynamic != null) {
          // On Android S+ devices, use the provided dynamic color scheme.
          // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
          lightColorScheme = lightDynamic.harmonized();
          lightHCColorScheme = lightDynamic.harmonized();

          // To keep the primary.
          lightColorScheme =
              lightColorScheme.copyWith(
                primary: appLightColorScheme.primary,
                primaryContainer: appLightColorScheme.primaryContainer,
                onPrimary: appLightColorScheme.onPrimary,
                onPrimaryContainer: appLightColorScheme.onPrimaryContainer,
                inversePrimary: appLightColorScheme.inversePrimary,
                
                );
          lightHCColorScheme = lightHCColorScheme.copyWith(
            primary: appLightHCColorScheme.primary,
            primaryContainer: appLightHCColorScheme.primaryContainer,
            onPrimary: appLightHCColorScheme.onPrimary,
            onPrimaryContainer: appLightHCColorScheme.onPrimaryContainer,
            inversePrimary: appLightHCColorScheme.inversePrimary,
          );

          darkColorScheme = darkDynamic.harmonized();

          darkColorScheme =
              darkColorScheme.copyWith(
                primary: appDarkColorScheme.primary,
                primaryContainer: appDarkColorScheme.primaryContainer,
                onPrimary: appDarkColorScheme.onPrimary,
                onPrimaryContainer: appDarkColorScheme.onPrimaryContainer,
                inversePrimary: appDarkColorScheme.inversePrimary,
                );

          darkHCColorScheme = darkDynamic.harmonized();

          darkHCColorScheme =
              darkHCColorScheme.copyWith(
                primary: appDarkHCColorScheme.primary,
                primaryContainer: appDarkHCColorScheme.primaryContainer,
                onPrimary: appDarkHCColorScheme.onPrimary,
                onPrimaryContainer: appDarkHCColorScheme.onPrimaryContainer,
                inversePrimary: appDarkHCColorScheme.inversePrimary,
                );
        } else {
          lightColorScheme = appLightColorScheme;
          lightHCColorScheme = appLightHCColorScheme;
          darkColorScheme = appDarkColorScheme;
          darkHCColorScheme = appDarkHCColorScheme;
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appThemeDataLight.copyWith(
            colorScheme: lightColorScheme,
          ),
          darkTheme: appThemeDataDark.copyWith(
            colorScheme: darkColorScheme,
          ),
          highContrastTheme: appThemeDataLightHC.copyWith(
            colorScheme: lightHCColorScheme,
          ),
          highContrastDarkTheme: appThemeDataDarkHC.copyWith(
            colorScheme: darkHCColorScheme,
          ),
          home: BubbleTabBarDemo(),
        );
      },
    );
  }
}

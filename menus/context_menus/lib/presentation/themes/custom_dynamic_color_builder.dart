// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original code by Material IO team under
// BSD clause-2 Coopright 2012.
// see
// https://github.com/material-foundation/material-dynamic-color-flutter/blob/main/lib/src/dynamic_color_builder.dart

// ignore_for_file: cast_nullable_to_non_nullable, prefer_final_locals

import 'package:context_menus/presentation/themes/app_custom_flex_tones.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_utilities/palettes/core_palette.dart';


class CustomDynamicColorBuilder extends StatefulWidget {
  const CustomDynamicColorBuilder({
    super.key,
    required this.builder,
  });

  /// Builds the child widget of this widget, providing a light and dark [ColorScheme].
  ///
  /// The [ColorScheme]s will be null if dynamic color is not supported on the
  /// platform, or if the OS has yet to respond.
  final Widget Function(
    ColorScheme? lightDynamic,
    ColorScheme? lightHighContrastDynamic,
    ColorScheme? darkDynamic,
    ColorScheme? darkHighContrastDynamic,
  ) builder;

  @override
  _CustomDynamicColorBuilderState createState() =>
      _CustomDynamicColorBuilderState();
}

class _CustomDynamicColorBuilderState extends State<CustomDynamicColorBuilder> {
  ColorScheme? _light;
  ColorScheme? _lightHighContrast;
  ColorScheme? _dark;
  ColorScheme? _darkHighContrast;

  Color? dynamicColor;

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      _light,
      _lightHighContrast,
      _dark,
      _darkHighContrast,
    );
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  //
  // ignore: long-method
  Future<void> initPlatformState() async {
    try {
      // Accesses the core palette from Android via the native plugin with DCP.
      CorePalette? corePalette = await DynamicColorPlugin.getCorePalette();

      if (corePalette != null) {
        debugPrint('dynamic_color: Core palette detected.');

        setState(
          () {
            // Hack to get the true color so that they can be properly
            // inputted to FlexColorSchemes way of seeding.
            // see MCU way generating Schemes source
            // https://github.com/material-foundation/material-color-utilities/blob/main/dart/lib/scheme/scheme.dart
            dynamicColor = Color(corePalette.primary.get(35));

            _light = SeedColorScheme.fromSeeds(
              primaryKey: dynamicColor as Color,
              tones: appCustomVividFlexTones(Brightness.light),
            );
            _lightHighContrast = SeedColorScheme.fromSeeds(
              primaryKey: dynamicColor as Color,
              tones: appCustomHighContrastFlexTones(Brightness.light),
            );

            _dark = SeedColorScheme.fromSeeds(
              primaryKey: dynamicColor as Color,
              tones: appCustomVividFlexTones(Brightness.dark),
            );
            _darkHighContrast = SeedColorScheme.fromSeeds(
              primaryKey: dynamicColor as Color,
              tones: appCustomHighContrastFlexTones(Brightness.dark),
            );
          },
        );

        return;
      }
    } on PlatformException {
      debugPrint('dynamic_color: Failed to obtain core palette.');
    }

    try {
      // For non Android platforms, we grab the accent color.
      final Color? accentColor = await DynamicColorPlugin.getAccentColor();

      // Likewise above, if we grab one return.
      if (!mounted) return;

      if (accentColor != null) {
        debugPrint('dynamic_color: Accent color detected.');

        setState(() {
          _light = SeedColorScheme.fromSeeds(
            primaryKey: accentColor,
            tones: appCustomVividFlexTones(Brightness.light),
          );
          _lightHighContrast = SeedColorScheme.fromSeeds(
            primaryKey: accentColor,
            tones: appCustomHighContrastFlexTones(Brightness.light),
          );
          _dark = SeedColorScheme.fromSeeds(
            primaryKey: accentColor,
            tones: appCustomVividFlexTones(Brightness.dark),
          );
          _darkHighContrast = SeedColorScheme.fromSeeds(
            primaryKey: accentColor,
            tones: appCustomHighContrastFlexTones(Brightness.dark),
          );
        });

        return;
      }
    } on PlatformException {
      debugPrint('dynamic_color: Failed to obtain accent color.');
    }

    debugPrint('dynamic_color: Dynamic color not detected on this device.');
  }

  
}

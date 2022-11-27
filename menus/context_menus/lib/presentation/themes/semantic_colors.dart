// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// Per docs https://api.flutter.dev/flutter/material/ThemeExtension-class.html.
// with dynamic color support, see dynamic color package example
// https://github.com/material-foundation/material-dynamic-color-flutter/blob/main/example/lib/complete_example.dart

class ExtraSemanticColors extends ThemeExtension<ExtraSemanticColors> {
  final Color? appExtraSemanticOne;
  final Color? appExtraSemanticContainerOne;
  final Color? appExtraSemanticTwo;
  final Color? appExtraSemanticContainerTwo;
  final Color? appExtraSemanticThree;
  final Color? appExtraSemanticContainerThree;
  final Color? appExtraSemanticFour;
  final Color? appExtraSemanticContainerFour;
  final Color? appExtraSemanticFive;
  final Color? appExtraSemanticContainerFive;

  ExtraSemanticColors({
    required this.appExtraSemanticOne,
    required this.appExtraSemanticContainerOne,
    required this.appExtraSemanticTwo,
    required this.appExtraSemanticContainerTwo,
    required this.appExtraSemanticThree,
    required this.appExtraSemanticContainerThree,
    required this.appExtraSemanticFour,
    required this.appExtraSemanticContainerFour,
    required this.appExtraSemanticFive,
    required this.appExtraSemanticContainerFive,
  });

  @override
  ExtraSemanticColors copyWith({
    Color? appExtraSemanticOne,
    Color? appExtraSemanticContainerOne,
    Color? appExtraSemanticTwo,
    Color? appExtraSemanticContainerTwo,
    Color? appExtraSemanticThree,
    Color? appExtraSemanticContainerThree,
    Color? appExtraSemanticFour,
    Color? appExtraSemanticContainerFour,
    Color? appExtraSemanticFive,
    Color? appExtraSemanticContainerFive,
  }) {
    return ExtraSemanticColors(
      appExtraSemanticOne: appExtraSemanticOne ?? this.appExtraSemanticOne,
      appExtraSemanticContainerOne: appExtraSemanticContainerOne ?? this.appExtraSemanticContainerOne,
      appExtraSemanticTwo: appExtraSemanticTwo ?? this.appExtraSemanticTwo,
      appExtraSemanticContainerTwo: appExtraSemanticContainerTwo ?? this.appExtraSemanticContainerTwo,
      appExtraSemanticThree:
          appExtraSemanticThree ?? this.appExtraSemanticThree,
      appExtraSemanticContainerThree: appExtraSemanticContainerThree ?? this.appExtraSemanticContainerThree,
      appExtraSemanticFour: appExtraSemanticFour ?? this.appExtraSemanticFour,
      appExtraSemanticContainerFour: appExtraSemanticContainerFour ?? this.appExtraSemanticContainerFour,
      appExtraSemanticFive: appExtraSemanticFive ?? this.appExtraSemanticFive,
      appExtraSemanticContainerFive: appExtraSemanticContainerFive ?? this.appExtraSemanticContainerFive,
    );
  }

  @override
  ExtraSemanticColors lerp(
    covariant ThemeExtension<ExtraSemanticColors>? other,
    double t,
  ) {
    if (other is! ExtraSemanticColors) {
      return this;
    }

    return ExtraSemanticColors(
      appExtraSemanticOne: Color.lerp(
        appExtraSemanticOne,
        other.appExtraSemanticOne,
        t,
      ),
      appExtraSemanticContainerOne: Color.lerp(
        appExtraSemanticContainerOne, other.appExtraSemanticContainerOne, t,),
      appExtraSemanticTwo: Color.lerp(
        appExtraSemanticTwo,
        other.appExtraSemanticTwo,
        t,
      ),
      appExtraSemanticContainerTwo: Color.lerp(appExtraSemanticContainerTwo, other.appExtraSemanticContainerTwo, t,),
      appExtraSemanticThree: Color.lerp(
        appExtraSemanticThree,
        other.appExtraSemanticThree,
        t,
      ),
      appExtraSemanticContainerThree: Color.lerp(appExtraSemanticContainerThree, other.appExtraSemanticContainerThree, t,),
      appExtraSemanticFour: Color.lerp(
        appExtraSemanticFour,
        other.appExtraSemanticFour,
        t,
      ),
      appExtraSemanticContainerFour: Color.lerp(appExtraSemanticContainerFour, other.appExtraSemanticContainerFour, t,),
      appExtraSemanticFive: Color.lerp(
        appExtraSemanticFive,
        other.appExtraSemanticFive,
        t,
      ),
      appExtraSemanticContainerFive: Color.lerp(appExtraSemanticContainerFive, other.appExtraSemanticContainerFive, t,),
    );
  }

  // Dynamic Color example uses wrong thing we need to use blend here as
  // we are working with individual colors not color scheme as the source to change.
  ExtraSemanticColors harmonizedExtraSemanticColors(
      ColorScheme dynamicColorScheme,) {
    return copyWith(
      appExtraSemanticOne:
          appExtraSemanticOne!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticContainerOne: appExtraSemanticContainerOne!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticTwo:
          appExtraSemanticTwo!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticContainerTwo: appExtraSemanticContainerTwo!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticThree:
          appExtraSemanticThree!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticContainerThree: appExtraSemanticContainerThree!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticFour: appExtraSemanticFour!
          .harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticContainerFour: appExtraSemanticContainerFour!.harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticFive: appExtraSemanticFive!
          .harmonizeWith(dynamicColorScheme.primary),
      appExtraSemanticContainerFive: appExtraSemanticContainerFive!.harmonizeWith(dynamicColorScheme.primary),
    );
  }
}

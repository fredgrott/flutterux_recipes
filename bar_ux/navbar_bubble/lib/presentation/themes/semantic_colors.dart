// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

// Per docs https://api.flutter.dev/flutter/material/ThemeExtension-class.html.
// with dynamic color support, see dynamic color package example
// https://github.com/material-foundation/material-dynamic-color-flutter/blob/main/example/lib/complete_example.dart

class SemanticColors extends ThemeExtension<SemanticColors> {
  final Color? appSemanticOne;
  final Color? appSemanticTwo;
  final Color? appSemanticThree;
  final Color? appSemanticFour;
  final Color? appSemanticFive;

  SemanticColors({
    required this.appSemanticOne,
    required this.appSemanticTwo,
    required this.appSemanticThree,
    required this.appSemanticFour,
    required this.appSemanticFive,
  });

  @override
  SemanticColors copyWith({
    Color? appSemanticOne,
    Color? appSemanticTwo,
    Color? appSemanticThree,
    Color? appSemanticFour,
    Color? appSemanticFive,
    }) {
    

    return SemanticColors(
      appSemanticOne: appSemanticOne ?? this.appSemanticOne,
      appSemanticTwo: appSemanticTwo ?? this.appSemanticTwo,
      appSemanticThree: appSemanticThree ?? this.appSemanticThree,
      appSemanticFour: appSemanticFour ?? this.appSemanticFour,
      appSemanticFive: appSemanticFive ?? this.appSemanticFive,
    );
  }

  @override
  SemanticColors lerp(
    covariant ThemeExtension<SemanticColors>? other,
    double t,
  ) {
    if (other is! SemanticColors) {
      return this;
    }

    return SemanticColors(
      appSemanticOne: Color.lerp(
        appSemanticOne,
        other.appSemanticOne,
        t,
      ),
      appSemanticTwo: Color.lerp(
        appSemanticTwo,
        other.appSemanticTwo,
        t,
      ),
      appSemanticThree: Color.lerp(
        appSemanticThree,
        other.appSemanticThree,
        t,
      ),
      appSemanticFour: Color.lerp(
        appSemanticFour,
        other.appSemanticFour,
        t,
      ),
      appSemanticFive: Color.lerp(
        appSemanticFive,
        other.appSemanticFive,
        t,
      ),
    );
  }

  SemanticColors harmonized(ColorScheme dynamicColorScheme) {
    return copyWith(
      appSemanticOne: appSemanticOne!.harmonizeWith(dynamicColorScheme.primary),
      appSemanticTwo: appSemanticTwo!.harmonizeWith(dynamicColorScheme.secondary),
      appSemanticThree: appSemanticThree!.harmonizeWith(dynamicColorScheme.tertiary),
      appSemanticFour: appSemanticFour!.harmonizeWith(dynamicColorScheme.primaryContainer),
      appSemanticFive: appSemanticFive!.harmonizeWith(dynamicColorScheme.secondaryContainer),

      

      
    );
  }
}

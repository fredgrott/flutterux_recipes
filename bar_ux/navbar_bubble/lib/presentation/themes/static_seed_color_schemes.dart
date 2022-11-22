// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/themes/app_colors.dart';

final ColorScheme lightStaticSeedColorScheme =
    SeedColorScheme.fromSeeds(
      primaryKey: primaryBrandSrc,
      primary: primaryBrandSrc,
      secondaryKey: secondaryBrandSrc,
      secondary: secondaryBrandSrc,
      tertiaryKey: tertiaryBrandSrc,
      tones: FlexTones.vivid(Brightness.light),
);

//
// ignore: prefer-correct-identifier-length
final ColorScheme lighthighcontrastStaticSeedColorScheme = SeedColorScheme.fromSeeds(
  primaryKey: primaryBrandSrc,
  primary: primaryBrandSrc,
  secondaryKey: secondaryBrandSrc,
  secondary: secondaryBrandSrc,
  tertiaryKey: tertiaryBrandSrc,
  tones: FlexTones.highContrast(Brightness.light),
);

final ColorScheme darkStaticSeedColorScheme = SeedColorScheme.fromSeeds(
  primaryKey: primaryBrandSrc,
  primary: primaryBrandSrc,
  secondaryKey: secondaryBrandSrc,
  secondary: secondaryBrandSrc,
  tertiaryKey: tertiaryBrandSrc,
  tones: FlexTones.vivid(Brightness.dark),
);

//
// ignore: prefer-correct-identifier-length
final ColorScheme darkhighcontrastStaticSeedColorScheme = SeedColorScheme.fromSeeds(
  primaryKey: primaryBrandSrc,
  primary: primaryBrandSrc,
  secondaryKey: secondaryBrandSrc,
  secondary: secondaryBrandSrc,
  tertiaryKey: tertiaryBrandSrc,
  tones: FlexTones.vivid(Brightness.dark),
);

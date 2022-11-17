// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:navbar_bubble/presentation/widgets/placeholder_card_tall.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (
          content,
          index,
        ) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const PlaceholderCardTall(
              height: 200,
            ),
          );
        },
      ),
    );
  }
}

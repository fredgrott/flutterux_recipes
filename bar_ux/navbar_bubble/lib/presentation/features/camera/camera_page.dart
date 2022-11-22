// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'package:flutter/material.dart';

class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    const double fabSize = 90;

    // Main list content.
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.black,
      padding: const EdgeInsets.only(bottom: 32),
      // Create a floating action button (FAB), with a circle inside of it
      // To size a FAB, nest it in a Container, wrapped in a SizedBox
      child: SizedBox(
        width: fabSize,
        height: fabSize,
        child: SizedBox(
          child: FloatingActionButton(
            //
            // ignore: no-empty-block
            onPressed: () {},
            // Create circle inside our FAB.
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white30,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }

}

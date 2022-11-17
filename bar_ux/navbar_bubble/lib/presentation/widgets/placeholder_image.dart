// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// A designer mod of GSkinner's Vignette Source which is
// under MIT License and copyright 2019. See,
// https://github.com/gskinnerTeam/flutter_vignettes


import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final double width;
  final double height;
  final double cornerRadius;
  final Color? color;
  final Color? backgroundColor;

  const PlaceholderImage({super.key, this.cornerRadius = 4, this.color, this.backgroundColor, this.width = 100, this.height = 100,});

  @override
  Widget build(BuildContext context) {
    final  fgColor = color ?? const Color(0xfff2f2f2);
    final  bgColor = backgroundColor ?? Colors.white;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color: bgColor,
      ),
      margin: const EdgeInsets.all(12),
      child: CustomPaint(
        painter: _ImagePainter(fgColor, bgColor,),
      ),
    );
  }
}

class _ImagePainter extends CustomPainter {
  final Color color;
  final Color backgroundColor;

  _ImagePainter(this.color, this.backgroundColor,);

  @override
  void paint(Canvas canvas, Size size,) {
    final paintForeground = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = color;
    // Draw mountains, size to width.
    final width = size.width * 0.6;
    canvas.translate(size.width / 2 - width/2, size.height / 2 + (width * 0.7)/2,);
    final path = Path()
      ..lineTo(width * 0.4, -width * 0.66,)
      ..lineTo(width * 0.63, -width * 0.29,)
      ..lineTo(width * 0.74, -width * 0.44,)
      ..lineTo(width, 0,)
      ..lineTo(0, 0,);
    // Paint twice, for both stroke and fill.
    canvas.drawPath(path, paintForeground,);
    paintForeground.style = PaintingStyle.fill;
    canvas.drawPath(path, paintForeground,);
    // Draw sun.
    canvas.drawCircle(Offset(width * 0.9, -width * 0.7,), width * 0.1, paintForeground,);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

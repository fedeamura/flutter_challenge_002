import 'dart:math';

import 'package:flutter/cupertino.dart';

class BlobClipper extends CustomClipper<Path> {
  List<double> radius;

  BlobClipper({
    this.radius,
  });

  @override
  Path getClip(Size size) {
    var path = Path();

    for (int i = 1; i <= radius.length; i++) {
      var r = radius[i - 1];
      var angle = pi * 2 * (i / radius.length);
      var x = cos(angle) * (size.width * r) / 2 + size.width / 2;
      var y = sin(angle) * (size.height * r) / 2 + size.height / 2;

      if (i == 1) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

import 'package:flutter/cupertino.dart';

class DashboardClipper extends CustomClipper<Path> {
  final double multiplier;

  DashboardClipper({@required this.multiplier});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.0, size.height * 0.16 * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.00 * size.width, 0.17 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.01 * size.width, 0.17 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.03 * size.width, 0.17 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.05 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.07 * size.width, 0.15 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.08 * size.width, 0.14 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.09 * size.width, 0.13 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.10 * size.width, 0.12 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.11 * size.width, 0.11 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.12 * size.width, 0.10 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.13 * size.width, 0.09 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.15 * size.width, 0.08 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.18 * size.width, 0.07 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.20 * size.width, 0.07 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.22 * size.width, 0.07 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.24 * size.width, 0.08 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.26 * size.width, 0.10 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.28 * size.width, 0.12 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.29 * size.width, 0.13 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.30 * size.width, 0.14 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.32 * size.width, 0.15 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.34 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.37 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.39 * size.width, 0.15 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.41 * size.width, 0.13 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.43 * size.width, 0.10 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.45 * size.width, 0.09 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.48 * size.width, 0.09 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.51 * size.width, 0.10 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.54 * size.width, 0.13 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.54 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.53 * size.width, 0.19 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.54 * size.width, 0.21 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.56 * size.width, 0.22 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.59 * size.width, 0.22 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.61 * size.width, 0.21 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.62 * size.width, 0.19 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.62 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.61 * size.width, 0.10 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.60 * size.width, 0.06 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.61 * size.width, 0.03 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.64 * size.width, 0.01 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.66 * size.width, 0.01 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.68 * size.width, 0.02 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.69 * size.width, 0.05 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.68 * size.width, 0.08 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.67 * size.width, 0.12 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.69 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.73 * size.width, 0.16 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.75 * size.width, 0.15 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.75 * size.width, 0.13 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.74 * size.width, 0.10 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.76 * size.width, 0.08 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.78 * size.width, 0.07 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.82 * size.width, 0.06 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.85 * size.width, 0.05 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.90 * size.width, 0.05 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(0.98 * size.width, 0.06 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(1.00 * size.width, 0.07 * size.height * (1 - multiplier) + (multiplier * size.height));
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    return path;
  }

  @override
  bool shouldReclip(DashboardClipper oldClipper) => oldClipper.multiplier != multiplier;
}

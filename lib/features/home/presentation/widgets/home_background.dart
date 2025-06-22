import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(left: 0, child: Image.asset(Assets.imagesHomeVectors));
  }
}

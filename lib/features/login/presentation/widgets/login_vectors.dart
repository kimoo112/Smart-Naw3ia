import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class LoginVectors extends StatelessWidget {
  const LoginVectors({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: -10,
        left: 0,
        right: 0,
        child: Image.asset(
          Assets.imagesLoginVector,
          fit: BoxFit.cover,
        ));
  }
} 
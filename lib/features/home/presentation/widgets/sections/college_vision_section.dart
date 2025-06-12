import 'package:flutter/material.dart';
import 'package:smart_naw3ia/core/localization/translation_extension.dart';

class CollegeVisionSection extends StatelessWidget {
  const CollegeVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'college_vision.vision'.tr(context),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'college_vision.vision_text'.tr(context),
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Text(
              'college_vision.mission'.tr(context),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'college_vision.mission_text'.tr(context),
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

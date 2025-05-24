import 'package:flutter/material.dart';

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
              'رؤية الكلية',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const Text(
              'تحقيق التميز والصدارة إقليميًا وعالميًا بمختلف المجالات النوعية، ورفع القدرة التنافسية في ضوء التحول الرقمي.',
              style: TextStyle(fontSize: 18),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            Text(
              'رسالة الكلية',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 10),
            const Text(
              'إعداد خريج نوعي مبدع ومنافس أكاديميًا ومهنيًا من الناحية العلمية والبحثية في الدراسات العليا والبحوث، '
              'ومواكبًا لمتطلبات سوق العمل في ضوء رؤية مصر 2030، بما يحقق تنمية مستدامة للمجتمع.',
              style: TextStyle(fontSize: 18),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

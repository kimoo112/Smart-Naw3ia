import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalsSection extends StatelessWidget {
  const GoalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> goals = [
      '١. تطوير البرامج الأكاديمية للكلية بما يتوافق مع معايير الجودة العالمية وسياسات التحول الرقمي.',
      '٢. تعظيم القدرة التنافسية لخريج الكلية والقدرة على اتخاذ القرار والتعامل مع الأزمات.',
      '٣. الترويج لأقسام الكلية المتميزة إقليميًا لجذب الطلاب على المستوى المحلي والإقليمي.',
      '٤. مضاعفة المشاريع البحثية الممولة لدعم البحث العلمي.',
      '٥. رفع كفاءة الإنتاج البحثي لزيادة النشر الدولي ودعم سوق العمل محليًا وإقليميًا وعالميًا.',
      '٦. الانخراط والتكامل مع الهيئات والمؤسسات التعليمية ذات الاهتمام المشترك لتحقيق رؤية مصر ٢٠٣٠.',
      '٧. تعظيم القيم الأخلاقية التي تحث على الشفافية والنزاهة داخل وخارج المؤسسة.',
      '٨. رفع كفاءة الكوادر البشرية بالكلية في ضوء العدالة وتكافؤ الفرص على الصعيد الأكاديمي والإداري.',
      '٩. تنمية الموارد المالية والمادية للكلية لخدمة العملية البحثية والتعليمية.',
      '١٠. الارتقاء بمستوى الخدمة المجتمعية من خلال البرامج التدريبية والممارسات الميدانية.',
    ];

    return Directionality( // Enables RTL layout for Arabic
      textDirection: TextDirection.rtl,
      child: Scaffold(
     
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Text(
                'أهداف الكلية',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
              const SizedBox(height: 10),
              ...goals.map((goal) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      goal,
                      style:  TextStyle(fontSize: 14.sp),
                      textAlign: TextAlign.justify,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../data/models/staff_model.dart';
import 'staff_member_card.dart';

class StaffSection extends StatelessWidget {
  final String title;
  final List<StaffMember> members;
  final Color? cardColor;
  final IconData? cardIcon;

  const StaffSection({
    super.key,
    required this.title,
    required this.members,
    this.cardColor,
    this.cardIcon,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) return const SizedBox.shrink();

    final locale = Localizations.localeOf(context).languageCode;
    final color = cardColor ?? Theme.of(context).primaryColor;
    final icon = cardIcon ?? IconlyBold.profile;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: members
              .map((member) => StaffMemberCard(
                    member: member,
                    color: color,
                    icon: icon,
                    locale: locale,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

// Sample data for leadership staff
final List<StaffMember> leadershipStaff = [
  const StaffMember(
    nameEn: 'Prof. Dr. Mohamed Ahmed Mohamed',
    nameAr: 'أ.د. محمد أحمد محمد',
    titleEn: 'Dean of the Faculty',
    titleAr: 'عميد الكلية',
    department: 'Home Economics',
  ),
  const StaffMember(
    nameEn: 'Prof. Dr. Ahmed Mahmoud Ali',
    nameAr: 'أ.د. أحمد محمود علي',
    titleEn: 'Vice Dean for Education and Student Affairs',
    titleAr: 'وكيل الكلية لشئون التعليم والطلاب',
    department: 'Art Education',
  ),
  const StaffMember(
    nameEn: 'Prof. Dr. Sara Mohamed Hassan',
    nameAr: 'أ.د. سارة محمد حسن',
    titleEn: 'Vice Dean for Graduate Studies',
    titleAr: 'وكيل الكلية لشئون الدراسات العليا',
    department: 'Educational Technology',
  ),
  const StaffMember(
    nameEn: 'Prof. Dr. Mahmoud Ali Ahmed',
    nameAr: 'أ.د. محمود علي أحمد',
    titleEn: 'Vice Dean for Community Service',
    titleAr: 'وكيل الكلية لشئون خدمة المجتمع',
    department: 'Educational and Psychological Sciences',
  ),
];

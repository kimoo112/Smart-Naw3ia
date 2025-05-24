import 'package:flutter/material.dart';

import '../data/models/staff_model.dart';
import 'staff_member_card.dart';

class StaffSection extends StatelessWidget {
  final String title;
  final List<StaffMember> members;

  const StaffSection({
    super.key,
    required this.title,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        ...members.map((member) => StaffMemberCard(member: member)),
      ],
    );
  }
}

final List<StaffMember> staffMembers = [
  const StaffMember(
    name: 'أ.د. محمد أحمد محمد',
    position: 'عميد الكلية',
    department: 'الإقتصاد المنزلى',
  ),
  const StaffMember(
    name: 'أ.د. أحمد محمود علي',
    position: 'وكيل الكلية لشئون التعليم والطلاب',
    department: 'التربية الفنية',
  ),
  const StaffMember(
    name: 'أ.د. سارة محمد حسن',
    position: 'وكيل الكلية لشئون الدراسات العليا',
    department: 'تكنولوجيا التعليم',
  ),
  const StaffMember(
    name: 'أ.د. محمود علي أحمد',
    position: 'وكيل الكلية لشئون خدمة المجتمع',
    department: 'علوم تربوية و نفسية',
  ),
];

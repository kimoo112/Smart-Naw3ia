import 'package:flutter/material.dart';
import 'package:naw3ia/core/utils/app_text_styles.dart';

import '../../data/models/staff_model.dart';

class StaffMemberCard extends StatelessWidget {
  final StaffMember member;

  const StaffMemberCard({
    super.key,
    required this.member,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 32,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.name, style: CustomTextStyles.almarai400Style20),
                  const SizedBox(height: 4),
                  Text(
                    member.position,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  if (member.specialization != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      member.specialization!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                  ],
                  if (member.email != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.email,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          member.email!,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.blue,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:naw3ia/core/localization/translation_extension.dart';

import '../../data/models/staff_model.dart';

class OrganizationalChart extends StatelessWidget {
  final List<StaffMember> staff;

  const OrganizationalChart({
    super.key,
    this.staff = const [],
  });

  @override
  Widget build(BuildContext context) {
    final organizedStaff = OrganizedStaff.fromList(staff);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLevel(
            context,
            title: 'staff.manager'.tr(context),
            members: [organizedStaff.manager].whereType<StaffMember>().toList(),
            icon: Icons.person,
            color: Theme.of(context).primaryColor,
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.professors'.tr(context),
            members: organizedStaff.professors,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withGreen(150),
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.associate_professors'.tr(context),
            members: organizedStaff.associateProfessors,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withBlue(100),
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.lecturers'.tr(context),
            members: organizedStaff.lecturers,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withRed(180),
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.teaching_assistants'.tr(context),
            members: organizedStaff.teachingAssistants,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withOpacity(0.7),
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.demonstrators'.tr(context),
            members: organizedStaff.demonstrators,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          if (organizedStaff.otherStaff.isNotEmpty) ...[
            _buildConnector(context),
            _buildLevel(
              context,
              title: 'staff.other_members'.tr(context),
              members: organizedStaff.otherStaff,
              icon: Icons.people,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLevel(
    BuildContext context, {
    required String title,
    required List<StaffMember> members,
    required IconData icon,
    required Color color,
  }) {
    if (members.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: members
                .map((member) => _buildMemberCard(context, member, color, icon))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(
    BuildContext context,
    StaffMember member,
    Color color,
    IconData icon,
  ) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            member.name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Almarai',
                ),
          ),
          if (member.specialization != null) ...[
            const SizedBox(height: 4),
            Text(
              member.specialization!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontFamily: 'Almarai',
                    color: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.color
                        ?.withOpacity(0.7),
                  ),
            ),
          ],
          if (member.email != null) ...[
            const SizedBox(height: 4),
            Text(
              member.email!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontFamily: 'Poppins',
                  ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildConnector(BuildContext context) {
    return Container(
      width: 2,
      height: 20,
      color: Theme.of(context).dividerColor,
    );
  }
}

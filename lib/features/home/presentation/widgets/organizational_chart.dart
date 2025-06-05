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
    final locale = Localizations.localeOf(context).languageCode;

    // Find the head
    final heads = staff
        .where((member) =>
            member.position?.contains('رئيس قسم') == true ||
            member.position?.toLowerCase().contains('head') == true)
        .toList();

    // Filter out head from regular staff
    final regularStaff =
        staff.where((member) => !heads.contains(member)).toList();
    final academicStaff = AcademicStaff.fromList(regularStaff);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLevel(
            context,
            title: 'staff.department_head'.tr(context),
            members: heads,
            icon: Icons.account_balance,
            color: const Color(0xFF9A34B9),
            locale: locale,
            isHead: true,
          ),
          if (heads.isNotEmpty) _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.professors'.tr(context),
            members: academicStaff.professors,
            icon: Icons.school,
            color: Theme.of(context).primaryColor,
            locale: locale,
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.associate_professors'.tr(context),
            members: academicStaff.associateProfessors,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withGreen(150),
            locale: locale,
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.assistant_professors'.tr(context),
            members: academicStaff.assistantProfessors,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withBlue(100),
            locale: locale,
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.lecturers'.tr(context),
            members: academicStaff.lecturers,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withRed(180),
            locale: locale,
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.assistant_lecturers'.tr(context),
            members: academicStaff.assistantLecturers,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            locale: locale,
          ),
          _buildConnector(context),
          _buildLevel(
            context,
            title: 'staff.teaching_assistants'.tr(context),
            members: academicStaff.teachingAssistants,
            icon: Icons.school,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            locale: locale,
          ),
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
    required String locale,
    bool isHead = false,
  }) {
    if (members.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                .map((member) => _buildMemberCard(
                    context, member, color, icon, locale, isHead))
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
    String locale,
    bool isHead,
  ) {
    return Container(
      width: isHead ? 250 : 200,
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
          Icon(icon, color: color, size: isHead ? 32 : 24),
          const SizedBox(height: 8),
          Text(
            "${member.getTitle(locale)} ${member.getName(locale)}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isHead ? 16 : null,
                ),
          ),
          if (member.position != null && isHead) ...[
            const SizedBox(height: 4),
            Text(
              member.position!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
          if (member.specializationEn != null) ...[
            const SizedBox(height: 4),
            Text(
              member.getSpecialization(locale)!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
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

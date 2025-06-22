import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../data/models/staff_model.dart';
import 'department_connector.dart';
import 'department_level.dart';

class OrganizationalChart extends StatelessWidget {
  final List<StaffMember> staff;

  const OrganizationalChart({
    super.key,
    this.staff = const [],
  });

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final heads = staff
        .where((member) =>
            member.position?.contains('رئيس قسم') == true ||
            member.position?.toLowerCase().contains('head') == true)
        .toList();
    // Filter out head from regular staff
    final regularStaff =
        staff.where((member) => !heads.contains(member)).toList();
    final academicStaff = AcademicStaff.fromList(regularStaff);
    // Custom colors for each rank
    final rankColors = [
      const Color(0xFF9A34B9), // Department Head - Purple
      const Color(0xFF1565C0), // Professors - Blue
      const Color(0xFF00838F), // Associate Professors - Teal
      const Color(0xFF2E7D32), // Assistant Professors - Green
      const Color(0xFFE65100), // Lecturers - Orange
      const Color(0xFF6D4C41), // Assistant Lecturers - Brown
      const Color(0xFF546E7A), // Teaching Assistants - Bluegrey
    ];
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DepartmentLevel(
            title: 'staff.department_head'.tr(context),
            members: heads,
            icon: IconlyBold.work,
            color: rankColors[0],
            locale: locale,
            isHead: true,
          ),
          if (heads.isNotEmpty)
            Center(child: DepartmentConnector(color: rankColors[0])),
          DepartmentLevel(
            title: 'staff.professors'.tr(context),
            members: academicStaff.professors,
            icon: FontAwesomeIcons.graduationCap,
            color: rankColors[1],
            locale: locale,
          ),
          Center(child: DepartmentConnector(color: rankColors[1])),
          DepartmentLevel(
            title: 'staff.associate_professors'.tr(context),
            members: academicStaff.associateProfessors,
            icon: FontAwesomeIcons.userTie,
            color: rankColors[2],
            locale: locale,
          ),
          Center(child: DepartmentConnector(color: rankColors[2])),
          DepartmentLevel(
            title: 'staff.assistant_professors'.tr(context),
            members: academicStaff.assistantProfessors,
            icon: FontAwesomeIcons.bookOpenReader,
            color: rankColors[3],
            locale: locale,
          ),
          Center(child: DepartmentConnector(color: rankColors[3])),
          DepartmentLevel(
            title: 'staff.lecturers'.tr(context),
            members: academicStaff.lecturers,
            icon: FontAwesomeIcons.bookOpenReader,
            color: rankColors[4],
            locale: locale,
          ),
          Center(child: DepartmentConnector(color: rankColors[4])),
          DepartmentLevel(
            title: 'staff.assistant_lecturers'.tr(context),
            members: academicStaff.assistantLecturers,
            icon: FontAwesomeIcons.chalkboardUser,
            color: rankColors[5],
            locale: locale,
          ),
          Center(child: DepartmentConnector(color: rankColors[5])),
          DepartmentLevel(
            title: 'staff.teaching_assistants'.tr(context),
            members: academicStaff.teachingAssistants,
            icon: Icons.school_rounded,
            color: rankColors[6],
            locale: locale,
          ),
        ],
      ),
    );
  }
}

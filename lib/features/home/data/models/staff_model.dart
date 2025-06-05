class StaffMember {
  final String nameEn;
  final String nameAr;
  final String titleEn;
  final String titleAr;
  final String? email;
  final String? specializationEn;
  final String? specializationAr;
  final String? department;
  final String? position;

  const StaffMember({
    required this.nameEn,
    required this.nameAr,
    required this.titleEn,
    required this.titleAr,
    this.email,
    this.specializationEn,
    this.specializationAr,
    this.department,
    this.position,
  });

  String? getSpecialization(String locale) => locale == 'ar' ? specializationAr : specializationEn;
  String getName(String locale) => locale == 'ar' ? nameAr : nameEn;
  String getTitle(String locale) => locale == 'ar' ? titleAr : titleEn;

  // Helper method to determine staff rank
  int getRank() {
    final titleLower = titleEn.toLowerCase();
    if (titleLower.contains('prof') &&
        !titleLower.contains('assoc') &&
        !titleLower.contains('assist')) {
      return 5; // Full Professor
    } else if (titleLower.contains('assoc') && titleLower.contains('prof')) {
      return 4; // Associate Professor
    } else if (titleLower.contains('dr')) {
      return 3; // Doctor
    } else if (titleLower.contains('assist') && titleLower.contains('lect')) {
      return 1; // Assistant Lecturer
    } else if (titleLower.contains('teach') && titleLower.contains('assist')) {
      return 0; // Teaching Assistant
    } else if (titleLower.contains('lecturer')) {
      return 2; // Lecturer
    }
    return 0; // Default to Teaching Assistant
  }
}

class AcademicStaff {
  final List<StaffMember> professors;
  final List<StaffMember> associateProfessors;
  final List<StaffMember> assistantProfessors;
  final List<StaffMember> lecturers;
  final List<StaffMember> assistantLecturers;
  final List<StaffMember> teachingAssistants;

  const AcademicStaff({
    required this.professors,
    required this.associateProfessors,
    required this.assistantProfessors,
    required this.lecturers,
    required this.assistantLecturers,
    required this.teachingAssistants,
  });

  factory AcademicStaff.fromList(List<StaffMember> staff) {
    // Sort staff by rank
    final staffList = List<StaffMember>.from(staff);
    staffList.sort((a, b) => b.getRank().compareTo(a.getRank()));

    return AcademicStaff(
      professors: staffList.where((member) => member.getRank() == 5).toList(),
      associateProfessors:
          staffList.where((member) => member.getRank() == 4).toList(),
      assistantProfessors:
          staffList.where((member) => member.getRank() == 3).toList(),
      lecturers: staffList.where((member) => member.getRank() == 2).toList(),
      assistantLecturers:
          staffList.where((member) => member.getRank() == 1).toList(),
      teachingAssistants:
          staffList.where((member) => member.getRank() == 0).toList(),
    );
  }

  List<StaffMember> getAllStaffSorted() {
    return [
      ...professors,
      ...associateProfessors,
      ...assistantProfessors,
      ...lecturers,
      ...assistantLecturers,
      ...teachingAssistants,
    ];
  }

  String getFormattedStaff(String locale) {
    final titles = {
      'ar': {
        'head': 'رئيس القسم',
        'professors': 'الأساتذة',
        'associateProfessors': 'الأساتذة المساعدون',
        'assistantProfessors': 'المدرسون',
        'lecturers': 'المدرسون',
        'assistantLecturers': 'المدرسون المساعدون',
        'teachingAssistants': 'المعيدون',
      },
      'en': {
        'head': 'Department Head',
        'professors': 'Professors',
        'associateProfessors': 'Associate Professors',
        'assistantProfessors': 'Assistant Professors',
        'lecturers': 'Lecturers',
        'assistantLecturers': 'Assistant Lecturers',
        'teachingAssistants': 'Teaching Assistants',
      },
    };

    final result = StringBuffer();

    // Find the department head
    StaffMember? departmentHead;
    for (var category in [
      professors,
      associateProfessors,
      assistantProfessors,
      lecturers,
      assistantLecturers,
      teachingAssistants
    ]) {
      for (var member in category) {
        if (member.position?.toLowerCase().contains('head') == true ||
            member.position?.contains('رئيس') == true) {
          departmentHead = member;
          break;
        }
      }
      if (departmentHead != null) break;
    }

    // Display department head first
    if (departmentHead != null) {
      result.writeln('${titles[locale]!['head']}:');
      result.write(
          '- ${departmentHead.getTitle(locale)} ${departmentHead.getName(locale)}');
      if (departmentHead.email != null) {
        result.write(' - ${departmentHead.email}');
      }
      result.writeln();
      if (departmentHead.specializationEn != null) {
        result.writeln('  ${departmentHead.specializationEn}');
      }
      result.writeln();
    }

    final allCategories = [
      professors,
      associateProfessors,
      assistantProfessors,
      lecturers,
      assistantLecturers,
      teachingAssistants,
    ];

    final allTitles = [
      titles[locale]!['professors']!,
      titles[locale]!['associateProfessors']!,
      titles[locale]!['assistantProfessors']!,
      titles[locale]!['lecturers']!,
      titles[locale]!['assistantLecturers']!,
      titles[locale]!['teachingAssistants']!,
    ];

    for (var i = 0; i < allCategories.length; i++) {
      var categoryMembers = allCategories[i];
      // Remove head from their original category to avoid duplication
      if (departmentHead != null) {
        categoryMembers = categoryMembers
            .where((member) => member != departmentHead)
            .toList();
      }

      if (categoryMembers.isNotEmpty) {
        result.writeln('${allTitles[i]}:');
        for (var member in categoryMembers) {
          result
              .write('- ${member.getTitle(locale)} ${member.getName(locale)}');
          if (member.email != null) {
            result.write(' - ${member.email}');
          }
          result.writeln();
          if (member.specializationEn != null) {
            result.writeln('  ${member.specializationEn}');
          }
        }
        result.writeln();
      }
    }

    return result.toString().trim();
  }
}

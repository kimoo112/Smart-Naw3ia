class StaffMember {
  final String name;
  final String position;
  final String? email;
  final String? specialization;
  final String? department;

  const StaffMember({
    required this.name,
    required this.position,
    this.email,
    this.specialization,
    this.department,
  });
}

class OrganizedStaff {
  final StaffMember? manager;
  final List<StaffMember> professors;
  final List<StaffMember> associateProfessors;
  final List<StaffMember> assistantProfessors;
  final List<StaffMember> lecturers;
  final List<StaffMember> teachingAssistants;
  final List<StaffMember> demonstrators;
  final List<StaffMember> otherStaff;

  const OrganizedStaff({
    this.manager,
    this.professors = const [],
    this.associateProfessors = const [],
    this.assistantProfessors = const [],
    this.lecturers = const [],
    this.teachingAssistants = const [],
    this.demonstrators = const [],
    this.otherStaff = const [],
  });

  factory OrganizedStaff.fromList(List<StaffMember> staff) {
    StaffMember? manager;
    final List<StaffMember> professors = [];
    final List<StaffMember> associateProfessors = [];
    final List<StaffMember> assistantProfessors = [];
    final List<StaffMember> lecturers = [];
    final List<StaffMember> teachingAssistants = [];
    final List<StaffMember> demonstrators = [];
    final List<StaffMember> otherStaff = [];

    for (var member in staff) {
      final position = member.position.toLowerCase();
      
      if (position.contains('رئيس') || position.contains('مدير')) {
        manager = member;
      } else if (position.contains('أستاذ') && !position.contains('مساعد')) {
        professors.add(member);
      } else if (position.contains('أستاذ مساعد')) {
        associateProfessors.add(member);
      } else if (position.contains('مدرس') && !position.contains('مساعد')) {
        lecturers.add(member);
      } else if (position.contains('مدرس مساعد')) {
        teachingAssistants.add(member);
      } else if (position.contains('معيد')) {
        demonstrators.add(member);
      } else {
        otherStaff.add(member);
      }
    }

    return OrganizedStaff(
      manager: manager,
      professors: professors,
      associateProfessors: associateProfessors,
      assistantProfessors: assistantProfessors,
      lecturers: lecturers,
      teachingAssistants: teachingAssistants,
      demonstrators: demonstrators,
      otherStaff: otherStaff,
    );
  }
}
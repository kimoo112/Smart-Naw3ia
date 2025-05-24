import 'package:flutter/material.dart';
import '../data/models/staff_model.dart';

class OrganizationalChart extends StatelessWidget {
  final List<StaffMember> staff;

  const OrganizationalChart({
    super.key,
    required this.staff,
  });

  @override
  Widget build(BuildContext context) {
    final organizedStaff = OrganizedStaff.fromList(staff);

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildLevel(
            context,
            'رئيس القسم',
            [organizedStaff.manager].whereType<StaffMember>().toList(),
            Colors.blue,
            Icons.person,
          ),
          _buildConnector(),
          _buildLevel(
            context,
            'أستاذ',
            organizedStaff.professors,
            Colors.green,
            Icons.school,
          ),
          _buildConnector(),
          _buildLevel(
            context,
            'أستاذ مساعد',
            organizedStaff.associateProfessors,
            Colors.orange,
            Icons.work,
          ),
          _buildConnector(),
          _buildLevel(
            context,
            'مدرس',
            organizedStaff.lecturers,
            Colors.purple,
            Icons.person_outline,
          ),
          _buildConnector(),
          _buildLevel(
            context,
            'مدرس مساعد',
            organizedStaff.teachingAssistants,
            Colors.teal,
            Icons.assignment_ind,
          ),
          _buildConnector(),
          _buildLevel(
            context,
            'معيد',
            organizedStaff.demonstrators,
            Colors.indigo,
            Icons.school_outlined,
          ),
          if (organizedStaff.otherStaff.isNotEmpty) ...[
            _buildConnector(),
            _buildLevel(
              context,
              'أعضاء آخرون',
              organizedStaff.otherStaff,
              Colors.grey,
              Icons.people,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildLevel(
    BuildContext context,
    String title,
    List<StaffMember> members,
    Color color,
    IconData icon,
  ) {
    if (members.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: members.map((member) => _buildMemberCard(context, member, color, icon)).toList(),
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
        color: Colors.white,
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
                ),
          ),
          if (member.specialization != null) ...[
            const SizedBox(height: 4),
            Text(
              member.specialization!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
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

  Widget _buildConnector() {
    return Container(
      width: 2,
      height: 20,
      color: Colors.grey[300],
    );
  }
} 
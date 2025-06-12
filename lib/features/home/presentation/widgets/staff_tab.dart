import 'package:flutter/material.dart';
import '../../data/models/staff_model.dart';
import 'organizational_chart.dart';

class StaffTab extends StatelessWidget {
  final List<StaffMember> staff;

  const StaffTab({
    super.key,
    required this.staff,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          OrganizationalChart(staff: staff),
        ],
      ),
    );
  }
} 

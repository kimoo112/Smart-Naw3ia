import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Column(
          children: children
              .asMap()
              .entries
              .map((entry) => Column(
                    children: [
                      entry.value,
                      if (entry.key < children.length - 1)
                        const Divider(indent: 16, endIndent: 16),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

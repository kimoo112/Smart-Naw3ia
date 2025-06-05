import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestionChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SuggestionChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 10.sp,
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
      side: BorderSide(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
      ),
      onPressed: onTap,
    );
  }
}

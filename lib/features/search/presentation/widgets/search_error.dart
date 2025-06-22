import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchError extends StatelessWidget {
  const SearchError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 56.sp, color: Colors.redAccent),
          SizedBox(height: 12.h),
          Text(
            message,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.redAccent),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

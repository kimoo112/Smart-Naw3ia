import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
    this.trailingIcon,
  });

  final IconData icon;
  final String title;
  final String content;
  final VoidCallback? onTap;
  final IconData? trailingIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: FaIcon(
                  icon,
                  color: theme.primaryColor,
                  size: 24.r,
                ),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      content,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 13.sp,
                        color:
                            theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (trailingIcon != null) ...[
                      FaIcon(
                        trailingIcon,
                        size: 20.r,
                        color: theme.primaryColor.withOpacity(0.7),
                      ),
                      8.horizontalSpace,
                    ],
                    FaIcon(
                      FontAwesomeIcons.chevronRight,
                      size: 16.r,
                      color: theme.primaryColor.withOpacity(0.5),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
} 
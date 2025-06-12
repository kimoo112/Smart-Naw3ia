import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_naw3ia/core/ui/animated_container_widget.dart';
import 'package:smart_naw3ia/core/ui/notification_badge.dart';
import 'package:smart_naw3ia/core/utils/animation_utils.dart';

class WelcomeSection extends StatelessWidget {
  final String name;
  final bool hasUnreadNotifications;
  final VoidCallback onNotificationTap;

  const WelcomeSection({
    super.key,
    required this.name,
    required this.hasUnreadNotifications,
    required this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainerWidget(
      delay: AnimationUtils.staggeredDelay(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 16.sp,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onNotificationTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  IconlyLight.notification,
                  size: 24.r,
                ),
                NotificationBadge(isVisible: hasUnreadNotifications),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

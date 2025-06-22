import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/translation_extension.dart';
import '../../../login/data/services/guest_name_service.dart';
import '../../../settings/data/services/logout_service.dart';

class GuestWarning extends StatelessWidget {
  const GuestWarning({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.amber,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.amber,
                size: 20.r,
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'restrictions.profile_edit_message'.tr(context),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber[800],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  GuestNameService.showGuestNameEditDialog(context);
                },
                icon: const Icon(Icons.edit),
                label: Text('guest.edit_name'.tr(context)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
              // Login button
              OutlinedButton(
                onPressed: () {
                  LogoutService.logout(context);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Text('restrictions.login'.tr(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/routes/functions/navigation_functions.dart';
import '../../../../core/routes/routes.dart';

class LogoutService {
  static Future<void> logout(BuildContext context) async {
    // Clear all user data from cache
    await CacheHelper.removeData(key: 'studentNumber');
    await CacheHelper.removeData(key: 'studentName');
    await CacheHelper.removeData(key: 'studentNameEn');
    await CacheHelper.removeData(key: 'studentEmail');
    await CacheHelper.removeData(key: 'studentPhone');
    await CacheHelper.removeData(key: 'studentDepartment');
    await CacheHelper.removeData(key: 'studentDepartmentEn');
    await CacheHelper.removeData(key: 'studentProgram');
    await CacheHelper.removeData(key: 'studentProgramEn');
    await CacheHelper.removeData(key: 'studentLevel');
    await CacheHelper.removeData(key: 'studentLevelEn');
    await CacheHelper.removeData(key: 'studentGPA');
    await CacheHelper.removeData(key: 'studentStatus');
    await CacheHelper.removeData(key: 'studentStatusEn');
    await CacheHelper.removeData(key: 'isGuest');
    if (context.mounted) {
      customReplacementAndRemove(context, loginView);
    }
  }
}

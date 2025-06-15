import 'package:flutter/material.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../../../core/routes/functions/navigation_functions.dart';
import '../../../../core/routes/routes.dart';

/// Service to manage guest permissions in the app
class GuestPermissionsService {
  /// Check if the current user is a guest
  static bool isGuest() {
    return CacheHelper.getData(key: 'isGuest') == true;
  }

  /// Restricted features for guest users
  static const List<String> restrictedFeatures = [
    'calendar_interaction',
    'profile_edit',
    'course_registration',
    'form_submission',
    'personal_chat',
  ];

  /// Check if a specific feature is restricted for guests
  static bool isFeatureRestricted(String featureKey) {
    if (!isGuest()) return false;
    return restrictedFeatures.contains(featureKey);
  }

  /// Show a dialog to inform the user that a feature is restricted
  static Future<void> showGuestRestrictionDialog(
    BuildContext context,
    String featureKey, {
    VoidCallback? onContinueAsGuest,
  }) async {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'restrictions.guest_mode_title'.tr(context),
            textAlign: isAr ? TextAlign.right : TextAlign.left,
          ),
          content: Text(
            'restrictions.${featureKey}_message'.tr(context),
            textAlign: isAr ? TextAlign.right : TextAlign.left,
          ),
          actions: <Widget>[
            if (onContinueAsGuest != null)
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onContinueAsGuest();
                },
                child: Text('restrictions.continue_as_guest'.tr(context)),
              ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                customNavigate(context, loginView);
              },
              child: Text(
                'restrictions.login'.tr(context),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

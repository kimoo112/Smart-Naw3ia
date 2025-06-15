import 'package:flutter/material.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/localization/translation_extension.dart';

/// Service to manage guest name changes
class GuestNameService {
  /// Update the guest user's name
  static Future<bool> updateGuestName({
    required String nameEn,
    required String nameAr,
    required BuildContext context,
  }) async {
    try {
      await CacheHelper.saveData(key: 'studentName', value: nameAr);
      await CacheHelper.saveData(key: 'studentNameEn', value: nameEn);

      // Trigger rebuild of the profile view
      if (context.mounted) {
        Navigator.of(context).pop(); // Close the dialog
        Navigator.of(context)
            .pushReplacementNamed('/profile'); // Rebuild profile view
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  /// Show a dialog to edit guest name
  static Future<void> showGuestNameEditDialog(BuildContext context) async {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';

    // Get current name values
    final currentNameEn = CacheHelper.getData(key: 'studentNameEn') ?? 'Guest';
    final currentNameAr = CacheHelper.getData(key: 'studentName') ?? 'زائر';

    // Create controllers with current values
    final nameEnController = TextEditingController(text: currentNameEn);
    final nameArController = TextEditingController(text: currentNameAr);

    // Show dialog
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'guest.edit_name_title'.tr(context),
            textAlign: isAr ? TextAlign.right : TextAlign.left,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameEnController,
                decoration: InputDecoration(
                  labelText: 'guest.name_en'.tr(context),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameArController,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  labelText: 'guest.name_ar'.tr(context),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text('common.cancel'.tr(context)),
            ),
            TextButton(
              onPressed: () async {
                // Update name
                final success = await updateGuestName(
                  nameEn: nameEnController.text.isNotEmpty
                      ? nameEnController.text
                      : 'Guest',
                  nameAr: nameArController.text.isNotEmpty
                      ? nameArController.text
                      : 'زائر',
                  context: context,
                );

                if (success && dialogContext.mounted) {
                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('guest.name_updated'.tr(context)),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              child: Text(
                'common.save'.tr(context),
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

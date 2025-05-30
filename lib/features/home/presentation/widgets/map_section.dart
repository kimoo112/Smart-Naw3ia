import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'موقع الكلية',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: InkWell(
            onTap: () => _launchMap(),
            borderRadius: BorderRadius.circular(12.r),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                  child: Image.network(
                    'https://maps.googleapis.com/maps/api/staticmap?center=31.2045,29.9127&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7C31.2045,29.9127',
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200.h,
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.surface,
                        child: Center(
                          child: Icon(
                            Icons.map,
                            size: 48.r,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 24.r,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          '14 شارع محمد أمين شهيب - مصطفى كامل',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.r,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchMap() async {
    const url = 'https://www.google.com/maps/search/?api=1&query=31.2045,29.9127';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

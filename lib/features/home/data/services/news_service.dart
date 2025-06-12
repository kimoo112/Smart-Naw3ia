import 'package:url_launcher/url_launcher.dart';

class NewsService {
  static const String arabicUrl = 'https://edusp.alexu.edu.eg/index.php/ar/';
  static const String englishUrl = 'https://edusp.alexu.edu.eg/index.php/en/';

  static Future<void> launchNewsUrl(String locale) async {
    final url = locale == 'ar' ? arabicUrl : englishUrl;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

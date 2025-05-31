import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import '../models/news_model.dart';


class NewsService {
  static const String arabicUrl = 'https://edusp.alexu.edu.eg/index.php/ar/';
  static const String englishUrl = 'https://edusp.alexu.edu.eg/index.php/en/';

  static Future<List<NewsModel>> fetchNews() async {
    final List<NewsModel> allNews = [];

    // Fetch Arabic news
    final arResponse = await http.get(Uri.parse(arabicUrl));
    if (arResponse.statusCode == 200) {
      final arDocument = parse(arResponse.body);
      final arNewsElements = arDocument.querySelectorAll(
          '.news-item'); // Adjust selector based on actual HTML structure

      for (var element in arNewsElements) {
        final titleAr = element.querySelector('.title')?.text.trim() ?? '';
        final categoryAr =
            element.querySelector('.category')?.text.trim() ?? '';
        final date = element.querySelector('.date')?.text.trim() ?? '';
        final link = element.querySelector('a')?.attributes['href'] ?? '';
        final descriptionAr =
            element.querySelector('.description')?.text.trim();

        // Store Arabic news temporarily
        allNews.add(NewsModel(
          titleAr: titleAr,
          titleEn: '', // Will be filled with English version
          categoryAr: categoryAr,
          categoryEn: '', // Will be filled with English version
          date: date,
          descriptionAr: descriptionAr,
          link: link.startsWith('http')
              ? link
              : 'https://edusp.alexu.edu.eg$link',
        ));
      }
    }

    // Fetch English news
    final enResponse = await http.get(Uri.parse(englishUrl));
    if (enResponse.statusCode == 200) {
      final enDocument = parse(enResponse.body);
      final enNewsElements = enDocument.querySelectorAll(
          '.news-item'); // Adjust selector based on actual HTML structure

      for (var i = 0; i < enNewsElements.length && i < allNews.length; i++) {
        final element = enNewsElements[i];
        final titleEn = element.querySelector('.title')?.text.trim() ?? '';
        final categoryEn =
            element.querySelector('.category')?.text.trim() ?? '';
        final descriptionEn =
            element.querySelector('.description')?.text.trim();

        // Update existing news with English version
        allNews[i] = NewsModel(
          titleAr: allNews[i].titleAr,
          titleEn: titleEn,
          categoryAr: allNews[i].categoryAr,
          categoryEn: categoryEn,
          date: allNews[i].date,
          descriptionAr: allNews[i].descriptionAr,
          descriptionEn: descriptionEn,
          link: allNews[i].link,
        );
      }
    }

    return allNews;
  }
}

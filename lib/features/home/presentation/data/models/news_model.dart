class NewsModel {
  final String title;
  final String category;
  final String date;
  final String? description;
  final String? link;

  const NewsModel({
    required this.title,
    required this.category,
    required this.date,
    this.description,
    this.link,
  });
}

final List<NewsModel> newsList = [
  const NewsModel(
    title: 'بدء التسجيل للتربية العملية للمستوى الثالث',
    category: 'طلاب',
    date: '2024-03-20',
    description: 'يبدأ التسجيل للتربية العملية للمستوى الثالث يوم الأحد الموافق 24/3/2024',
    link: 'https://edusp.alexu.edu.eg/index.php/ar/',
  ),
  const NewsModel(
    title: 'مؤتمر كلية التربية النوعية الرابع',
    category: 'فعاليات',
    date: '2024-03-18',
    description: 'تحت رعاية السيد الأستاذ الدكتور رئيس الجامعة، تنظم كلية التربية النوعية مؤتمرها الرابع',
    link: 'https://edusp.alexu.edu.eg/index.php/ar/',
  ),
  const NewsModel(
    title: 'نتائج امتحانات الفصل الدراسي الأول',
    category: 'نتائج',
    date: '2024-03-15',
    link: 'https://edusp.alexu.edu.eg/index.php/ar/',
  ),
  const NewsModel(
    title: 'استبيان قياس رضا الطلاب عن اعمال التقويم والامتحانات',
    category: 'استبيانات',
    date: '2024-03-10',
    link: 'https://edusp.alexu.edu.eg/index.php/ar/',
  ),
  const NewsModel(
    title: 'برنامج رعاية الطلاب المتفوقين و المبدعين',
    category: 'طلاب',
    date: '2024-03-05',
    link: 'https://edusp.alexu.edu.eg/index.php/ar/',
  ),
  const NewsModel(
    title: 'برنامج متابعة الطلاب المتعثرين',
    category: 'طلاب',
    date: '2024-03-01',
    link: 'https://edusp.alexu.edu.eg/index.php/ar/',
  ),
]; 
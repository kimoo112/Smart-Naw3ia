class DepartmentModel {
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String headEn;
  final String headAr;
  final List<String> objectivesEn;
  final List<String> objectivesAr;
  final List<String> coursesEn;
  final List<String> coursesAr;
  final List<String> facultyMembersEn;
  final List<String> facultyMembersAr;

  const DepartmentModel({
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.headEn,
    required this.headAr,
    required this.objectivesEn,
    required this.objectivesAr,
    required this.coursesEn,
    required this.coursesAr,
    required this.facultyMembersEn,
    required this.facultyMembersAr,
  });

  String getName(String locale) => locale == 'ar' ? nameAr : nameEn;
  String getDescription(String locale) =>
      locale == 'ar' ? descriptionAr : descriptionEn;
  String getHead(String locale) => locale == 'ar' ? headAr : headEn;
  List<String> getObjectives(String locale) =>
      locale == 'ar' ? objectivesAr : objectivesEn;
  List<String> getCourses(String locale) =>
      locale == 'ar' ? coursesAr : coursesEn;
  List<String> getFacultyMembers(String locale) =>
      locale == 'ar' ? facultyMembersAr : facultyMembersEn;
}

// Sample data for departments
final List<DepartmentModel> departmentsList = [
  const DepartmentModel(
    nameEn: 'Educational Technology',
    nameAr: 'تكنولوجيا التعليم',
    descriptionEn:
        'The Department of Educational Technology is one of the specialized academic departments at the Faculty of Specific Education, Alexandria University. It focuses on preparing cadres capable of using and employing modern technology in the educational process through designing, producing, and evaluating educational media and software.',
    descriptionAr:
        'قسم تكنولوجيا التعليم هو أحد الأقسام الأكاديمية المتخصصة في كلية التربية النوعية جامعة الإسكندرية.، يهتم بإعداد كوادر قادرة على استخدام وتوظيف التكنولوجيا الحديثة في العملية التعليمية، من خلال تصميم، إنتاج، وتقييم الوسائط التعليمية والبرمجيات.',
    headEn: 'Prof. Dr. Amal Karam Khalifa',
    headAr: 'أ.د/ أمل كرم خليفة',
    objectivesEn: [
      'Preparing specialized teachers in educational technology',
      'Qualifying specialists to work in educational and media institutions',
      'Developing technological skills necessary for designing and producing educational content',
      'Supporting digital transformation in educational institutions'
    ],
    objectivesAr: [
      'إعداد معلمين متخصصين في مجال تكنولوجيا التعليم',
      'تأهيل أخصائيين للعمل بالمؤسسات التعليمية والإعلامية',
      'تنمية المهارات التكنولوجية اللازمة لتصميم وإنتاج المحتوى التعليمي',
      'دعم التحول الرقمي في المؤسسات التعليمية'
    ],
    coursesEn: [
      'Introduction to Educational Technology',
      'Design and Production of Educational Media',
      'Computer in Education',
      'Instructional Design',
      'E-Learning',
      'Digital Educational Materials Production',
      'Internet Use in Education',
      'Multimedia-Based Education'
    ],
    coursesAr: [
      'مدخل إلى تكنولوجيا التعليم',
      'تصميم وإنتاج الوسائل التعليمية',
      'الحاسب الآلي في التعليم',
      'تصميم التعليم',
      'التعليم الإلكتروني',
      'إنتاج المواد التعليمية الرقمية',
      'استخدام الإنترنت في التعليم',
      'التعليم القائم على الوسائط المتعددة'
    ],
    facultyMembersEn: [
      'Prof. Dr. Amal Karam Khalifa - Professor and Head of Department',
      'Assoc. Prof. Dr. Mohamed Wahid Mohamed Soliman - Associate Professor',
      'Dr. Hassan Ali - Lecturer',
      'Dr. Sherif Abdel Moneim - Lecturer',
      'Ms. Alaa Saad Sabry Assal - Teaching Assistant',
      'Ms. Kholoud Abdel Maksoud Mohamed Moqallad - Teaching Assistant',
      'Ms. Marwa Abdullah - Teaching Assistant',
      'Ms. Asmaa Ali - Teaching Assistant'
    ],
    facultyMembersAr: [
      'أ.د/ أمل كرم خليفة – أستاذ، والقائم بعمل رئيس القسم',
      'أ.م.د/ محمد وحيد محمد سليمان – أستاذ مساعد',
      'د/ حسن علي – مدرس',
      'د/ شريف عبد المنعم – مدرس',
      'أ/ آلاء سعد صبري عسل – معيدة',
      'أ/ خلود عبد المقصود محمد مقلد – معيدة',
      'أ/مروة عبدالله – معيدة',
      'أ/ أسماء علي – معيدة'
    ],
  ),
  // Add more departments here
];

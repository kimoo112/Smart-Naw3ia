class FacultyInfoModel {
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String categoryEn;
  final String categoryAr;

  const FacultyInfoModel({
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.categoryEn,
    required this.categoryAr,
  });

  String getTitle(String locale) => locale == 'ar' ? titleAr : titleEn;
  String getDescription(String locale) =>
      locale == 'ar' ? descriptionAr : descriptionEn;
  String getCategory(String locale) => locale == 'ar' ? categoryAr : categoryEn;
}

// Sample data for the faculty information
final List<FacultyInfoModel> facultyInfoList = [
  const FacultyInfoModel(
    titleEn: "Dean's Word",
    titleAr: 'كلمة العميد',
    descriptionEn:
        "Education is the foundation of renaissance and national security. In today's world, we are witnessing a massive scientific and technological revolution. To keep pace with rapid developments in various specialized fields, the Faculty of Specific Education at Alexandria University, with its noble mission and multiple roles, strives to achieve quality and excellence. We aim to prepare educationally qualified teachers with the highest level of scientific competence, equipping them with creative and technical skills in all fields.",
    descriptionAr:
        'يعتبر التعليـم أسـاس النهضة وأساس الأمن القومى وأن عالمنا اليوم تجتاحه ثورة علمية وتكنولوجيـة هائلـــة وحتـــى نستطيـــع مواكبــة التطـورات السريعة والمتلاحقة في مختلف المجالات النوعية ،لذا تسعى كلية التربية النوعية –جامعة الأسكـندرية-بمــا تحمله من رســالة ساميـة وما تقوم بـه مــن أدوار متعددة ومهام متنوعة تعد العمود الفقــري في تطوير المجتمــع وتحقيـــق أهدافـــه حيث تسعــى الكليــة جاهدة إلى تحقيــق الجـــودة والتميـــز وتبـــوء مكــانة مرمـوقة علـى خريطة التعليم العالي.',
    categoryEn: 'About',
    categoryAr: 'عن الكلية',
  ),
  const FacultyInfoModel(
    titleEn: 'Faculty Vision',
    titleAr: 'رؤية الكلية',
    descriptionEn:
        'Achieving excellence and leadership regionally and globally in various specific fields, and raising competitive capabilities in light of digital transformation.',
    descriptionAr:
        'تحقيق التميز والريادة إقليمياً وعالمياً في المجالات النوعية المختلفة، ورفع القدرات التنافسية في ضوء التحول الرقمي.',
    categoryEn: 'Vision',
    categoryAr: 'الرؤية',
  ),
  const FacultyInfoModel(
    titleEn: 'Faculty Mission',
    titleAr: 'رسالة الكلية',
    descriptionEn:
        'Preparing a creative and competitive graduate academically and professionally in terms of scientific and research aspects in postgraduate studies and research, and keeping pace with labor market requirements in light of Egypt\'s Vision 2030, achieving sustainable development for society.',
    descriptionAr:
        'إعداد خريج مبدع ومنافس أكاديمياً ومهنياً من حيث الجوانب العلمية والبحثية في الدراسات العليا والبحوث، ومواكبة متطلبات سوق العمل في ضوء رؤية مصر 2030، تحقيقاً للتنمية المستدامة للمجتمع.',
    categoryEn: 'Mission',
    categoryAr: 'الرسالة',
  ),
  const FacultyInfoModel(
    titleEn: 'Faculty History',
    titleAr: 'نشأة الكلية',
    descriptionEn:
        'The faculty was established by Presidential Decree No. (1096) on October 22, 1988, as one of four specialized faculties planned to be established in Egypt, with the aim of preparing qualified teachers to teach applied subjects such as home economics, music education, art education, and educational technology.',
    descriptionAr:
        'تأسست الكلية بموجب قرار جمهوري رقم (1096) بتاريخ 22 أكتوبر 1988، كواحدة من أربع كليات نوعية وتم التخطيط لإنشائها في مصر، بهدف اعداد معلمين مؤهلين لتدريس المواد التطبيقية مثل الاقتصاد المنزلي، التربية الموسيقية، والتربية الفنية، تكنولوجيا التعليم.',
    categoryEn: 'About',
    categoryAr: 'عن الكلية',
  ),
  const FacultyInfoModel(
    titleEn: 'Academic Programs and Departments',
    titleAr: 'البرامج الدراسية والأقسام الأكاديمية',
    descriptionEn:
        'Department of Home Economics, Department of Art Education, Department of Music Education, Department of Educational Technology, Department of Educational and Psychological Sciences.',
    descriptionAr:
        'قسم الاقتصاد المنزلي، قسم التربية الفنية، قسم التربية الموسيقية، قسم تكنولوجيا التعليم.',
    categoryEn: 'Departments',
    categoryAr: 'الأقسام',
  ),
  const FacultyInfoModel(
    titleEn: 'Current Administrative Structure',
    titleAr: 'الهيكل الإداري الحالي',
    descriptionEn:
        'Dean: Prof. Dr. Najda Ibrahim Mahmoud Madi (appointed by presidential decree in June 2023, professor in the Department of Home Economics). Vice Dean for Education and Student Affairs: Prof. Dr. Jihan Farouk Abu Al-Khair (appointed in July 2024 for three years).',
    descriptionAr:
        'العميد: أ.د: نجدة إبراهيم محمود ماضي (تم تعينها للكلية بقرار جمهوري في يونيو 2023 وهي أستاذة بقسم الاقتصاد المنزلي. الوكلاء: وكيل الكلية لشئون التعليم والطلاب: أ.د: جيهان فاروق أبو الخير ( تم تعينها في يوليو 2024 لمدة ثلاث سنوات).',
    categoryEn: 'Administration',
    categoryAr: 'الإدارة',
  ),
  const FacultyInfoModel(
    titleEn: 'Faculty Goals',
    titleAr: 'أهداف الكلية',
    descriptionEn:
        '1. Preparing qualified teachers for specific education fields\n2. Developing technical and creative skills for students\n3. Conducting scientific research in specialized fields\n4. Providing community service and environmental development\n5. Achieving quality standards in education\n6. Developing student skills to meet labor market needs\n7. Supporting digital transformation in education',
    descriptionAr:
        '1. إعداد معلمين مؤهلين في مجالات التعليم النوعي\n2. تنمية المهارات الفنية والإبداعية للطلاب\n3. إجراء البحوث العلمية في المجالات المتخصصة\n4. تقديم خدمة مجتمعية وتنمية بيئية\n5. تحقيق معايير الجودة في التعليم\n6. تطوير مهارات الطلاب لتلبية احتياجات سوق العمل\n7. دعم التحول الرقمي في التعليم',
    categoryEn: 'Goals',
    categoryAr: 'الأهداف',
  ),
];

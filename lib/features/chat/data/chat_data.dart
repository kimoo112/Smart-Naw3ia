class ChatQuestion {
  final String questionEn;
  final String questionAr;
  final String answerEn;
  final String answerAr;

  const ChatQuestion({
    required this.questionEn,
    required this.questionAr,
    required this.answerEn,
    required this.answerAr,
  });
}

const List<ChatQuestion> suggestedQuestions = [
  // College Information
  ChatQuestion(
    questionEn: 'Tell me about the college history and establishment',
    questionAr: 'أخبرني عن تاريخ ونشأة الكلية',
    answerEn:
        'The college was established by Presidential Decree No. 1096 on October 22, 1988, as one of four specialized colleges planned in Egypt. Its purpose was to prepare qualified teachers for applied subjects such as Home Economics, Music Education, Art Education, and Educational Technology.',
    answerAr:
        'تأسست الكلية بموجب قرار جمهوري رقم (1096) بتاريخ 22 أكتوبر 1988، كواحدة من أربع كليات نوعية وتم التخطيط لإنشائها في مصر، بهدف اعداد معلمين مؤهلين لتدريس المواد التطبيقية مثل الاقتصاد المنزلي، التربية الموسيقية، والتربية الفنية، تكنولوجيا التعليم.',
  ),

  // Academic Calendar and Semesters
  ChatQuestion(
    questionEn: 'When do the academic semesters start?',
    questionAr: 'مواعيد الترم الدراسي تبدأ إمتى؟',
    answerEn:
        'The first semester starts in the first week of October, and the second semester starts in mid-February.',
    answerAr:
        'الترم الأول بيبدأ في الأسبوع الأول من أكتوبر، والترم التاني في منتصف فبراير',
  ),

  // Student Services and Procedures
  ChatQuestion(
    questionEn: 'How can I get an enrollment certificate?',
    questionAr: 'أعمل إثبات قيد منين؟',
    answerEn:
        'You can get it from Student Affairs, it will be ready on the same day or the next day.',
    answerAr: 'من شؤون الطلاب، وبيطلع في نفس اليوم أو تاني يوم.',
  ),

  ChatQuestion(
    questionEn: 'How do I submit a semester or exam withdrawal?',
    questionAr: 'إزاي أقدّم اعتذار عن الترم أو امتحان؟',
    answerEn:
        'Submit an official request with the reason for withdrawal to Student Affairs before the exams period.',
    answerAr:
        'بتقدم طلب رسمي مع سبب الاعتذار لإدارة شؤون الطلاب قبل الامتحانات بفترة.',
  ),

  ChatQuestion(
    questionEn: 'What if I have a legal issue in college?',
    questionAr: 'لو حصلتلي مشكلة قانونية جوه الكلية؟',
    answerEn:
        'You can go to the Legal Support Unit or the Student Affairs Office.',
    answerAr: 'تقدر تتوجه لوحدة الدعم القانوني أو مكتب شؤون الطلبة.',
  ),

  ChatQuestion(
    questionEn: 'How do I apply for university housing?',
    questionAr: 'إزاي أقدم على التسكين في المدينة الجامعية؟',
    answerEn:
        'Applications are submitted online through the university website, followed by submitting required documents to the administration at the university housing.',
    answerAr:
        'التقديم بيكون إلكتروني على موقع الجامعة، وبعد كده بتقدم الأوراق المطلوبة للإدارة في المدينة الجامعية.',
  ),

  ChatQuestion(
    questionEn: 'Where can I find the schedules?',
    questionAr: 'الجداول بتنزل فين؟',
    answerEn: 'Schedules are posted on the official college website.',
    answerAr: 'الجداول بتنزل على الموقع الرسمي للكلية.',
  ),

  ChatQuestion(
    questionEn: 'What happens if I exceed 25% absence?',
    questionAr: 'لو غبت أكتر من 25% يحصل إيه؟',
    answerEn:
        'If you are absent three consecutive times, you will be prevented from taking the exam in that subject and will be considered failed.',
    answerAr:
        'لو تم الغياب ثلاث مرات متتالية الطالب بيمنع من دخول الامتحان في المادة دي وبيعتبر راسب فيها.',
  ),

  ChatQuestion(
    questionEn: 'What do I need to get a college ID card?',
    questionAr: 'إيه المطلوب عشان أعمل كارنيه الكلية؟',
    answerEn:
        'You need a personal photo, ID copy, enrollment certificate or tuition receipt, and funds in your visa card.',
    answerAr:
        'صورة شخصية، صورة البطاقة، إثبات القيد أو إيصال المصاريف وتكون حاطط فلوسك في الفيزا.',
  ),

  ChatQuestion(
    questionEn: 'How do I register for courses or sections?',
    questionAr: 'إزاي أسجل المواد أو الشُعب؟',
    answerEn:
        'Registration is done electronically or at Student Affairs according to the college system.',
    answerAr: 'التسجيل بيتم إلكتروني أو في شؤون الطلاب حسب نظام الكلية.',
  ),

  ChatQuestion(
    questionEn: 'How many credit hours per semester?',
    questionAr: 'النظام كام ساعة في الترم؟',
    answerEn:
        'It varies by specialization, but averages from 12 to 18 credit hours.',
    answerAr: 'بيختلف حسب التخصص، بس المتوسط من 12 لـ 18 ساعة معتمدة.',
  ),

  ChatQuestion(
    questionEn: 'Where are results posted?',
    questionAr: 'النتيجة بتظهر فين؟',
    answerEn: 'On the official university website or the student group.',
    answerAr: 'على موقع الجامعة الرسمي أو على جروب الطلاب.',
  ),

  ChatQuestion(
    questionEn: 'If I am late for an exam, can I enter?',
    questionAr: 'لو اتأخرت عن الامتحان، يدخلوني؟',
    answerEn:
        'You can enter within the first 15 minutes, after that it counts as absence.',
    answerAr: 'ممكن تدخل خلال أول 15 دقيقة، بعد كده بتتحسب غياب.',
  ),

  ChatQuestion(
    questionEn: 'What happens in case of cheating?',
    questionAr: 'لو حصل غش؟',
    answerEn:
        'You will be referred for investigation, which could result in suspension for one or more semesters.',
    answerAr: 'بتحوَّل للتحقيق، وممكن توصل لفصل ترم كامل أو أكتر.',
  ),

  ChatQuestion(
    questionEn: 'Are there student activities I can participate in?',
    questionAr: 'في أنشطة طلابية أقدر أشارك فيها؟',
    answerEn:
        'Yes, such as the Media Committee (with special admission requirements), student families, theater, sports activities, and trips.',
    answerAr:
        'أيوه، زي اللجنة الإعلامية وليها شروط خاصة للقبول والأسر الطلابية، المسرح، النشاط الرياضي، والرحلات.',
  ),

  ChatQuestion(
    questionEn: 'Is there medical care in college?',
    questionAr: 'في رعاية طبية في الكلية؟',
    answerEn:
        'Yes, the clinic is available with a resident doctor usually from 9 AM to 2 PM.',
    answerAr:
        'أيوه، العيادة موجودة وغالبًا فيها طبيب مقيم من 9 صباحًا لـ2 ظهرًا.',
  ),

  ChatQuestion(
    questionEn: 'I forgot my university account password, what should I do?',
    questionAr: 'نسيت الباسورد بتاع حسابي الجامعي، أعمل إيه؟',
    answerEn:
        'Go to Student Affairs or send a recovery request through the official website.',
    answerAr: 'تروح للشؤن أو تبعت طلب استرجاع من خلال الموقع الرسمي.',
  ),

  ChatQuestion(
    questionEn: 'How do I use the e-portal or learning platform?',
    questionAr: 'إزاي أستخدم البوابة الإلكترونية أو المنصة التعليمية؟',
    answerEn:
        'Log in with your university account and access lectures or assignments according to your schedule.',
    answerAr:
        'بتسجل دخول بحسابك الجامعي وتدخل على المحاضرات أو الواجبات حسب جدولك.',
  ),

  ChatQuestion(
    questionEn: 'Is there internet for students?',
    questionAr: 'في إنترنت للطلبة؟',
    answerEn:
        'Some colleges provide internal networks in the library or halls. It will be available for us as soon as possible.',
    answerAr:
        'بعض الكليات بتوفر شبكة داخلية في المكتبة أو القاعات. وسيتم توفيرة لدينا باقرب وقتت ممكن',
  ),

  ChatQuestion(
    questionEn: 'Where can I get course notes or materials?',
    questionAr: 'لو محتاج ملازم أو مذكرات المادة، أجيبها منين؟',
    answerEn:
        'From the copy center or from Ahmed, and some professors upload them on the platform.',
    answerAr:
        'من مركز التصوير أو من  عند أحمد، وبعض الدكاترة بينزلوها على المنصة.',
  ),

  ChatQuestion(
    questionEn: 'Can I contact a professor if I have a question?',
    questionAr: 'ينفع أراسل دكتور المادة لو عندي استفسار؟',
    answerEn:
        'Yes, some respond through university email or through chat on the platform.',
    answerAr:
        'أيوه، بعضهم بيرد على الإيميل الجامعي أو من خلال الشات على المنصة.',
  ),

  ChatQuestion(
    questionEn: 'Are lectures recorded?',
    questionAr: 'المحاضرات بتتسجل؟',
    answerEn:
        "It depends on the professor's system, but you should ask the professor first.",
    answerAr: 'ده حسب نظام الدكتور، بس ممكن تستأذن الدكتور الأول',
  ),

  ChatQuestion(
    questionEn: 'When is the deadline for paying tuition?',
    questionAr: 'آخر ميعاد لسداد المصاريف إمتى؟',
    answerEn:
        'Usually in the first month of the semester, or according to the announced schedule.',
    answerAr: 'عادة بيكون في أول شهر من الترم، أو حسب الجدول المعلن.',
  ),

  ChatQuestion(
    questionEn: 'Can I apply for a scholarship?',
    questionAr: 'ينفع أقدم على منحة؟',
    answerEn:
        'Yes, there are social and excellence scholarships. Submit your documents to Student Affairs or Social Care.',
    answerAr:
        'أيوه، في منح اجتماعية وتفوق، بتقدم أوراقك لشؤون الطلاب أو الرعاية الاجتماعية.',
  ),

  ChatQuestion(
    questionEn: 'Can I use an old ID card?',
    questionAr: 'لو معايا كارنيه قديم، ينفع أستخدمه؟',
    answerEn:
        'Yes, but you must renew your ID card every year to use it for official services.',
    answerAr:
        'ينفع،بس لازم تجدد الكارنيه كل سنة عشان تستخدمه في الخدمات الرسمية.',
  ),

  // What are the academic departments in the college?
  ChatQuestion(
    questionEn: 'What are the academic departments in the college?',
    questionAr: 'ما هي الأقسام الأكاديمية في الكلية؟',
    answerEn:
        'The college includes the following departments:\n\n1. Home Economics Department\n2. Art Education Department\n3. Music Education Department\n4. Educational Technology Department\n5. Educational and Psychological Sciences Department',
    answerAr:
        'تضم الكلية الأقسام التالية:\n\n1. قسم الاقتصاد المنزلي\n2. قسم التربية الفنية\n3. قسم التربية الموسيقية\n4. قسم تكنولوجيا التعليم',
  ),

  ChatQuestion(
    questionEn: 'Who is the current college administration?',
    questionAr: 'من هم الإدارة الحالية للكلية؟',
    answerEn:
        'Dean: Prof. Dr. Nagda Ibrahim Mahmoud Mady (appointed by presidential decree in June 2023, professor in the Home Economics Department)\n\nVice Deans:\nVice Dean for Education and Student Affairs: Prof. Dr. Gihan Farouk Abou El-Khair (appointed in July 2024 for three years)',
    answerAr:
        'العميد: أ.د: نجدة إبراهيم محمود ماضي (تم تعينها للكلية بقرار جمهوري في يونيو 2023 وهي أستاذة بقسم الاقتصاد المنزلي\n\nالوكلاء:\nوكيل الكلية لشئون التعليم والطلاب:\nأ.د: جيهان فاروق أبو الخير (تم تعينها في يوليو 2024 لمدة ثلاث سنوات)',
  ),

  ChatQuestion(
    questionEn: 'What are the admission requirements and study duration?',
    questionAr: 'ما هي شروط القبول ومدة الدراسة؟',
    answerEn:
        'Admission Requirements:\n- General Secondary School graduates (both science and arts sections)\n- Equivalent certificates like Industrial Secondary and British/American diplomas\n\nStudy Duration:\n- 4 years for Bachelor\'s degree\n- Graduates can pursue postgraduate studies (Master\'s and PhD) in all college fields',
    answerAr:
        'شروط القبول:\n- تقبل الكلية الطلاب من خرجي الثانوية العامة بشعبتيها العلمية والأدبية\n- الحاصلين علي الشهادات المعادلة مثل الثانوية الصناعية والدبلومات البريطانية والأمريكية\n\nمدة الدراسة:\n- 4 سنوات للحصول على درجة البكالوريوس\n- يمكن للطلاب متابعة دراساتهم العليا في كل مجالات الكلية للحصول على الماجستير أو الدكتوراه',
  ),

  // Educational Technology Department
  ChatQuestion(
    questionEn: 'Tell me about the Educational Technology Department',
    questionAr: 'أخبرني عن قسم تكنولوجيا التعليم',
    answerEn:
        'The Educational Technology Department is one of the specialized academic departments at the Faculty of Specific Education, Alexandria University. It focuses on preparing professionals capable of using and employing modern technology in education through designing, producing, and evaluating educational media and software.\n\nHead of Department: Prof. Dr. Amal Karam Khalifa',
    answerAr:
        'قسم تكنولوجيا التعليم هو أحد الأقسام الأكاديمية المتخصصة في كلية التربية النوعية جامعة الإسكندرية. يهتم بإعداد كوادر قادرة على استخدام وتوظيف التكنولوجيا الحديثة في العملية التعليمية، من خلال تصميم، إنتاج، وتقييم الوسائط التعليمية والبرمجيات.\n\nرئيس القسم: أ.د/ أمل كرم خليفة',
  ),

  ChatQuestion(
    questionEn:
        'What are the objectives of the Educational Technology Department?',
    questionAr: 'ما هي أهداف قسم تكنولوجيا التعليم؟',
    answerEn:
        'The department aims to:\n\n1. Prepare specialized teachers in educational technology\n2. Qualify specialists for educational and media institutions\n3. Develop technological skills for designing and producing educational content\n4. Support digital transformation in educational institutions',
    answerAr:
        'يهدف القسم إلى:\n\n1. إعداد معلمين متخصصين في مجال تكنولوجيا التعليم\n2. تأهيل أخصائيين للعمل بالمؤسسات التعليمية والإعلامية\n3. تنمية المهارات التكنولوجية اللازمة لتصميم وإنتاج المحتوى التعليمي\n4. دعم التحول الرقمي في المؤسسات التعليمية',
  ),

  // Music Education Department
  ChatQuestion(
    questionEn: 'Tell me about the Music Education Department',
    questionAr: 'أخبرني عن قسم التربية الموسيقية',
    answerEn:
        'The Music Department at the Faculty of Specific Education, Alexandria University, is a specialized department focusing on training students in various aspects of music and vocal arts.\n\nHead of Department: Prof. Dr. Manal Farrag Hassan Farrag',
    answerAr:
        'قسم الموسيقى في كلية التربية النوعية بجامعة الإسكندرية يعد من الأقسام المتخصصة التي تهتم بتدريب الطلاب على مختلف جوانب الموسيقى والفنون الصوتية.\n\nرئيس القسم: أ.د / منال فراج حسن فراج',
  ),

  ChatQuestion(
    questionEn: 'What are the specializations in Music Education?',
    questionAr: 'ما هي التخصصات في قسم التربية الموسيقية؟',
    answerEn:
        'The department offers specializations in:\n\n1. Piano\n2. Orchestra\n3. Arabic Music\n4. Solfege, Rhythm, and Improvisation\n5. Theory and Composition\n6. Global Singing\n7. Curricula and Teaching Methods',
    answerAr:
        'يقدم القسم تخصصات في:\n\n1. تخصص بيانو\n2. تخصص اوركسترالي\n3. تخصص موسيقى عربية\n4. تخصص سولفيج وايقاع وارتجال\n5. تخصص نظريات وتأليف\n6. تخصص غناء عالمي\n7. تخصص مناهج وطرق تدريس',
  ),

  // Home Economics Department
  ChatQuestion(
    questionEn: 'Tell me about the Home Economics Department',
    questionAr: 'أخبرني عن قسم الاقتصاد المنزلي',
    answerEn:
        'The Home Economics Department is one of the pioneering departments established with the college\'s inception. It focuses on human nature, growth, and needs throughout life stages, studying the family environment and optimal use of limited environmental resources.\n\nHead of Department: Prof. Dr. Ebtsam Fath Mahmoud Omar',
    answerAr:
        'يعد قسم الاقتصاد المنزلي من الأقسام الرائدة التي بعثت مع ميلاد الكلية. يركز على طبيعة الإنسان ونموه وحاجاته خلال مراحل حياته، ويهتم بدراسة البيئة المحيطة بالأسرة والمنزل والاستغلال الأمثل لموارد البيئة المحدودة.\n\nرئيس القسم: أ.د. ابتسام فتح محمود عمر',
  ),

  // Art Education Department
  ChatQuestion(
    questionEn: 'Tell me about the Art Education Department',
    questionAr: 'أخبرني عن قسم التربية الفنية',
    answerEn:
        'The Art Education Department is one of the main departments at the Faculty of Specific Education - Alexandria University. It aims to prepare distinguished graduates in various art fields while qualifying them to work as art education teachers at different educational levels.\n\nHead of Department: Prof. Dr. Nahla El-Deeb',
    answerAr:
        'يعد قسم التربية الفنية أحد الأقسام الرئيسية بكلية التربية النوعية – جامعة الإسكندرية. يهدف إلى إعداد خريجين متميزين في مجالات الفنون المختلفة مع تأهيلهم للعمل كمعلمين للتربية الفنية بمراحل التعليم المختلفة.\n\nرئيس القسم: أ.د/ نهلة الديب',
  ),

  ChatQuestion(
    questionEn: 'What are the specializations in Art Education?',
    questionAr: 'ما هي التخصصات في قسم التربية الفنية؟',
    answerEn:
        'The department includes the following specializations:\n\n1. Design\n2. Artistic Works\n3. Photography\n4. Printing\n5. Ceramics\n6. Sculpture\n7. Art History and Criticism\n8. Art Education for Children',
    answerAr:
        'يتضمن القسم التخصصات التالية:\n\n1. التصميم\n2. الأشغال الفنية\n3. التصوير\n4. الطباعة\n5. الخزف\n6. النحت\n7. تاريخ الفن والنقد\n8. التربية الفنية للأطفال',
  ),
];

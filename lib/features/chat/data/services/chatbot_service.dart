import 'package:naw3ia/features/chat/data/models/department_model.dart';
import 'package:naw3ia/features/chat/data/models/faculty_info_model.dart';
import 'package:naw3ia/features/chat/data/services/text_comparison_service.dart';

class ChatbotService {
  final TextComparisonService _comparisonService = TextComparisonService();

  // Academic ranks in descending order
  final Map<String, int> _academicRanksEn = {
    'Prof. Dr.': 6,
    'Professor': 6,
    'Assoc. Prof. Dr.': 5,
    'Associate Professor': 5,
    'Assistant Prof.': 4,
    'Dr.': 3,
    'Lecturer': 3,
    'Assistant Lecturer': 2,
    'Teaching Assistant': 1,
    'Ms.': 1,
    'Mr.': 1,
  };

  final Map<String, int> _academicRanksAr = {
    'أ.د': 6,
    'أستاذ دكتور': 6,
    'أ.م.د': 5,
    'أستاذ مساعد': 5,
    'د': 4,
    'دكتور': 4,
    'مدرس': 3,
    'مدرس مساعد': 2,
    'م.م': 2,
    'معيد': 1,
    'معيدة': 1,
    'أ': 1,
  };

  String generateResponse(String query, String locale) {
    // Convert query to lowercase for case-insensitive matching
    query = query.toLowerCase();

    // Handle classification by academic rank query
    if (query.contains('classify') ||
        query.contains('rank') ||
        query.contains('sort') ||
        query.contains('academic') ||
        query.contains('تصنيف') ||
        query.contains('ترتيب') ||
        query.contains('رتبة') ||
        query.contains('درجة علمية')) {
      // Check if specific department is mentioned
      for (var dept in departmentsList) {
        if (query.contains(dept.getName(locale).toLowerCase())) {
          return _getClassifiedStaffList(dept, locale);
        }
      }

      // If no specific department, classify all faculty members
      String response = locale == 'ar'
          ? 'تصنيف أعضاء هيئة التدريس حسب الدرجة العلمية:\n\n'
          : 'Faculty Members Classification by Academic Rank:\n\n';

      for (var dept in departmentsList) {
        response += '''${dept.getName(locale)}:
${_getClassifiedStaffList(dept, locale)}
${'-' * 40}\n''';
      }
      return response.trim();
    }

    // Department staff queries
    if (query.contains('staff') ||
        query.contains('professor') ||
        query.contains('teacher') ||
        query.contains('faculty member') ||
        query.contains('lecturer') ||
        query.contains('assistant') ||
        query.contains('هيئة التدريس') ||
        query.contains('أستاذ') ||
        query.contains('دكتور') ||
        query.contains('معيد')) {
      // Try to find specific department
      for (var dept in departmentsList) {
        if (query.contains(dept.getName(locale).toLowerCase())) {
          return '''${dept.getName(locale)} ${locale == 'ar' ? 'أعضاء هيئة التدريس:' : 'Faculty Members:'}
${dept.getFacultyMembers(locale).join('\n')}''';
        }
      }

      // If no specific department mentioned, return all faculty members
      String response = locale == 'ar'
          ? 'أعضاء هيئة التدريس في الكلية:\n\n'
          : 'Faculty Members in all departments:\n\n';
      for (var dept in departmentsList) {
        response += '''${dept.getName(locale)}:
${dept.getFacultyMembers(locale).join('\n')}
${'-' * 30}\n''';
      }
      return response.trim();
    }

    // Department head queries
    if (query.contains('head') ||
        query.contains('chairman') ||
        query.contains('dean') ||
        query.contains('رئيس') ||
        query.contains('عميد')) {
      for (var dept in departmentsList) {
        if (query.contains(dept.getName(locale).toLowerCase())) {
          return '''${dept.getName(locale)} ${locale == 'ar' ? 'رئيس القسم:' : 'Department Head:'}
${dept.getHead(locale)}''';
        }
      }
    }

    // Department courses queries
    if (query.contains('course') ||
        query.contains('subject') ||
        query.contains('study') ||
        query.contains('مقرر') ||
        query.contains('مادة') ||
        query.contains('دراسة')) {
      for (var dept in departmentsList) {
        if (query.contains(dept.getName(locale).toLowerCase())) {
          return '''${dept.getName(locale)} ${locale == 'ar' ? 'المقررات الدراسية:' : 'Courses:'}
${dept.getCourses(locale).join('\n')}''';
        }
      }
    }

    // Department objectives queries
    if (query.contains('objective') ||
        query.contains('goal') ||
        query.contains('aim') ||
        query.contains('هدف') ||
        query.contains('غاية')) {
      for (var dept in departmentsList) {
        if (query.contains(dept.getName(locale).toLowerCase())) {
          return '''${dept.getName(locale)} ${locale == 'ar' ? 'الأهداف:' : 'Objectives:'}
${dept.getObjectives(locale).join('\n')}''';
        }
      }
    }

    // General department info queries
    for (var dept in departmentsList) {
      if (query.contains(dept.getName(locale).toLowerCase())) {
        return '''${dept.getName(locale)}:
${dept.getDescription(locale)}

${locale == 'ar' ? 'رئيس القسم:' : 'Department Head:'}
${dept.getHead(locale)}

${locale == 'ar' ? 'الأهداف:' : 'Objectives:'}
${dept.getObjectives(locale).join('\n')}

${locale == 'ar' ? 'المقررات الدراسية:' : 'Courses:'}
${dept.getCourses(locale).join('\n')}

${locale == 'ar' ? 'أعضاء هيئة التدريس:' : 'Faculty Members:'}
${dept.getFacultyMembers(locale).join('\n')}''';
      }
    }

    // Dean's word
    if (query.contains('dean') ||
        query.contains('word') ||
        query.contains('عميد') ||
        query.contains('كلمة')) {
      for (var info in facultyInfoList) {
        if (info
            .getTitle(locale)
            .toLowerCase()
            .contains(locale == 'ar' ? 'كلمة' : 'dean')) {
          return info.getDescription(locale);
        }
      }
    }

    // Vision and Mission
    if (query.contains('vision') ||
        query.contains('mission') ||
        query.contains('رؤية') ||
        query.contains('رسالة')) {
      String response = '';
      for (var info in facultyInfoList) {
        if (info
                .getTitle(locale)
                .toLowerCase()
                .contains(locale == 'ar' ? 'رؤية' : 'vision') ||
            info
                .getTitle(locale)
                .toLowerCase()
                .contains(locale == 'ar' ? 'رسالة' : 'mission')) {
          response +=
              '${info.getTitle(locale)}:\n${info.getDescription(locale)}\n\n';
        }
      }
      if (response.isNotEmpty) {
        return response.trim();
      }
    }

    // Goals
    if (query.contains('goals') ||
        query.contains('objectives') ||
        query.contains('أهداف')) {
      for (var info in facultyInfoList) {
        if (info
            .getTitle(locale)
            .toLowerCase()
            .contains(locale == 'ar' ? 'أهداف' : 'goals')) {
          return info.getDescription(locale);
        }
      }
    }

    // Contact information questions
    if (query.contains('contact') ||
        query.contains('phone') ||
        query.contains('email') ||
        query.contains('address') ||
        query.contains('اتصل') ||
        query.contains('تليفون') ||
        query.contains('بريد') ||
        query.contains('عنوان')) {
      return locale == 'ar'
          ? '''معلومات الاتصال بالكلية:
العنوان: 14 شارع محمد أمين شهيب - مصطفى كامل
رقم الهاتف: 03-5454313
فاكس: 03-5442776
البريد الإلكتروني: spedu@alexu.edu.eg'''
          : '''Faculty Contact Information:
Address: 14 Mohamed Amin Shoheib St., Mostafa Kamel
Phone: 03-5454313
Fax: 03-5442776
Email: spedu@alexu.edu.eg''';
    }

    // Statistics and numbers
    if (query.contains('statistics') ||
        query.contains('numbers') ||
        query.contains('count') ||
        query.contains('احصائيات') ||
        query.contains('اعداد') ||
        query.contains('عدد')) {
      return locale == 'ar'
          ? '''إحصائيات الكلية:
- عدد أعضاء هيئة التدريس: 144 عضو
- عدد الطلاب: 5000 طالب
- عدد الخريجين: 8000 خريج
- عدد الموظفين: 97 موظف
- التصنيف الدولي: 151'''
          : '''Faculty Statistics:
- Faculty Members: 144
- Students: 5000
- Graduates: 8000
- Staff: 97
- International Ranking: 151''';
    }

    // Student services
    if (query.contains('student services') ||
        query.contains('services') ||
        query.contains('خدمات') ||
        query.contains('خدمات طلابية')) {
      return locale == 'ar'
          ? '''الخدمات الطلابية المتاحة:
- الجداول الدراسية
- جداول الامتحانات
- التسجيل للتربية العملية
- التدريب الصيفي
- برنامج رعاية الطلاب المتفوقين والمبدعين
- برنامج متابعة الطلاب المتعثرين
- خدمات الدعم الطلابي والإرشاد الأكاديمي'''
          : '''Available Student Services:
- Course Schedules
- Exam Schedules
- Practical Education Registration
- Summer Training
- Talented Students Support Program
- Struggling Students Support Program
- Student Support and Academic Counseling''';
    }

    // Units and centers
    if (query.contains('units') ||
        query.contains('centers') ||
        query.contains('وحدات') ||
        query.contains('مراكز')) {
      return locale == 'ar'
          ? '''الوحدات والمراكز بالكلية:
- وحدة ضمان الجودة
- وحدة القياس والتقويم
- مركز الخدمة العامة
- وحدة متابعة شئون الخريجين
- وحدة الدعم الطلابي والإرشاد الأكاديمي
- وحدة المشاركة الطلابية
- مكتب تراث للزيارات الميدانية
- وحدة الابتكارات التربوية'''
          : '''Faculty Units and Centers:
- Quality Assurance Unit
- Measurement and Evaluation Unit
- Public Service Center
- Alumni Affairs Unit
- Student Support and Academic Counseling Unit
- Student Participation Unit
- Heritage Office for Field Visits
- Educational Innovations Unit''';
    }

    // Check faculty info
    for (var info in facultyInfoList) {
      if (query.contains(info.getCategory(locale).toLowerCase()) ||
          query.contains(info.getTitle(locale).toLowerCase())) {
        return info.getDescription(locale);
      }
    }

    // Check departments info
    for (var dept in departmentsList) {
      if (query.contains(dept.getName(locale).toLowerCase())) {
        // If query asks about specific aspects
        if (query.contains('objectives') || query.contains('أهداف')) {
          return dept.getObjectives(locale).join('\n');
        } else if (query.contains('courses') ||
            query.contains('مقررات') ||
            query.contains('دراسة')) {
          return dept.getCourses(locale).join('\n');
        } else if (query.contains('faculty') ||
            query.contains('professors') ||
            query.contains('دكاترة') ||
            query.contains('أساتذة')) {
          return dept.getFacultyMembers(locale).join('\n');
        } else if (query.contains('head') || query.contains('رئيس')) {
          return dept.getHead(locale);
        } else {
          // Return general department info
          return dept.getDescription(locale);
        }
      }
    }

    // Study system
    if (query.contains('study system') ||
        query.contains('credit hours') ||
        query.contains('نظام الدراسة') ||
        query.contains('ساعات معتمدة')) {
      return locale == 'ar'
          ? '''نظام الدراسة بالكلية:
- مدة الدراسة 4 سنوات
- نظام الساعات المعتمدة
- تم تطبيق النظام اعتباراً من العام الدراسي 1995/1996
- يتم توزيع الخطة الدراسية على جميع الشعب الدراسية بالكلية'''
          : '''Faculty Study System:
- 4 years of study
- Credit hours system
- System implemented since academic year 1995/1996
- Study plan distributed across all departments''';
    }

    // Default responses with suggestions
    return locale == 'ar'
        ? '''عذراً، لم أفهم سؤالك. هل يمكنك إعادة صياغته؟ 
يمكنك السؤال عن:
- معلومات الأقسام
- أعضاء هيئة التدريس
- رؤساء الأقسام
- المقررات الدراسية
- أهداف الأقسام
- الخدمات الطلابية
- الوحدات والمراكز
- نظام الدراسة
- معلومات الاتصال
- الإحصائيات'''
        : '''Sorry, I didn't understand your question. Could you rephrase it?
You can ask about:
- Department information
- Faculty members
- Department heads
- Courses
- Department objectives
- Student services
- Units and centers
- Study system
- Contact information
- Statistics''';
  }

  String _getClassifiedStaffList(DepartmentModel dept, String locale) {
    // Get all faculty members including the head
    List<String> allMembers = [...dept.getFacultyMembers(locale)];
    if (!allMembers.contains(dept.getHead(locale))) {
      allMembers.add(dept.getHead(locale));
    }

    // Sort members by academic rank
    allMembers.sort((a, b) {
      int rankA = _getAcademicRank(a, locale);
      int rankB = _getAcademicRank(b, locale);
      return rankB.compareTo(rankA); // Descending order
    });

    // Group members by rank
    Map<int, List<String>> groupedMembers = {};
    for (var member in allMembers) {
      int rank = _getAcademicRank(member, locale);
      groupedMembers.putIfAbsent(rank, () => []);
      groupedMembers[rank]!.add(member);
    }

    // Build the response
    String response = '';
    List<int> ranks = groupedMembers.keys.toList()
      ..sort((a, b) => b.compareTo(a));

    for (var rank in ranks) {
      String rankTitle = _getRankTitle(rank, locale);
      response += '\n$rankTitle:\n';
      for (var member in groupedMembers[rank]!) {
        response += '- $member\n';
      }
    }

    return response.trim();
  }

  int _getAcademicRank(String memberString, String locale) {
    Map<String, int> ranks =
        locale == 'ar' ? _academicRanksAr : _academicRanksEn;
    for (var title in ranks.keys) {
      if (memberString.startsWith(title)) {
        return ranks[title]!;
      }
    }
    return 0; // Default rank if not found
  }

  String _getRankTitle(int rank, String locale) {
    if (locale == 'ar') {
      switch (rank) {
        case 6:
          return 'الأساتذة';
        case 5:
          return 'الأساتذة المساعدون';
        case 4:
          return 'المدرسون';
        case 3:
          return 'المدرسون المساعدون';
        case 2:
          return 'المعيدون';
        case 1:
          return 'المعيدون';
        default:
          return 'آخرون';
      }
    } else {
      switch (rank) {
        case 6:
          return 'Professors';
        case 5:
          return 'Associate Professors';
        case 4:
          return 'Assistant Professors';
        case 3:
          return 'Lecturers';
        case 2:
          return 'Assistant Lecturers';
        case 1:
          return 'Teaching Assistants';
        default:
          return 'Others';
      }
    }
  }

  /// Compares a user's answer with the expected correct answer
  ComparisonResult compareAnswer(String userAnswer, String correctAnswer) {
    return _comparisonService.compareAnswers(userAnswer, correctAnswer);
  }

  /// Gets the normalized version of a text (useful for debugging)
  String getNormalizedText(String text) {
    return _comparisonService.normalizeArabicText(text);
  }
}

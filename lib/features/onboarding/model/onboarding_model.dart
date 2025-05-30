import '../../../core/utils/app_assets.dart';

class OnboardingModel {
  final String titleEn;
  final String titleAr;
  final String subTitleEn;
  final String subTitleAr;
  final String imagePath;

  const OnboardingModel({
    required this.titleEn,
    required this.titleAr,
    required this.subTitleEn,
    required this.subTitleAr,
    required this.imagePath,
  });

  String getTitle(String locale) => locale == 'ar' ? titleAr : titleEn;
  String getSubTitle(String locale) => locale == 'ar' ? subTitleAr : subTitleEn;
}

final List<OnboardingModel> onBoardingData = [
  const OnboardingModel(
    titleEn: 'Welcome to Naw3ia',
    titleAr: 'مرحباً بك في نوعية',
    subTitleEn: 'Your gateway to quality education and academic excellence',
    subTitleAr: 'بوابتك نحو التعليم النوعي والتميز الأكاديمي',
    imagePath: Assets.imagesOnboarding1,
  ),
  const OnboardingModel(
    titleEn: 'Meet Your AI Assistant',
    titleAr: 'تعرف على مساعدك الذكي',
    subTitleEn: 'Get instant answers to your questions with our AI chatbot',
    subTitleAr: 'احصل على إجابات فورية لأسئلتك مع روبوت المحادثة الذكي',
    imagePath: Assets.imagesOnboarding2,
  ),
  const OnboardingModel(
    titleEn: 'Quality Education',
    titleAr: 'تعليم نوعي',
    subTitleEn: 'Access high-quality educational content and resources',
    subTitleAr: 'الوصول إلى محتوى تعليمي عالي الجودة وموارد متميزة',
    imagePath: Assets.imagesOnboarding3,
  ),
  const OnboardingModel(
    titleEn: "Let's Start",
    titleAr: 'هيا نبدأ',
    subTitleEn: 'Begin your educational journey with us',
    subTitleAr: 'ابدأ رحلتك التعليمية معنا',
    imagePath: Assets.imagesOnboarding4,
  ),
];

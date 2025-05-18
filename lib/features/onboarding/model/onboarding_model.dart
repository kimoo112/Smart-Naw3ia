import '../../../../core/utils/app_assets.dart';

class OnBoardingModel {
  final String imagePath;
  final String subTitle;
  final String title;

  OnBoardingModel({
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
}

final List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    title: 'مرحبًا بك',
    subTitle:
        'تطبيق شامل يوفر لك المعلومات المتخصصة في مجال التعليم النوعي، ويساعدك في رحلتك التعليمية',
    imagePath: Assets.imagesOnboarding1,
  ),
  OnBoardingModel(
    title: 'تحدث مع مساعدك الذكي',
    subTitle:
        ' يحتوي التطبيق على روبوت محادثة ذكي يجيب على أسئلتك ويساعدك في الوصول للمعلومات بسهولة.',
    imagePath: Assets.imagesOnboarding2,
  ),
  OnBoardingModel(
    title: 'تعرف على تربية نوعية ',
    subTitle:
        ' نوفر لك معلومات دقيقة ومحدثة عن تخصصات ومجالات التعليم النوعي في جامعة الإسكندرية.',
    imagePath: Assets.imagesOnboarding3,
  ),
  OnBoardingModel(
    title: 'ابدأ رحلتك التعليمية',
    subTitle:
        'اطّلع على المعلومات والدورات في أي وقت ومن أي مكان  كل ذلك من خلال تطبيقك الذكي.',
    imagePath: Assets.imagesOnboarding4,
  ),
];

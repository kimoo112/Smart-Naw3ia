import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import 'staff_model.dart';

class DepartmentModel {
  final String title;
  final String about;
  final String vision;
  final String aims;
  final List<StaffMember> staff;
  final IconData icon;
  final String image;

  const DepartmentModel({
    required this.image,
    required this.title,
    required this.about,
    required this.vision,
    required this.aims,
    required this.staff,
    required this.icon,
  });
}

final List<DepartmentModel> departments = [
  const DepartmentModel(
    image: Assets.imagesTechno,
    title: 'تكنولوجيا التعليم',
    icon: Icons.computer,
    about:
        'يهدف قسم تكنولوجيا التعليم إلى إعداد معلمين متخصصين في مجال تكنولوجيا التعليم قادرين على استخدام وتوظيف التكنولوجيا في العملية التعليمية.',
    vision:
        'يسعى القسم إلى تحقيق التميز في مجال تكنولوجيا التعليم من خلال تقديم برامج تعليمية متميزة وإجراء بحوث علمية تطبيقية تساهم في تطوير المجتمع.',
    aims: '''1. إعداد معلمين متخصصين في مجال تكنولوجيا التعليم
2. تنمية المهارات التكنولوجية لدى الطلاب
3. إجراء البحوث العلمية في مجال تكنولوجيا التعليم
4. تقديم خدمات مجتمعية في مجال تكنولوجيا التعليم''',
    staff: [
      StaffMember(
        name: 'أ.د / أمل كرم خليفة',
        position: 'استاذ والقائم بعمل رئيس مجلس القسم',
      ),
      StaffMember(
        name: 'ا.م.د / محمد وحيدمحمد سليمان',
        position: 'أستاذ مساعد تكنولوجيا التعليم',
      ),
      StaffMember(
        name: 'د / حسن على',
        position: 'مدرس تكنولوجيا التعليم',
      ),
      StaffMember(
        name: 'أ/ الاء سعد صبري عسل',
        position: 'معيدة بالقسم',
      ),
      StaffMember(
        name: 'أ/خلود عبد المقصود محمد مقلد',
        position: 'معيدة بالقسم',
      ),
      StaffMember(
        name: 'أ/مروه محمود',
        position: 'معيدة بالقسم',
      ),
      StaffMember(
        name: 'أ/اسماء علي (ام زين)',
        position: 'معيدة بالقسم',
      ),
      StaffMember(
        name: 'أ/ايه مصطفي مبروك ريه',
        position: 'معيدة بالقسم',
      ),
    ],
  ),
  const DepartmentModel(
    title: 'الإقتصاد المنزلى',
    image: Assets.imagesHomeEconomics,
    icon: Icons.home,
    about:
        'يعتبر قسم الاقتصاد المنزلي من الأقسام الأساسية بكلية التربية النوعية، ويهدف إلى إعداد معلمين متخصصين في مجال الاقتصاد المنزلي قادرين على تدريس المواد التخصصية في المدارس المختلفة.',
    vision:
        'يسعى القسم إلى تحقيق الريادة في مجال الاقتصاد المنزلي على المستوى المحلي والإقليمي من خلال تقديم برامج تعليمية متميزة وإجراء بحوث علمية تطبيقية تساهم في تطوير المجتمع.',
    aims: '''1. إعداد معلمين متخصصين في مجال الاقتصاد المنزلي
2. تنمية مهارات الطلاب في مجالات التغذية والملابس والنسيج
3. إجراء البحوث العلمية في مجال الاقتصاد المنزلي
4. تقديم خدمات مجتمعية في مجال الاقتصاد المنزلي''',
    staff: [
      StaffMember(
        name: 'أ.د / ابتسام فتح محمود عمر',
        position: 'استاذ ورئيس قسم الإقتصاد المنزلي',
        email: 'ebtsam.mahmoud@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'ا.د/ نجده إبراهيم محمود ماضى',
        position: 'استاذ وعميد الكلية',
        email: 'Nagda.Mady@alexu.edu.eg',
        specialization: 'ملابس و نسيج',
      ),
      StaffMember(
        name: 'أ.د / فاتن مصطفي كمال لطفى',
        position: 'استاذ متفرغ',
        email: 'prof.faten@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'ا.د/ تسبى محمد رشاد لطفى',
        position: 'استاذ متفرغ',
        email: 'prof.tesby@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'أ.د / ملك محمود رضا',
        position: 'استاذ متفرغ',
        email: 'malak.reda@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'أ.د / مني شرف عبد الجليل',
        position: 'استاذ',
        email: 'mona.sharaf@alexu.edu.eg',
        specialization: 'إدارة منزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ.د / منا موسي غالب',
        position: 'استاذ متفرغ',
        email: 'm.mousa1@alexu.edu.eg',
        specialization: 'ملابس و نسيج',
      ),
      StaffMember(
        name: 'أ.م.د / صبري احمد العجيزي',
        position: 'استاذ مساعد متفرغ',
        email: 'dr.sabri@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'أ . م. د / ابتسام إبراهيم محمد',
        position: 'استاذ مساعد',
        email: 'ebtessam.ibrahim@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'أ.م.د/ رحاب طه حسين شريدح',
        position: 'استاذ مساعد',
        email: 'dr.rehab@alexu.edu.eg',
        specialization: 'ملابس و نسيج',
      ),
      StaffMember(
        name: 'أ.م.د/ نيفين احمد الورداني',
        position: 'استاذ مساعد',
        email: 'neven.wardany@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'أ.م.د / شيماء محمد محمد عطيه',
        position: 'استاذ مساعد',
        email: 'Shimaa.Atiha@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'أ.م.د/ اميره احمد احمد شتيوي',
        position: 'استاذ مساعد',
        email: 'amira.shetewy@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د/دعاء حسين وجدي',
        position: 'مدرس',
        email: 'dr.doaa@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'أ.م.د / أمل حسانين محمد',
        position: 'استاذ مساعد',
        email: 'amel.hassanin@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ.م.د / سحر امين حميده',
        position: 'استاذ مساعد',
        email: 'dr.sahar@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ.م.د / شيماء احمد علي قطب',
        position: 'استاذ مساعد',
        email: 'dr.sh.elnagar@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ.م.د / السيده خيري النحراوي',
        position: 'استاذ مساعد',
        email: 'elsaida.khairy@alexu.edu.eg',
        specialization: 'ملابس و نسيج',
      ),
      StaffMember(
        name: 'ا.م.د/دعاء السيد علي النساج',
        position: 'استاذ مساعد',
        email: 'doaa@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د/ رجوي إبراهيم عبد الرازق',
        position: 'مدرس',
        email: 'ragwa.ibrahim@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د / استير فيكتور عبد النور',
        position: 'مدرس',
        email: 'ester.vector@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'أ.م.د / عبير ياسين ابراهيم',
        position: 'استاذ مساعد',
        email: 'abeer.yassin@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ.م.د/ مروه زكي محفوظ علي',
        position: 'استاذ مساعد',
        email: 'marwa.zaki@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د/ هبه محمد محمد حماده',
        position: 'مدرس',
        email: 'heba.hamada@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'أ.م.د/ هبه جمال عبد الحليم',
        position: 'استاذ مساعد',
        email: 'Heba.AbdelHalim1@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'أ.م.د /امل السيد عبد السلام',
        position: 'استاذ مساعد',
        email: 'amal.alsayed@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ.م.د / يثرب علي محمد مرسى',
        position: 'استاذ مساعد',
        email: 'y-A-Habeeb@alexu.edu.eg',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'د /هاجر على عبد الفتاح',
        position: 'مدرس',
        email: 'hagar.ali@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'د/ آلاء نشأت أحمد عبد الغنى',
        position: 'مدرس',
        email: 'alaa.nashaat@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'د/ إيمان محمد إبراهيم العرجاوى',
        position: 'مدرس',
        email: 'iman.ibrahim@alexu.edu.eg',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'د/ نشوة محمود يونس عبدة',
        position: 'مدرس',
        email: 'nashwa.younis@alexu.edu.eg',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د/ سمر محمد سالم',
        position: 'مدرس',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د/ أسماء خالد شفيق',
        position: 'مدرس',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'د/ مريم أحمد على',
        position: 'مدرس',
        specialization: 'تغذية و علوم أطعمة',
      ),
      StaffMember(
        name: 'م.م/ ابتسام صالح ابراهيم مبروك',
        position: 'مدرس مساعد',
        specialization: 'ملابس و منسوجات',
      ),
      StaffMember(
        name: 'م/ أسماء حمدى أحمد زايد',
        position: 'معيد',
        specialization: 'إدارة المنزل و إقتصاديات الأسرة',
      ),
      StaffMember(
        name: 'أ/إسراء محمد حسن نور',
        position: 'معيد',
      ),
      StaffMember(
        name: 'أ/منار حمدي عبدالحميد ماضي',
        position: 'معيد',
      ),
      StaffMember(
        name: 'أ/ وسام يسري عبد الحليم عامر',
        position: 'معيد',
      ),
      StaffMember(
        name: 'أ. / آيه على حسين ابرهيم',
        position: 'معيد',
      ),
    ],
  ),
  const DepartmentModel(
    image: Assets.imagesArt,
    title: 'التربية الفنية',
    icon: Icons.palette,
    about:
        'يهدف قسم التربية الفنية إلى إعداد معلمين متخصصين في مجال التربية الفنية قادرين على تدريس المواد الفنية في المدارس المختلفة وتنمية المهارات الفنية لدى الطلاب.',
    vision:
        'يسعى القسم إلى تحقيق التميز في مجال التربية الفنية من خلال تقديم برامج تعليمية متميزة وإجراء بحوث علمية تطبيقية تساهم في تطوير المجتمع.',
    aims: '''1. إعداد معلمين متخصصين في مجال التربية الفنية
2. تنمية المهارات الفنية والإبداعية لدى الطلاب
3. إجراء البحوث العلمية في مجال التربية الفنية
4. تقديم خدمات مجتمعية في مجال التربية الفنية''',
    staff: [
      StaffMember(
        name: 'أ.م.د/ جيهان فاروق ابو الخير',
        position: 'أستاذ (رئيس مجلس قسم التربية الفنية)',
        email: 'gihan.abolkhair@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د/شريف عبد الفتاح تمراز',
        position: 'استاذ',
        email: 'dr.sheref.temraz@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د/ أميرة عبد العزيز الصردي',
        position: 'استاذ',
        email: 'amira.sorady@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د/ هنى احمد يس',
        position: 'استاذ',
        email: 'dr.hana.yassen@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د/ منى محمد ابراهيم حسين',
        position: 'استاذ',
        email: 'mona.massry@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د/ دينا عادل حسن زكى',
        position: 'استاذ',
        email: 'dina.adel@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د/ أحلام المليجي',
        position: 'استاذ',
        email: 'ahlam.elmeligy@alexu.edu.eg',
        specialization: 'تصوير',
      ),
      StaffMember(
        name: 'أ.م.د/ خيرية محمد عبد العزيز',
        position: 'استاذ',
        email: 'spe_khairia@alexu.edu.eg',
        specialization: 'تصوير',
      ),
      StaffMember(
        name: 'أ.م.د/ نهى محمود دراج',
        position: 'أستاذ مساعد',
        email: 'noha.darrag@alexu.edu.eg',
        specialization: 'طباعة منسوجات',
      ),
      StaffMember(
        name: 'د/ منى ماهر وادى',
        position: 'مدرس',
        email: 'mon_art@alexu.edu.eg',
        specialization: 'تصوير',
      ),
      StaffMember(
        name: 'د/ احمد عبد الفتاح قدرى',
        position: 'مدرس',
        email: 'a_kadry@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ هدى انور عوض',
        position: 'مدرس',
        email: 'hoda.anwar@alexu.edu.eg',
        specialization: 'اشغال فنيه',
      ),
      StaffMember(
        name: 'أ.م.د/ اميرة الهندوم',
        position: 'أستاذ مساعد',
        email: 'amira.elhandoom@alexu.edu.eg',
        specialization: 'الرسم و التصوير',
      ),
      StaffMember(
        name: 'د/ نهلة الديب',
        position: 'مدرس',
        email: 'nahla.eldeeb@alexu.edu.eg',
        specialization: 'نسيج',
      ),
      StaffMember(
        name: 'أ.م.د / عدلى عونى عبدة',
        position: 'أستاذ مساعد',
        email: 'adly.abdo@alexu.edu.eg',
        specialization: 'اشغال معادن',
      ),
      StaffMember(
        name: 'أ.م.د / ولاء محمد ابراهيم قاسم',
        position: 'أستاذ مساعد',
        email: 'walaakm@alexu.edu.eg',
        specialization: 'التصوير',
      ),
      StaffMember(
        name: 'د/ اميرة محمد ابراهيم صالح',
        position: 'مدرس',
        email: 'amira.saleh@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ علا زين العابدين',
        position: 'مدرس',
        email: 'Dr.ola.zien@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ نيفين عبد الغفار عبد الغفار',
        position: 'مدرس',
        email: 'spe_neven2@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ صفاء صالح محمد احمد',
        position: 'مدرس',
        email: 'safaa.saleh@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د / خالد علي',
        position: 'أستاذ مساعد',
        email: 'khaled.ali@alexu.edu.eg',
        specialization: 'تصميم',
      ),
      StaffMember(
        name: 'أ.م.د / نشوى محمد حسن',
        position: 'أستاذ مساعد',
        email: 'nashwa.hasan@alexu.edu.eg',
        specialization: 'تصميم',
      ),
      StaffMember(
        name: 'أ.م.د /بسمة محمد أبو اليزيد',
        position: 'أستاذ مساعد',
        email: 'basma.aboelyazed@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د /محمود مصطفى السيد',
        position: 'أستاذ مساعد',
        email: 'mahmoudmetwally@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د/ غادة مصطفى رشوان',
        position: 'أستاذ مساعد',
        email: 'ghada.rashwan@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ أسماء بربري',
        position: 'مدرس',
        email: 'asmaa.barbari@alexu.edu.eg',
        specialization: 'اشغال فنيه',
      ),
      StaffMember(
        name: 'د/ نيفين يوسف زبادي',
        position: 'مدرس',
        email: 'neven.zabady@alexu.edu.eg',
        specialization: 'خزف',
      ),
      StaffMember(
        name: 'د/دينا محمد عادل رحومة',
        position: 'مدرس',
        email: 'dina.rahoma@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ نهى على شمس',
        position: 'مدرس',
        email: 'noha.shams@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ هبه احمد انور',
        position: 'مدرس',
        email: 'heba.Anwer@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ صوفيا عبد المنعم',
        position: 'مدرس',
        email: 'sofia.elkholy@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ أسماء محمد ابراهيم',
        position: 'مدرس',
        email: 'asmaa.ibrahem@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ ايهاب محمد مصطفى الشيخ',
        position: 'مدرس',
        email: 'ehab.elshekh@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ هبة عبد الله ابو المعاطى',
        position: 'مدرس',
        email: 'Dr.heba.art@alexu.edu.eg',
        specialization: 'اشغال فنيه',
      ),
      StaffMember(
        name: 'م.م / نانسى نجاتى حافظ سلطان',
        position: 'مدرس مساعد',
        email: 'nancy.sultan@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ داليا عبد الجواد شرف',
        position: 'مدرس',
        email: 'dalia.sharaf@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م/ هند سعد محمود',
        position: 'مدرس مساعد',
        email: 'hend.saad@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / شيرين محمود رؤف',
        position: 'مدرس',
        email: 'shereen.raouf@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د/ هند البدرى عزاز',
        position: 'أستاذ مساعد',
        email: 'Hend.azaz@alexu.edu.eg',
        specialization: 'خزف',
      ),
      StaffMember(
        name: 'د / نعيمة حسن علي',
        position: 'مدرس',
        email: 'naema.ali@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ اميرة محمد ابراهيم هلول',
        position: 'مدرس',
        email: 'amira.halol@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م / إيمان عوض زهران',
        position: 'مدرس مساعد',
        email: 'EmanZahran1@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ مريم عادل عبد الملاك',
        position: 'مدرس',
      ),
      StaffMember(
        name: 'م.م / هاجر معروف هوارى',
        position: 'مدرس مساعد',
      ),
      StaffMember(
        name: 'م.م / اسماء على سعد موسى',
        position: 'مدرس مساعد',
      ),
      StaffMember(
        name: 'م.م / شروق حموده حموده احمد',
        position: 'مدرس مساعد',
      ),
      StaffMember(
        name: 'م.م / أحمد عياد إبراهيم مسعود',
        position: 'مدرس مساعد',
      ),
      StaffMember(
        name: 'م. / عبير عبد الباسط محمد',
        position: 'معيد',
      ),
      StaffMember(
        name: 'م. / شرين اشرف محمد بهجت',
        position: 'معيد',
      ),
      StaffMember(
        name: 'م./ اسراء محمد لطفى عبدالحميد',
        position: 'معيد',
      ),
    ],
  ),
  const DepartmentModel(
    image: Assets.imagesMusic,
    title: 'التربية الموسيقية',
    icon: Icons.music_note,
    about:
        'يهدف قسم التربية الموسيقية إلى إعداد معلمين متخصصين في مجال التربية الموسيقية قادرين على تدريس المواد الموسيقية في المدارس المختلفة وتنمية المهارات الموسيقية لدى الطلاب.',
    vision:
        'يسعى القسم إلى تحقيق التميز في مجال التربية الموسيقية من خلال تقديم برامج تعليمية متميزة وإجراء بحوث علمية تطبيقية تساهم في تطوير المجتمع.',
    aims: '''1. إعداد معلمين متخصصين في مجال التربية الموسيقية
2. تنمية المهارات الموسيقية والإبداعية لدى الطلاب
3. إجراء البحوث العلمية في مجال التربية الموسيقية
4. تقديم خدمات مجتمعية في مجال التربية الموسيقية''',
    staff: [
      StaffMember(
        name: 'أ.د / منال فراج حسن فراج',
        position: 'رئيس قسم التربية الموسقية',
        email: 'manal.farrag@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د / بهية جلال عبد التواب',
        position:
            'الأستاذ بقسم التربية الموسيقية و وكيل الكلية لشئون خدمة المجتمع وتنمية البيئة',
        email: 'bahia.alekhrity@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د / سلوى حسن باشا',
        position:
            'الأستاذ بقسم التربية الموسيقية وكيل الكلية لشئون الدراسات العليا والبحوث',
        email: 'dr.salwa.basha@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ .د / شادي محمود عوض',
        position: 'الأستاذ بقسم التربية الموسيقية',
        email: 'shady.m.a@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.د/ إيناس موسى عبد التواب',
        position: 'الأستاذ بقسم التربية الموسيقية',
        email: 'inas.diab@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ .د / هايدى وجية معوض',
        position: 'الأستاذ بقسم التربية الموسيقية',
        email: 'heidi.wagih@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د/ ميادة جمال الدين أغا',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'mayada.ali@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د / ميادة نبيل الكتاتنى',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'mayada.elkatatny@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د /داليا القبارى محمد',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'dalia.elkabary@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / مروه محمد عبد المعطى',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'marwamohamed1@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / إسلام سعيد بدوى',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'islam.saeed@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د / أسماء محمد قطب',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'spe_asmaa.kotb@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د / هبة محمد سامى',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'heba.sami@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د / دعاء أحمد خميس',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'doaa.khmis@alexu.edu.eg',
      ),
      StaffMember(
        name: 'أ.م.د /نيفين محمد كمال',
        position: 'الأستاذ المساعد بقسم التربية الموسيقية',
        email: 'spe_neven.kamal@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م / أمل حاتم يوسف',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'spe_amal.hatem@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م / محمود محمد صيام',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'mahmoud.syam@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ مايسة حامد رضوان',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'maysa.hamed@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / تامر السيد فؤاد',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'tamer.fouad@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / إيمان سليمان الشرقاوى',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'eman.soliman@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / إسراء وجية بد السلام',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'Keyoflife@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د /هبه جلال أحمد الحو',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'heba.galal@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / أميرة أحمد الديب',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'amira.eldeeb@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / شريهان أحمد الحدينى',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'sherymoon@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م/ هبه سليمان فهمى',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'spe_heba.suleiman@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م/ كرستين مجدى اسكندر',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'krisslena@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د/ إيمان أحمد خميس',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'eman.khmis@alexu.edu.eg',
      ),
      StaffMember(
        name: 'د / سارة إبراهيم زغلولة',
        position: 'المدرس بقسم التربية الموسيقية',
        email: 'sara.ibrahim@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م/ داليا السيد بدوى',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'spe_dalia.badawi@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م/ دينا خليل التركى',
        position: 'معيدة بقسم التربية الموسيقية',
        email: 'spe_dina.khalil@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م /على محمود على خبيرى',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'ali.khebiery@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م.م / آية أمجد الاحمدى',
        position: 'المدرس المساعد بقسم التربية الموسيقية',
        email: 'spe_aya.ahmadi@alexu.edu.eg',
      ),
      StaffMember(
        name: 'م / فاطمة الزهراء السيد',
        position: 'معيد ة بقسم التربية الموسيقية',
      ),
      StaffMember(
        name: 'أ/ أسراء أحمد أحمد حسين',
        position: 'معيد ة بقسم التربية الموسيقية',
      ),
      StaffMember(
        name: 'أ/دينا شريف خميس',
        position: 'معيد ة بقسم التربية الموسيقية',
      ),
      StaffMember(
        name: 'ا/ ندي خيري محمد رجب',
        position: 'معيد ة بقسم التربية الموسيقية',
      ),
      StaffMember(
        name: 'أ. فيولا ملاك رياض ملك',
        position: 'معيد ة بقسم التربية الموسيقية',
      ),
    ],
  ),
  const DepartmentModel(
    title: 'علوم تربوية و نفسية',
    image: Assets.imagesPsychology,
    icon: Icons.psychology,
    about:
        'يقدم قسم العلوم التربوية والنفسية المقررات الآتية: مدخل إلى العلوم التربوية، مدخل إلي العلوم النفسية، تاريخ التربية والتعليم، الأصول الفلسفية للتربية، الأصول الاجتماعية للتربية، التربية المقارنة والإدارة التعليمية، المناهج وطرق تدريس التربية الفنية، طرق تدريس الاقتصاد المنزلي، طرق تدريس الموسيقي، مبادئ التدريس، علم النفس التعليمي، علم نفس النمو، علم النفس الاجتماعي، الصحة النفسية (توجيه وإرشاد نفسي)، سيكولوجية الفئات الخاصة، التربية العملية.',
    vision:
        'يسعى القسم إلى تحقيق التميز في مجال العلوم التربوية والنفسية من خلال تقديم برامج تعليمية متميزة وإجراء بحوث علمية تطبيقية تساهم في تطوير المجتمع.',
    aims: '''1. إعداد معلمين متخصصين في مجال العلوم التربوية والنفسية
2. تنمية المهارات التربوية والنفسية لدى الطلاب
3. إجراء البحوث العلمية في مجال العلوم التربوية والنفسية
4. تقديم خدمات مجتمعية في مجال العلوم التربوية والنفسية''',
    staff: [
      StaffMember(
        name: 'أ.د / هالة سعيد أو العلا',
        position: 'رئيس مجلس العلوم التربوية و النفسية',
        email: 'hala.said@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس الإقتصاد المنزلي',
      ),
      StaffMember(
        name: 'أ.د/ سناء الشريف',
        position: 'الأستاذ بقسم العلوم التربوية و النفسية',
        email: 'sanna.sherif@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'أ.د/ زيزى حسن عمر',
        position: 'الأستاذ بقسم العلوم التربوية و النفسية',
        email: 'zizi.omar@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس الإقتصاد المنزلي',
      ),
      StaffMember(
        name: 'أ.د / حلمى الفيل',
        position: 'الأستاذ المساعد بقسم العلوم التربوية و النفسية',
        email: 'dr.helmy@alexu.edu.eg',
        specialization: 'علم نفس تربوى',
      ),
      StaffMember(
        name: 'أ.م.د/حنان سمير',
        position: 'الأستاذ المساعد بقسم العلوم التربوية و النفسية',
        email: 'hanan.samir@alexu.edu.eg',
        specialization: 'علم نفس تربوى',
      ),
      StaffMember(
        name: 'أ.م.د/ثناء منصور عبد العزيز',
        position: 'الأستاذ المساعد بقسم العلوم التربوية و النفسية',
        email: 'Sanaa.Mansour@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'د/ إيناس حسني يونس',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: 'Enas.Hossney@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'د/ نهي توفيق فرفور',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: 'noha.farfor@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'د/ غادة محمود الشريف',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: 'ghada.alsharif@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'د./ إيمان شعبان أبو عرب',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: 'eman.shapan@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس الإقتصاد المنزلي',
      ),
      StaffMember(
        name: 'أ.م.د/ تريزا إميل شكري',
        position: 'الأستاذ المساعد بقسم العلوم التربوية و النفسية',
        email: 'Treza.emeel@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس الإقتصاد المنزلي',
      ),
      StaffMember(
        name: 'د/ محمد سلامه شويل',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: 'mohamed.shewial@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الموسيقية',
      ),
      StaffMember(
        name: 'د/ أميرة يحيي زيتون',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: 'amira.zaiton@alexu.edu.eg',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'د/ شيماء ماهر',
        position: 'المدرس بقسم العلوم التربوية و النفسية',
        email: '',
        specialization: 'مناهج و طرق تدريس التربية الموسيقية',
      ),
      StaffMember(
        name: 'م .م / بسمة ممدوح',
        position: 'المدرس المساعد بقسم العلوم التربوية والنفسية',
        email: '',
        specialization: 'مناهج و طرق تدريس التربية الفنية',
      ),
      StaffMember(
        name: 'م/ إيناس الجزار',
        position: 'المعيدة بقسم العلوم التربوية والنفسية',
        email: '',
        specialization: 'مناهج وطرق تدريس التربية الموسيقية',
      ),
    ],
  ),
];
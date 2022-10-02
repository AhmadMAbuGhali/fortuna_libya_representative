import 'package:fortuna_libya_representative/resources/assets_manager.dart';

class IntroModle{
  IntroModle({ required this.title, required this.desc,required this.path});
  final String title;
  final String desc;
  final String path;
  static List<IntroModle> data = [
    IntroModle(
        title: 'صفقات وعروض مذهلة',
      desc: 'ابحث عن صفقات أرخص من السوق المحلي وخصم رائع واستبدال نقاط',
      path: ImageAssets.onboarding1
     ),

    IntroModle(
        title: 'التسليم عند بابك',
      desc: 'توصيل آمن وسريع للطلبيات الخاصة بك إلى باب صيدليتك دون أي عناء',
      path:  ImageAssets.onboarding2
    ),
  ];
}
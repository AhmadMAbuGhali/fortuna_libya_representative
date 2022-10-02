import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../general_component/drawar_widget.dart';



class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorManager.backGround,
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        leading: IconButton(
            onPressed: () {
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.closeDrawer();
                //close drawer, if drawer is open
              } else {
                scaffoldKey.currentState!.openDrawer();
                //open drawer, if drawer is closed
              }
            },
            icon: Icon(
              Icons.menu,
              color: ColorManager.black,
            )),
        title: Text(
          'الدعم الفني ',
          style: getBoldStyle(color: ColorManager.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(IconAssets.cart),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h,),
Image.asset(ImageAssets.logo,height: 120,width: 120,),
          SizedBox(height: 20.h,),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              '''في فورتينا نهتمّ بخدمتكم والتواصل معكم ، ونؤمن بأن طريقنا لنيل رضا زبائننا يتمثّل في تقديم خدمات دعم فني تلائم توقعاتهم، لذلك أعددنا في مدى كادراً فنيّاً مدرباً ومؤهلاً ليتمكن من خدمة زبائننا بالشكل الأمثل.

يعمل كادرنا على مدار الساعة طوال أيام الأسبوع لخدمتكم ضمن أعلى المعايير. لذلك وفي حال احتجتم لأية مساعدة أو واجهتم أية مشكلة فنية أو في حال كانت لديكم أية استفسارات، نرجو أن لا تتردّدوا بالاتصال على الرقم 0000000000 من أي هاتف أرضي أو محمول، أو الاتصال على الرقم 000000000 وسيتلقى كادرنا الفني مكالماتكم بكل سرور. ''',
              textAlign: TextAlign.start,
              style: getBoldStyle(color: ColorManager.black),
            ),
          ),
          SizedBox(height: 80.h,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor:Color(0xFFE8E8E8) ,
                child: SvgPicture.asset(IconAssets.call),
              ),
              SizedBox(width: 20.w,),
              CircleAvatar(
                radius: 30,
                backgroundColor:Color(0xFFE8E8E8) ,
                child: SvgPicture.asset(IconAssets.msg),
              ),
            ],
          )
        ],
      ),
          drawer: DrawarWidget(
              function: () => scaffoldKey.currentState?.closeDrawer()),
    ));
  }
}

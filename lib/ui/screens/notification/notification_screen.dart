import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/font_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';
import 'package:fortuna_libya_representative/ui/general_component/appbar_custom_widget.dart';
import 'package:fortuna_libya_representative/ui/general_component/drawar_widget.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKeyNotification = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKeyNotification,
        appBar: AppBarWidget(
          function: () {
            scaffoldKeyNotification.currentState?.openDrawer();
          }, title: 'الاشعارات',
        ),
        drawer: DrawarWidget(
            function: () => scaffoldKeyNotification.currentState?.closeDrawer()),
        body:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),

              Row(
                children: [
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text('الإشعارات غير المقروءة',style: getMediumStyle(color: Colors.black,fontSize: FontSize.s16),),
                  ),
                  const Spacer(),
                  TextButton(onPressed: (){}, child:   Text('وضع علامة مقروءة',style: getMediumStyle(color: ColorManager.primary),))
                ],
              ),
              Expanded(
                  child:
                  ListView.builder(
                    padding: EdgeInsets.zero,
                      itemCount: 4,
                      itemBuilder: (context, index) => NotificationWidget())
              ),
              Padding(
                padding:   EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                child: Text('الإشعارات المقروءة',style: getMediumStyle(color: Colors.black,fontSize: FontSize.s16),),
              ),
              Expanded(
                  child:
                  ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 14,
                      itemBuilder: (context, index) => NotificationWidget())
              ),

            ],

        ),
      ),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 5.w),
      child:Material(
        elevation: 2.0,
        shadowColor: Colors.black.withOpacity(.6),
        borderRadius: BorderRadius.circular(12.r),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r)),
          tileColor:ColorManager.primary.withOpacity(.4),
          contentPadding:EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
          dense:true,

          leading: Container(
              width: 50.w,
              height: double.infinity,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(12.r),
                shape: BoxShape.circle,
                color: ColorManager.primary.withOpacity(.4),
              ),
              child: Center(child: Text( 'N'))),
          title: Text(
          ' Notification Title',
            // textScaleFactor: 1.5,
            style:
            getBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
          ),
          // trailing:Icon(Icons.done),
          subtitle: Text(
             'Description Notification',
            style: getMediumStyle(color: Colors.grey, fontSize: FontSize.s16),
          ),

        ),
      ),
    );
  }
}
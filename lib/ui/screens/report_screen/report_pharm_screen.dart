import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/navigator/router_class.dart';
import 'package:fortuna_libya_representative/navigator/routes_const.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/font_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';
import 'package:fortuna_libya_representative/ui/general_component/appbar_custom_widget.dart';
import 'package:fortuna_libya_representative/ui/general_component/drawar_widget.dart';

class ReportPharmScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldReportKey = GlobalKey<ScaffoldState>();
  final TextEditingController searchReportController = TextEditingController();

  ReportPharmScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldReportKey,
        appBar: AppBarWidget(
          function: () {
            scaffoldReportKey.currentState?.openDrawer();
          }, title: 'تقارير زيارة الصيدليات',
        ),
        drawer: DrawarWidget(
            function: () => scaffoldReportKey.currentState?.closeDrawer()),
        body: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: [
            SizedBox(height: 16.h,),
            TextFormField(
              controller: searchReportController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                hintText: 'إبحث عن تقرير',
              ),
            ),
            SizedBox(height: 16.h,),
            Expanded(child:ListView.builder(
                itemCount: 5,
                itemBuilder: (context,index){
              return const WidgetTask();
            }))
          ],),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            RouterClass.routerClass.navigateTo(NavegatorConstant.addReportPharm);
          },
          tooltip: 'add Report',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class WidgetTask  extends StatelessWidget {
  const WidgetTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.only(top: 5.h,bottom: 10.h,right: 20.w,left: 10.w),
       decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(6.r),
        boxShadow:  [ BoxShadow(
          offset: const Offset(0, 6),
          blurRadius: 42,
          spreadRadius: 0.0,
          color: ColorManager.shadow.withOpacity(0.4)
        )],
      ),
      child: Column(children: [
        Row(
          children:   [
            Text('تقرير صيدلية السلام',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14),),
           const Spacer(),
             TextButton(onPressed: (){}, child: Text('تعديل ',style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s12),))
          ],
        ),
        Spacer(),
        Row(
          children:   [
            Icon(Icons.date_range,color: ColorManager.red,) ,
            SizedBox(width: 5.w,),
            Text('21-09-2022',style: getRegularStyle(color: ColorManager.red,fontSize: FontSize.s10),),
           const  Spacer(),
            Icon(Icons.access_time_outlined,color: ColorManager.green,) ,
            SizedBox(width: 5.w,),
            Text('ص 08:00 ',style: getRegularStyle(color: ColorManager.green,fontSize: FontSize.s10),),
          ],
        ),
      ],),
    );
  }
}
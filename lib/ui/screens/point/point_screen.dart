import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../general_component/drawar_widget.dart';
import '../home_screens/home_screen.dart';
import '../profile/profile_screen.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({Key? key}) : super(key: key);

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
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
            'النقاط',
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 121.h,
                decoration:const BoxDecoration(
                  gradient:  LinearGradient(
                      colors: [
                        Color(0xFF127AB9),
                        Color(0xFF006FAE),
                        Color(0xFF066CAC),
                        Color(0xFF08589D),
                        Color(0xFF045BA0),
                      ],
                      begin: FractionalOffset(0.0, 0.0,),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0,0.2,0.4,0.6 ,1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconAssets.point,
                                color: ColorManager.white,
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                'رصيد النقاط ',
                                style: getBoldStyle(
                                    color: ColorManager.white, fontSize: 20),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '257 ',
                                style: getBoldStyle(
                                    color: ColorManager.white, fontSize: 21),
                              ),
                              Text(
                                'نقطة ',
                                style: getBoldStyle(
                                    color: ColorManager.white, fontSize: 21),
                              )
                            ],
                          ),
                          Text(
                            'يتم تصفير النقاط في بداية كل شهر فردي ',
                            style: getBoldStyle(
                                color: ColorManager.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      IconAssets.cash,
                      width: 50,
                      height: 50,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'يمكنك الإستفادة من النقاط بعد 243 نقطة إضافية',
                  style: getBoldStyle(color: ColorManager.red, fontSize: 14),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration:const BoxDecoration(
                  gradient:  LinearGradient(
                      colors: [
                        Color(0xFF127AB9),
                        Color(0xFF006FAE),
                        Color(0xFF066CAC),
                        Color(0xFF045BA0),
                        Color(0xFF08589D),

                      ],
                      begin: FractionalOffset(0.0, 0.0,),
                      end: FractionalOffset(1.0, 0.0),
                      stops: [0.0,0.2,0.4,0.6 ,1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Center(
                    child: Text(
                  'يتم احتساب نقطة لكل 100 دينار',
                  style: getBoldStyle(color: ColorManager.white, fontSize: 22),
                )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconAssets.point,
                      color: ColorManager.black,
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      'سجل النقاط لكل عملية بيع',
                      style:
                          getBoldStyle(color: ColorManager.black, fontSize: 20),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(IconAssets.plus),
                      SizedBox(width: 16.w,),
                      Text('بيع طلبية بمبلغ 4000 د.ل صيدلية الشام ',style: getBoldStyle(color: ColorManager.black,fontSize: 16),),
                      Spacer(),
                      
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('+45',style: getBoldStyle(color: ColorManager.green,fontSize: 16),),
                      )
                    ],
                  ),
                );
              }))
            ],
          ),
        ),
        drawer: DrawarWidget(
            function: () => scaffoldKey.currentState?.closeDrawer()),
      ),
    );
  }
}

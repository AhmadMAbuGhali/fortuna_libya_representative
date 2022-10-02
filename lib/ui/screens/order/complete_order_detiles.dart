import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../../navigator/router_class.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../general_component/drawar_widget.dart';
import 'order_details_item.dart';


class CompleteOrderDetails extends StatelessWidget {
  const CompleteOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white,
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
              'تفاصيل الطلبية ',
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
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 25,
                    itemBuilder: (context, index) {
                      return Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: OrderDetailsItem());
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المبلغ الإجمالي ',
                      style: getMediumStyle(color: ColorManager.red, fontSize: 13),
                    ),
                    Text(
                      '600',
                      style: getMediumStyle(color: ColorManager.red, fontSize: 13),
                    )
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                SizedBox(
                  height: 40.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text('العودة للرئيسية',style: getBoldStyle(color: ColorManager.white),),
                  ),
                ),
              ],
            ),
          ),
          drawer: DrawarWidget(
              function: () => scaffoldKey.currentState?.closeDrawer()),
        ));
  }
}

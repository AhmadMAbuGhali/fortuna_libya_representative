import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';


class CompleteOrder extends StatelessWidget {
  const CompleteOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorManager.primary,
                      width: 1,
                      style: BorderStyle.solid),
                ),
                child: Image.asset(
                  ImageAssets.onboarding1,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'طلبيات مواد طبية 1',
                  style: getBoldStyle(color: ColorManager.black, fontSize: 15),
                ),
                Text(
                  'صيدلية الامل',
                  style: getRegularStyle(color: ColorManager.black, fontSize: 10),
                ),
                Text(
                  '600',
                  style:
                  getRegularStyle(color: ColorManager.green, fontSize: 10),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0,left: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('26-11-2022',style: getRegularStyle(color: ColorManager.red,fontSize: 10),),
                  SizedBox(height: 12.h,),
                  SizedBox(
                    height: 35,
                    width: 128,
                    child: ElevatedButton(
                        onPressed: () {
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.completeOrderDetails);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),

                                )
                            )
                        ),
                        child: Center(
                          child: Text('تفاصيل الطلب',style: getRegularStyle(color: ColorManager.white,fontSize: 14),),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

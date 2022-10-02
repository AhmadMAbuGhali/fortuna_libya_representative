import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';


class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(color: Color(0xFFE8E8E8)),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'رباط ركبة ماركة ',
                  style: getBoldStyle(color: ColorManager.black, fontSize: 15),
                ),
               Text('16 : الكمية',style: getLightStyle(color: ColorManager.black),)

              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.close,color: ColorManager.gray,),
                Text('600',style: getMediumStyle(color: ColorManager.green),)
              ],
            ),
          ),

        ],
      ),
    );
  }
}

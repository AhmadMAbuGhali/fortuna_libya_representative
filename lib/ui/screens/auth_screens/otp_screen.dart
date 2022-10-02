import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fortuna_libya_representative/services/auth_provider.dart';

import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Consumer<AuthProvider>(
          builder: (context, provider, x){
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                SizedBox(height: 59.h),
                SizedBox(
                  height: 155.h,
                  width: 155.w,
                  child: Image.asset(
                    ImageAssets.logo,
                    height: 332.h,
                    width: 332.w,
                  ),
                ),
                Text(
                  'الرمز السري',
                  style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                ),
                SizedBox(height: 21.h),
                  Text(
                    'قم بإدخال الرمز الذي وصل لإيميلك',
                    style: getMediumStyle(color: ColorManager.otpDesc, fontSize: FontSize.s14),
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 20.w),
                    child: PinFieldAutoFill(

                      decoration: UnderlineDecoration(
                        textStyle: TextStyle(fontSize: 20, color: ColorManager.primary),
                        colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                      ),
                      codeLength: 4,
                      currentCode: otpController.text,
                      onCodeSubmitted: (code) {
                        if (code.length == 4) {
                          // showCustomDialog(context);
                        }
                      },
                      onCodeChanged: (code) {
                        // provider.sendCodeController.text=code.toString();
                        if (code!.length == 4) {
                          FocusScope.of(context).requestFocus(FocusNode());
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 60.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 44.h,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: ElevatedButton(onPressed: ()async {

                    },
                        child:provider.isLoading?Row(children: [
                          Text('تأكيد', style: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s18.sp)),
                          SizedBox(width: 10.w,),
                          CircularProgressIndicator(color: ColorManager.white)
                        ],):Text('تأكيد', style: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s18.sp))
                    ),
                  ),




                ],),
            );
          },
        )
    );
  }
}

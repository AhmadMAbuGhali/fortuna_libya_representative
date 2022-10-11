import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../services/auth_provider.dart';

class OTPScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();
   OTPScreen({Key? key}) : super(key: key);


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
                  'secretCode',
                  style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                ).tr(),
                SizedBox(height: 21.h),
                  Text(
                    'enterCode',
                    style: getMediumStyle(color: ColorManager.otpDesc, fontSize: FontSize.s14),
                  ).tr(),
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
                    child: ElevatedButton(onPressed: provider.isLoading?null:()async {
                      RouterClass.routerClass.navigateTo(NavegatorConstant.createNewPassword);
                    },
                        child:provider.isLoading?Row(children: [
                          Text('confirm', style: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s18.sp)).tr(),
                          SizedBox(width: 10.w,),
                          CircularProgressIndicator(color: ColorManager.white)
                        ],):Text('confirm', style: getMediumStyle(color: ColorManager.white, fontSize: FontSize.s18.sp)).tr()
                    ),
                  ),
                ],),
            );
          },
        )
    );
  }
}


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../services/auth_provider.dart';
import '../../general_component/custom_text_form_filed.dart';

 class LoginScreen extends StatelessWidget {

  final GlobalKey<FormState> logFormkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: logFormkey,
          child: SingleChildScrollView(
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
                    'login',
                    style: getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s18),
                  ).tr(),
                  SizedBox(height: 8.h),
                  CustomTextFeild(
                    controller: provider.loginEmailController,
                    hintText: 'typeEmail'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'emailEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'email'.tr(),
                  ),
                  CustomTextFeild(
                    controller:  provider.loginPasswordController,
                    hintText: 'typePassword'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'passwordEmpty'.tr();
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name, label: 'password'.tr(),
                    obscureText: true,
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: <Widget>[
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                            checkColor: ColorManager.black,
                            activeColor: ColorManager.primary,
                            value: provider.isCheckLogin,
                            onChanged: (bool? value) {
                              provider.changeIsCheckLogin();
                            },
                          ),
                        ),
                        Text('rememberMe',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s12.sp)).tr(), //Text
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            RouterClass.routerClass
                                .navigateTo(NavegatorConstant.forgetPassword);
                          },
                          child: Text(
                            'forgotPassword',
                            style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: FontSize.s12.sp),
                          ).tr(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton(onPressed: (){
                          RouterClass.routerClass
                              .navigateTo(NavegatorConstant.task);
                        }, child: Text('login',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16),).tr())),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'doNotHaveAccount'.tr(),
                            style: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14)),
                        TextSpan(
                          text: 'createAccount'.tr(),
                          style: getBoldStyle(color:ColorManager.primary,fontSize: FontSize.s14),
                           recognizer:  TapGestureRecognizer()..onTap = () => RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.signUp)
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        );
      }),
    );
  }
}

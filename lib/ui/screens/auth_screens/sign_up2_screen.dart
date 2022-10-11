import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../services/auth_provider.dart';
import '../../general_component/custom_text_form_filed.dart';

class SignUpScreen2 extends StatelessWidget {
  final GlobalKey<FormState> signFormkey = GlobalKey<FormState>();

  SignUpScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, provider, x) {
        return Form(
          key: signFormkey,
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
                    'createAccount',
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s18),
                  ).tr(),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      Text(
                        'city',
                        style: getMediumStyle(
                            color: ColorManager.black, fontSize: FontSize.s16),
                      ).tr(),
                      const Spacer()
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: DropdownButtonFormField2(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorManager.primary,
                      ),
                      iconSize: 30.sp,
                      buttonHeight: 44.h,
                      buttonPadding: const EdgeInsets.only(left: 12, right: 12),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      items: ['item', 'item2', 'item3']
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'يجب تحديد تصنيف المهمة';
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  CustomTextFeild(
                    controller: provider.forgetEmailController,
                    hintText: 'typePassword'.tr(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'passwordEmpty ';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.name,
                    label: 'password'.tr(),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 16.w,
                              ),
                              Text(
                                'uploadImg',
                                style: getMediumStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s16),
                              ).tr(),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              provider.pickNewImage();
                            },
                            child: DottedBorder(
                                color: Colors.black, //color of dotted/dash line
                                strokeWidth: 1, //thickness of dash/dots
                                dashPattern: const [5, 6],
                                //dash patterns, 10 is dash width, 6 is space width
                                child: provider.file == null?SizedBox(
                                  height: 50.h,
                                  width: 120.w,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.file_upload_outlined,
                                        color: ColorManager.black,
                                      ),
                                      SizedBox(
                                        width: 15.w,
                                      ),
                                      Text(
                                        'uploadFile',
                                        style: getMediumStyle(
                                            color: ColorManager.black,
                                            fontSize: FontSize.s16),
                                      ).tr()
                                    ],
                                  ),
                                ): Container(width: 120.w,height: 150.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image:  FileImage(provider.file!),fit: BoxFit.fill)
                                ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: SizedBox(
                        width: double.infinity,
                        height: 44.h,
                        child: ElevatedButton(
                            onPressed: () {
                              RouterClass.routerClass
                                  .navigateTo(NavegatorConstant.homeApp);
                            },
                            child: Text(
                              'createAccount',
                              style: getMediumStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSize.s16),
                            ).tr())),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'haveAccount'.tr(),
                            style: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14)),
                        TextSpan(
                            text: 'sLogin'.tr(),
                            style: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s14),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => RouterClass.routerClass
                                  .navigateToAndRemove(
                                      NavegatorConstant.login)),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/styles_manager.dart';
import '../../services/auth_provider.dart';

class CustomTextFeild extends StatelessWidget {
   CustomTextFeild(
      {Key? key, required this.hintText,
        required this.label,
        this.validator,
        this.keyboardType,
        this.suffixIcon,
        this.textInputAction,
        this.textEnable,
        this.obscureText =false,
        required this.controller,
      }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final String label;
  bool? obscureText=false;
  bool? textEnable = true;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(label,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16),),
          SizedBox(height: 7.h,),
          SizedBox(
            child: Consumer<AuthProvider>(
              builder:(context,provider,x){
              return TextFormField(
                validator: (value) => validator!(value),
                controller: controller,
                focusNode: FocusNode(),
                obscureText:obscureText!? provider.showPass:false,
                onFieldSubmitted:   null,
                enabled: textEnable,
                keyboardType: keyboardType ?? TextInputType.text,
                textInputAction: textInputAction,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  fillColor: ColorManager.white,
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                  hintText: hintText,
                  suffixIcon: obscureText! ?InkWell(onTap: (){
                    provider.changeShowPass();
                  },child: provider.showPass?Icon(Icons.remove_red_eye,color: ColorManager.primary,):Icon(Icons.remove_red_eye_outlined,color: ColorManager.primary,),):null,
                  hintStyle: getRegularStyle(
                      color: ColorManager.otpDesc, fontSize: FontSize.s14),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorManager.borderTextFiel, width: 1.0),
                      borderRadius: BorderRadius.circular(12.r)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: ColorManager.primary, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                        color: ColorManager.borderTextFiel, width: 1.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 1.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
              );}
            ),
          ),
        ],
      ),
    );
  }
}


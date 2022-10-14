import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/font_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';

class CustomTextFeild2 extends StatelessWidget {
  const CustomTextFeild2(
      {Key? key, required this.hintText,
        this.validator,
        this.keyboardType,
        this.textInputAction,
        required this.hright,
        required this.controller,
      }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final double hright;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return SizedBox(
            height:hright,
            child: TextFormField(
              maxLines: null,
              minLines: null,
              expands: true,
              validator: (value) => validator!(value),
              controller: controller,
              obscureText:false,
              onFieldSubmitted: null,
              keyboardType: TextInputType.text,
              textInputAction: textInputAction,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (value){
              },
              decoration: InputDecoration(
                fillColor: ColorManager.white,
                filled: true,
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                hintText: hintText,
                isDense: true,
                hintStyle: getRegularStyle(
                    color: ColorManager.otpDesc, fontSize: FontSize.s14),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ColorManager.otpDesc, width: 1.0),
                    borderRadius: BorderRadius.circular(12.r)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: ColorManager.primary, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(
                      color:  ColorManager.otpDesc, width: 1.0),
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
            ),

    );
  }
}

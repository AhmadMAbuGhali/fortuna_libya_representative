import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';


class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled(
      {Key? key,

        required this.label,
        required this.hint,
        required this.controller,
        this.suffixIcon,
        this.enable
      })
      : super(key: key);
  String label;
  String hint;
  TextEditingController controller;
  Icon? suffixIcon;
  bool? enable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label,style: getBoldStyle(color: ColorManager.black),),
          ],
        ),
        SizedBox(height: 7.h,),
        TextFormField(
          enabled: enable,
          controller: controller,

          decoration: InputDecoration(


            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
            hintText: hint,
            border: OutlineInputBorder(

                borderRadius: BorderRadius.circular(5.0)
            ),
          ),

        ),
      ],
    );
  }
}

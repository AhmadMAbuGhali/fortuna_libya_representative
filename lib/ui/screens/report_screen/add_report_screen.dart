import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/resources/color_manager.dart';
import 'package:fortuna_libya_representative/resources/font_manager.dart';
import 'package:fortuna_libya_representative/resources/styles_manager.dart';
import 'package:fortuna_libya_representative/ui/general_component/appbar_custom_widget.dart';
import 'package:fortuna_libya_representative/ui/general_component/drawar_widget.dart';

class AddReportPharmScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldReportKey = GlobalKey<ScaffoldState>();
   final TextEditingController dateController = TextEditingController();
   final TextEditingController timeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();
  AddReportPharmScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldReportKey,
        appBar: AppBarWidget(
          function: () {
            scaffoldReportKey.currentState?.openDrawer();
          }, title: 'تقرير زيارة',
        ),
        drawer: DrawarWidget(
            function: () => scaffoldReportKey.currentState?.closeDrawer()),
        body: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(children: [
            SizedBox(height: 26.h,),
            Row(
              children: [
                Text(
                  'اسم الصيدلية',
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s14),
                ),
                const Spacer()
              ],
            ),
            SizedBox(height: 16.h),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              isExpanded: true,
              hint: const Text('اختر اسم الصيدلية'),
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
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(
                'التاريخ',
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s14),
              ),
              Text(
                'الوقت',
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s14),
              ),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              SizedBox(
              width: 165.w,
              child: TextField(
                controller: dateController,
                //editing controller of this TextField
                decoration: InputDecoration(
                  hintText: 'd/m/yyyy',
                  hintStyle: getMediumStyle(
                      color: ColorManager.gray,
                      fontSize: FontSize.s16),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w, vertical: 10.h),
                  fillColor: ColorManager.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color:
                          ColorManager.gray666,
                          width: 1.0),
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                    DateFormat('d/M/yyyy').format(pickedDate);
                    dateController.text = formattedDate;
                    // enddatetime = pickedDate;

                  }
                },
              ),
            ),
                SizedBox(
                  width: 165.w,
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      hintText: 'hh:mm AM/PM',
                      hintStyle: getMediumStyle(
                          color: ColorManager.gray,
                          fontSize: FontSize.s16),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      fillColor: ColorManager.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorManager.gray666,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(12.r)),
                    ),
                    readOnly: true,
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: selectedTime,
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if (timeOfDay != null && timeOfDay != selectedTime) {
                        selectedTime = timeOfDay;
                        timeController.text = selectedTime.format(context);

                      }
                    },
                  ),
                ),
            ],)
          ],),
        ),

      ),
    );
  }
}

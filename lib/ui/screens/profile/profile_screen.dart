import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:image_picker/image_picker.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../general_component/custom_text_form_filed.dart';
import '../../general_component/drawar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  File? imageFile;
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
              icon: Icon(
                Icons.menu,
                color: ColorManager.black,
              )),
          title: Text(
            'الملف الشخصي',
            style: getBoldStyle(color: ColorManager.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(IconAssets.cart),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (builder) => bottomSheet(),
                          );

                          // setState(() {
                          //   _getFromGallery();
                          // });
                        },
                        child: Center(
                          child: CircleAvatar(
                            radius: 60,
                            foregroundImage: imageFile == null
                                ? Image.asset(
                                    ImageAssets.upload,
                                  ).image
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                            backgroundImage: imageFile == null
                                ? Image.asset(
                                    ImageAssets.upload,
                                  ).image
                                : Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Center(
                    child: Text(
                      'تعديل صورة الملف الشخصي',
                      style: getBoldStyle(color: ColorManager.black),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //name
                  CustomTextFormFiled(
                    label: 'الإسم',
                    hint: 'محمد القاسم',
                    controller: name,
                    enable: false,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  //name of owner
                  CustomTextFormFiled(
                    label: 'البريد الالكتروني',
                    hint: 'email@example.com',
                    controller: name,
                    enable: false,
                  ),
                  //city
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormFiled(
                    label: 'رقم المحمول',
                    hint: '+218 92-848418',
                    controller: name,
                    enable: true,
                  ),
                  //email
                  SizedBox(
                    height: 20.h,
                  ),

                  CustomTextFormFiled(
                    label: 'المدينة',
                    hint: 'طرابلس',
                    controller: name,
                    enable: true,
                  ),
                  //address

                  //password
                  SizedBox(
                    height: 20.h,
                  ),

                  CustomTextFormFiled(
                    label: 'كلمة المرور',
                    hint: '*******************',
                    controller: name,
                    enable: true,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 47,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Center(
                        child: Text('حفظ البيانات'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: DrawarWidget(
            function: () => scaffoldKey.currentState?.closeDrawer()),
      ),
    );
  }

  Future _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Future _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );

    if (pickedFile != null) {
      // File imageFile = File(pickedFile.path);
      final imageTemp = File(pickedFile.path);
      setState(() => this.imageFile = imageTemp);
    }
  }

  Widget bottomSheet() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 120.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Choose Image from',
            style: getBoldStyle(color: ColorManager.primary),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _getFromCamera();
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.camera_alt_rounded)),
                  Text("Camera"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          _getFromGallery();
                          Navigator.pop(context);
                        });
                      },
                      icon: Icon(Icons.image)),
                  Text("Gallery"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

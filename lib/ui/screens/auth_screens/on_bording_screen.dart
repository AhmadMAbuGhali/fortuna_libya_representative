import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/introModel.dart';
import '../../../navigator/router_class.dart';
import '../../../navigator/routes_const.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _IntroPageState();
}

class _IntroPageState extends State<OnBoardingScreen> {
  final List<IntroModle> data = IntroModle.data;
  late PageController _controller;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _activeIndex = _controller.page!.round();
      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(actions:   [
        //   IconButton(onPressed:(){
        //      provider.speak(data[_activeIndex].desc);
        //   },icon: Icon(
        //     Icons.volume_up,color: ColorManager.black,size: 32.w,),
        //   )
        // ],),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: (){
                    RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.login);
                  }, child: Text('تخطي',style: getMediumStyle(color: ColorManager.gray666,fontSize: FontSize.s12),)),
                  SizedBox(width: 21.w,)
                ],
              ),
              Expanded(
                child: PageView.builder(
                    itemCount: data.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          SizedBox(
                            width: 283.w,
                            height: 283.h,
                            child: Image.asset( data[_activeIndex].path),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          Text(
                            data[_activeIndex].title,
                            style: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s18) ,
                          ),
                          SizedBox(
                            height: 70.h,
                          ),
                          Padding(
                            padding:   EdgeInsets.symmetric(horizontal: 30.w),
                            child: Text(
                              data[_activeIndex].desc,
                              style: getRegularStyle(color: ColorManager.onBordingDes,fontSize: FontSize.s14) ,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                        color:_activeIndex==0?ColorManager.primary:ColorManager.onBordIndecator  ,
                        shape: BoxShape.circle
                    ),

                  ),SizedBox(width: 10.w,),
                  Container(
                    width: 15.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                        color:_activeIndex==1?ColorManager.primary:ColorManager.onBordIndecator  ,
                        shape: BoxShape.circle
                    ),

                  ),SizedBox(width: 10.w,),

                ],
              ),
              SizedBox(height: 42.h,)
              ,SizedBox(
                width: MediaQuery.of(context).size.width-222.w,
                height: 44.h,
                child: ElevatedButton(onPressed: (){
                  if (_activeIndex + 1 >= data.length) {
                    RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.login);
                  }
                  _controller.nextPage(
                      duration: const Duration(milliseconds: 250), curve: Curves.ease);
                },child:Text(_activeIndex==0?'التالي':'إبدأ الآن',style: getMediumStyle(color: ColorManager.white,fontSize: FontSize.s16) ,) ,),
              ),
              SizedBox(
                height: 70.h,
              ),

            ],
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/navigator/router_class.dart';
import 'package:fortuna_libya_representative/resources/theme_manager.dart';


void main() async{
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            scaffoldMessengerKey:RouterClass.routerClass.rootScaffoldMessengerKey ,
            debugShowCheckedModeBanner: false,
            navigatorKey: RouterClass.routerClass.navKey,
            theme:getApplicationTheme(),
            home: child,
          );
        },
        child:const SplashScreen()
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}


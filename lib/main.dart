import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortuna_libya_representative/navigator/router.dart';
import 'package:fortuna_libya_representative/navigator/router_class.dart';
import 'package:fortuna_libya_representative/navigator/routes_const.dart';
import 'package:fortuna_libya_representative/resources/theme_manager.dart';
import 'package:fortuna_libya_representative/services/auth_provider.dart';
import 'package:fortuna_libya_representative/services/shared_preference_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;
initSp() async {
  final prefs = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferenceHelper>(() => SharedPreferenceHelper(prefs: prefs ));
  getIt.registerLazySingleton<SharedPreferences>(() => prefs);
  getIt.registerLazySingleton<AuthProvider>(() => AuthProvider());

}
void main() async{
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  initSp();
  runApp( EasyLocalization(
    supportedLocales: const [
      Locale('ar'),
      Locale('en'),
    ],
    path: 'assets/language',
    fallbackLocale: const Locale('ar'),
    startLocale: const Locale('ar'),
    child:const MyApp(),
  ));
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
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale:context.locale,
            // locale: Locale("ar", "PS") ,
            scaffoldMessengerKey:RouterClass.routerClass.rootScaffoldMessengerKey ,
            navigatorKey: RouterClass.routerClass.navKey,
            theme:getApplicationTheme(),
            onGenerateRoute: RouterX.generateRoute,
            initialRoute:NavegatorConstant.task
        );
      },

    );
  }
}




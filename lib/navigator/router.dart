import 'package:flutter/material.dart';

import 'package:fortuna_libya_representative/navigator/routes_const.dart';
import 'package:fortuna_libya_representative/services/auth_provider.dart';
import 'package:fortuna_libya_representative/ui/screens/auth_screens/forget_password.dart';
import 'package:fortuna_libya_representative/ui/screens/auth_screens/login_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/auth_screens/on_bording_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/auth_screens/otp_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/auth_screens/splash_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/home_screens/home_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/notification/notification_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/order/active_order_details.dart';
import 'package:fortuna_libya_representative/ui/screens/order/complete_order_detiles.dart';
import 'package:fortuna_libya_representative/ui/screens/order/order_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/point/point_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/profile/profile_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/report_screen_doctor/add_report_screen_doctor.dart';
import 'package:fortuna_libya_representative/ui/screens/report_screen_doctor/report_doctor_screen.dart';

import 'package:fortuna_libya_representative/ui/screens/support/support_screen.dart';
import 'package:fortuna_libya_representative/ui/screens/task/task.dart';

import 'package:provider/provider.dart';

import '../ui/screens/auth_screens/langauge_screen.dart';
import '../ui/screens/auth_screens/sign_up2_screen.dart';
import '../ui/screens/auth_screens/sing_up_screen.dart';
import '../ui/screens/report_screen_pharm/add_report_screen.dart';
import '../ui/screens/report_screen_pharm/report_pharm_screen.dart';

class RouterX {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavegatorConstant.splash:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: SplashScreen(),
          ),
        );
      case NavegatorConstant.language:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const LangaugeScreen(),
          ),
        );
      case NavegatorConstant.login:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: LoginScreen(),
          ),
        );
      case NavegatorConstant.signUp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: SignUpScreen(),
          ),
        );
      case NavegatorConstant.signUp2:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: SignUpScreen2(),
          ),
        );
      case NavegatorConstant.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case NavegatorConstant.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: ForgetPassword(),
          ),
        );
      case NavegatorConstant.homeApp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: HomeScreen(),
          ),
        );

      case NavegatorConstant.order:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: OrderScreen(),
          ),
        );
      case NavegatorConstant.completeOrderDetails:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const CompleteOrderDetails(),
          ),
        );
      case NavegatorConstant.activeOrderDetails:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const ActiveOrderDetails(),
          ),
        );

      case NavegatorConstant.profile:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const ProfileScreen(),
          ),
        );
      case NavegatorConstant.support:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const SupportScreen(),
          ),
        );
      case NavegatorConstant.point:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: const PointScreen(),
          ),
        );

      case NavegatorConstant.otp:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: OTPScreen(),
          ),
        );
      case NavegatorConstant.reportPharm:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: ReportPharmScreen(),
          ),
        );
        case NavegatorConstant.addReportPharm:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: AddReportPharmScreen(),
          ),
        );
      case NavegatorConstant.addReportDoctor:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: AddReportDoctorScreen(),
          ),
        );
      case NavegatorConstant.reportDoctor:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: ReportDoctorScreen(),
          ),
        );
        case NavegatorConstant.task:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: TaskScreen(),
          ),
        );
        case NavegatorConstant.notificationScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: NotificationScreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

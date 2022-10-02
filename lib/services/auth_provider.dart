import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();

  bool showPassword = true;
  changeShowPass() {
    showPassword = !showPassword;
    notifyListeners();
  }

  bool isLoading = false;
  changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  bool isCheckLogin = false;
  cahngeIscheckLogin() {
    isCheckLogin = !isCheckLogin;
    notifyListeners();
  }


  //
  // login(SentLogin sentLogin) async {
  //   LoginRespons? respontLogin;
  //   respontLogin = await DioClient.dioClient.login(sentLogin);
  //   if (respontLogin != null) {
  //     getProfileData(respontLogin.data!.authToken.toString());
  //     AppConstants.token = respontLogin.data?.authToken;
  //     if (isCheckLogin) {
  //       getIt<SharedPreferenceHelper>().setIsLogin(isLogint: true);
  //       getIt<SharedPreferenceHelper>()
  //           .setUserName(userName1: sentLogin.username!);
  //       getIt<SharedPreferenceHelper>()
  //           .setUserPassword(password1: sentLogin.password!);
  //       getIt<SharedPreferenceHelper>()
  //           .setUserToken(userToken: respontLogin.data!.authToken!);
  //     }
  //   } else {
  //     changeIsLoading();
  //     final snackBar = SnackBar(
  //       content: SizedBox(
  //           height: 32.h,
  //           child: const Center(child: Text('خطأ في إسم المستخدم أو كلمة المرور'))),
  //       backgroundColor: ColorManager.red,
  //       behavior: SnackBarBehavior.floating,
  //       width: 300.w,
  //       duration:const Duration(seconds: 1),
  //     );
  //     RouterClass.routerClass.rootScaffoldMessengerKey.currentState
  //         ?.showSnackBar(snackBar);
  //   }
  //   notifyListeners();
  // }
  // loginDefult(SentLogin sentLogin)async{
  //   print('start login defult');
  //   LoginRespons? respontLogin;
  //   respontLogin = await DioClient.dioClient.login(sentLogin);
  //   if (respontLogin != null) {
  //     getProfileData(respontLogin.data!.authToken.toString());
  //     AppConstants.token = respontLogin.data?.authToken;
  //   }
  //   notifyListeners();
  // }
  // getProfileDataDefult(String token) async {
  //   ProfileModel? profileModel;
  //   profileModel = await DioClient.dioClient.getUserProfile(token);
  //   if (profileModel != null) {
  //     profiledata = profileModel;
  //     AppConstants.profileModel = profileModel;
  //   }
  //   notifyListeners();
  // }
  // getProfileData(String token) async {
  //
  //   ProfileModel? profileModel;
  //   profileModel = await DioClient.dioClient.getUserProfile(token);
  //   if (profileModel != null) {
  //     changeIsLoading();
  //     profiledata = profileModel;
  //     // String userProfileInfo=jsonEncode(profileModel.toJson());
  //     AppConstants.profileModel = profileModel;
  //     // _prefs?.setString('userProfile', userProfileInfo);
  //     RouterClass.routerClass.navigateToAndRemove(NavegatorConstant.naveBarApp);
  //     // String? userr=_prefs?.getString('userProfile');
  //     //
  //   } else {
  //     changeIsLoading();
  //     final snackBar = SnackBar(
  //       content: SizedBox(
  //           height: 32.h,
  //           child: const Center(child: Text('خطأ في إسم المستخدم أو كلمة المرور'))),
  //       backgroundColor: ColorManager.red,
  //       behavior: SnackBarBehavior.floating,
  //       width: 300.w,
  //       duration:const Duration(seconds: 1),
  //     );
  //     RouterClass.routerClass.rootScaffoldMessengerKey.currentState
  //         ?.showSnackBar(snackBar);
  //   }
  //   notifyListeners();
  // }
  //
  // Future<bool?> resetSendCode() async {
  //   bool? success;
  //   success = await DioClient.dioClient
  //       .resetSendCode(emailSendCodeController.text.trim());
  //   return success;
  // }
  //
  // Future<bool?> verifyResetSendCode() async {
  //   bool? success;
  //   success = await DioClient.dioClient.verifyResetSendCode(
  //       emailSendCodeController.text.trim(), sendCodeController.text);
  //   return success;
  // }
  //
  // Future<bool?> resetPassword(String newPassword) async {
  //   bool? success;
  //   success = await DioClient.dioClient.resetPassword(
  //       emailSendCodeController.text.trim(),
  //       sendCodeController.text,
  //       newPassword);
  //   return success;
  // }
  //
  // logOut(){
  //   profiledata=null;
  //   getIt<SharedPreferenceHelper>().setIsLogin(isLogint:false);
  //   getIt<SharedPreferenceHelper>().setUserName(userName1:'');
  //   getIt<SharedPreferenceHelper>().setUserPassword(password1:'');
  //   getIt<SharedPreferenceHelper>().setUserToken(userToken:'');
  // }
}

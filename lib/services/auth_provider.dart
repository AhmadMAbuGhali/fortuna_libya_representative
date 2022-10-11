import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider();
  bool isLoading = false;
  changeIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }
  bool showPass = false;
  changeShowPass() {
    showPass = !showPass;
    notifyListeners();
  }

  //save login
  bool isCheckLogin = false;
  changeIsCheckLogin() {
    isCheckLogin = !isCheckLogin;
    notifyListeners();
  }
  //login Controller
  TextEditingController loginEmailController=TextEditingController();
  TextEditingController loginPasswordController=TextEditingController();
  //forget Controller
  TextEditingController forgetEmailController=TextEditingController();
  //Register Controller
  TextEditingController registerNameController=TextEditingController();
  TextEditingController registerNameManagerController=TextEditingController();
  TextEditingController registerPhoneController=TextEditingController();
  TextEditingController registerEmailController=TextEditingController();
  TextEditingController registerAddressController=TextEditingController();
  TextEditingController registerLoginPasswordController=TextEditingController();

}

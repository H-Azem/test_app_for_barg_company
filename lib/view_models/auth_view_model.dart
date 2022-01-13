import 'package:barg_flutter_test/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController{

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController usernameController, passwordController;
  var username = '';
  var password = '';
  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "username should not be empty";
    }
    if (value.length < 3) {
      return "please enter a valid username";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "password should not be empty";
    }
    if (value.length < 6) {
      return "password must be of 6 characters";
    }
    return null;
  }

  void checkLogin(username,pass) {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    if(username == 'user' && pass == '123456'){
      Get.to( HomeView());
    }
    else{
      Get.snackbar('Auth Error', 'Username or password id wrong');
    }
    loginFormKey.currentState!.save();


  }

}
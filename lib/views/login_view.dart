import 'package:barg_flutter_test/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

class LoginView extends GetView<AuthViewModel> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AuthViewModel());
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      child: Form(
        key: controller.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .2,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    labelText: "username",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.usernameController,
                  onChanged: (value) {
                    controller.username = value!;
                  },
                  validator: (value) {
                    return controller.validateEmail(value!);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    labelText: "password",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  controller: controller.passwordController,
                  onChanged: (value) {
                    controller.password = value!;
                  },
                  validator: (value) {
                    return controller.validatePassword(value!);
                  },
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 300),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                      padding: MaterialStateProperty.all(EdgeInsets.all(14)),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    onPressed: () {

                      controller.checkLogin(
                          controller.username, controller.password);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

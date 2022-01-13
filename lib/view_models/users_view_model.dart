import 'dart:convert';
import 'package:barg_flutter_test/models/user_model.dart';
import 'package:barg_flutter_test/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:freezed_annotation/freezed_annotation.dart';

class UsersViewModel extends GetxController{

  getData()async{
    final response =
    await rootBundle.loadString('assets/usersProfile.json');
    try {
      var data = jsonDecode(response);
      List<UserModel> loaded = [];
      for (int i = 0; i < data.length; i++) {
        var result = UserModel.fromJson(data[i]);
        loaded.add(result);
      }
      print(loaded);
      return loaded;
    }
    catch(e){
      Get.snackbar('Can not get data', e.toString());
    }
  }


  goToProfile(){

    Get.to(ProfileView(), arguments: ["First data", "Second data"]);

  }
}
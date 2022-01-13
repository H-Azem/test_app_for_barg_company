import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';


@freezed
abstract class UserModel with _$UserModel {
const factory UserModel({
  required String name,
  required String email,
  required String address,

})= _UserModel;

factory UserModel.fromJson(Map<String,dynamic> json) => _$UserModelFromJson(json);

}
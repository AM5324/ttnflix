
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: true)
class UserModel {
  final String? username;
  final String? password;
  final String? dob;
  final String? gender;
  final String? name;

  UserModel({this.password, this.dob, this.gender, this.username, this.name});

  // Convert the model to a map for serialization
  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  // Override toString to provide a meaningful representation
  @override
  String toString() {
    return 'UserModel{username: $username, password: $password, dob: $dob, gender: $gender, name: $name}';
  }
}
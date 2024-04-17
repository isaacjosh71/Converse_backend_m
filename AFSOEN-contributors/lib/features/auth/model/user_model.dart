import 'package:afsoen/features/auth/enum/gender.dart';

class UserModel {
  String uid;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  List<String> interests;
  String hobby;
  String dob;
  Gender gender;
  String avatar;

  UserModel({
    required this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.interests,
    required this.dob,
    required this.gender,
    required this.hobby,
    required this.avatar,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'interest': interests,
        'hobby': hobby,
        'dob': dob,
        'gender': gender.name,
        'avatar': avatar,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'] ?? '',
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        email: json['email'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        interests: json['interests'] ?? [],
        hobby: json['hobby'] ?? '',
        dob: json['dob'] ?? '',
        gender: json['gender'] ?? '',
        avatar: json['avatar'] ?? '',
      );
}

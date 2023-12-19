import 'package:eggymood_app/core/constants/firebase_field_names.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class UserModel {
  final DateTime birthDay;
  final DateTime createdAt;
  final String email;
  final List<String> friends;
  final String gender;
  final String uid;
  final String? profileBio;
  final String profileName;
  final String? profilePicUrl;
  final List<String> receivedRequests;
  final List<String> sentRequests;

  const UserModel({
    required this.birthDay,
    required this.createdAt,
    required this.email,
    required this.friends,
    required this.gender,
    required this.uid,
    this.profileBio,
    required this.profileName,
    this.profilePicUrl,
    required this.receivedRequests,
    required this.sentRequests,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      FirebaseFieldNames.birthDay         : birthDay.toUtc().toIso8601String(),
      FirebaseFieldNames.createdAt        : createdAt.toUtc().toIso8601String(),
      FirebaseFieldNames.email            : email,
      FirebaseFieldNames.friends          : friends,
      FirebaseFieldNames.gender           : gender,
      FirebaseFieldNames.uid              : uid,
      FirebaseFieldNames.profileBio       : profileBio,
      FirebaseFieldNames.profileName      : profileName,
      FirebaseFieldNames.profilePicUrl    : profilePicUrl,
      FirebaseFieldNames.receivedRequests : receivedRequests,
      FirebaseFieldNames.sentRequests     : sentRequests,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      birthDay          : DateTime.parse(map[FirebaseFieldNames.birthDay] as String),
      createdAt         : DateTime.parse(map[FirebaseFieldNames.createdAt] as String),
      email             : map[FirebaseFieldNames.email] as String,
      friends           : List<String>.from((map[FirebaseFieldNames.friends] ?? [])),
      gender            : map[FirebaseFieldNames.gender] as String,
      uid               : map[FirebaseFieldNames.uid] as String,
      profileBio        : map[FirebaseFieldNames.profileBio] as String,
      profileName       : map[FirebaseFieldNames.profileName] as String,
      profilePicUrl     : map[FirebaseFieldNames.profilePicUrl] as String,
      receivedRequests  : List<String>.from((map[FirebaseFieldNames.receivedRequests] ?? [])),
      sentRequests      : List<String>.from((map[FirebaseFieldNames.sentRequests] ?? [])),
    );
  }
}

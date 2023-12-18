import 'package:eggymood_app/core/constants/firebase_field_names.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class User {
  final DateTime birthDay;
  final DateTime createdAt;
  final String email;
  final List<String> friends;
  final String gender;
  final String id;
  final String password;
  final String profileBio;
  final String profileName;
  final String profilePicUrl;
  final List<String> receivedRequests;
  final List<String> sentRequests;

  const User({
    required this.birthDay,
    required this.createdAt,
    required this.email,
    required this.friends,
    required this.gender,
    required this.id,
    required this.password,
    required this.profileBio,
    required this.profileName,
    required this.profilePicUrl,
    required this.receivedRequests,
    required this.sentRequests,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      FirebaseFieldNames.birthDay: birthDay,
      FirebaseFieldNames.createdAt: createdAt,
      FirebaseFieldNames.email: email,
      FirebaseFieldNames.friends: friends,
      FirebaseFieldNames.gender: gender,
      FirebaseFieldNames.id: id,
      FirebaseFieldNames.password: password,
      FirebaseFieldNames.profileBio: profileBio,
      FirebaseFieldNames.profileName: profileName,
      FirebaseFieldNames.profilePicUrl: profilePicUrl,
      FirebaseFieldNames.receivedRequests: receivedRequests,
      FirebaseFieldNames.sentRequests: sentRequests,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      birthDay: map[FirebaseFieldNames.birthDay] as DateTime,
      createdAt: map[FirebaseFieldNames.createdAt] as DateTime,
      email: map[FirebaseFieldNames.email] as String,
      friends: List<String>.from((map[FirebaseFieldNames.friends] ?? [])),
      gender: map[FirebaseFieldNames.gender] as String,
      id: map[FirebaseFieldNames.id] as String,
      password: map[FirebaseFieldNames.password] as String,
      profileBio: map[FirebaseFieldNames.profileBio] as String,
      profileName: map[FirebaseFieldNames.profileName] as String,
      profilePicUrl: map[FirebaseFieldNames.profilePicUrl] as String,
      receivedRequests: List<String>.from((map[FirebaseFieldNames.receivedRequests] ?? [])),
      sentRequests: List<String>.from((map[FirebaseFieldNames.sentRequests] ?? [])),
    );
  }
}

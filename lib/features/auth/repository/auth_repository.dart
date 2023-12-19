import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eggymood_app/core/constants/firebase_collection_names.dart';
import 'package:eggymood_app/core/constants/storage_folder_names.dart';
import 'package:eggymood_app/core/utils/utils.dart';
import 'package:eggymood_app/features/auth/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth            = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage      = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore  = FirebaseFirestore.instance;

  // Registro de Usuario / Sign Up Method
  Future<UserCredential?> signUpUser({
    required DateTime birthDay,
    required String email,
    required String gender,
    required String profileName,
    File? profilePictureImage,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
          email   : email.trim(),
          password: password.trim(),
        );

      final path = _firebaseStorage
        .ref(StorageFolderNames.profilePictures)
        .child(FirebaseAuth.instance.currentUser!.uid);

      if (profilePictureImage == null) return null;

      final TaskSnapshot taskSnapshot = await path.putFile(profilePictureImage);
      final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      UserModel userModel = UserModel(
        birthDay        : birthDay,
        createdAt       : DateTime.now(),
        email           : email,
        friends         : const [],
        gender          : gender,
        uid             : FirebaseAuth.instance.currentUser!.uid,
        profileName     : profileName,
        profilePicUrl   : downloadUrl,
        receivedRequests: const [],
        sentRequests    : const [],
      );

      await _firebaseFirestore
        .collection(FirebaseCollectionNames.users)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(userModel.toMap());

      return userCredential;
    } on FirebaseAuthException catch (e) {
      showToastMessage(message: e.toString());
    }
    return null;
  }

  // Inicio de Sesión / Sign In Method
  Future<UserCredential?> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
          email   : email,
          password: password,
        );

        return userCredential;
    } on FirebaseAuthException catch (e) {
      showToastMessage(message: e.toString());
    }
    return null;
  }

  // Cierre de Sesión / Sign Out Method
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
}
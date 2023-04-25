import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/state_manager.dart';

enum UploadState { LOADING, ERROR, SUCCESS }

mixin FireStorage {
  Rxn<UploadState> uploadState = Rxn();

  final storage = FirebaseStorage.instance;
  Reference get storageRef => storage.ref();

  Future<void> uploadImage(File file, String fileName) async {
    final avatarRef = storage.ref("avatar/$fileName");
    try {
      await avatarRef.putFile(file);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      await storage
          .ref('test/$fileName')
          .putFile(file)
          .then((value) => print(value));
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  //Lista todos os itens
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('test').listAll();
    results.items.forEach((firebase_storage.Reference ref) {
      // print('Found file: $ref');
    });
    return results;
  }

  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('test/$imageName').getDownloadURL();
    return downloadURL;
  }
}

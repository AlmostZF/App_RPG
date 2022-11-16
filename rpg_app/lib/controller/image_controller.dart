import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rpg_app/controller/service.dart';
import 'package:http/http.dart' as http;


import '../model/model_image.dart';

class ControllerImage{

  XFile? file;
  ImageModel? imageModel;
  ServiceImage serviceImage = ServiceImage();
  bool loading = false;
  

    Future<void> getImage(ImageSource source) async {
    XFile? imageReq = await ImagePicker.platform.getImage(source: source);
    file = imageReq;
  }

  Future<String> convertImage() async {
    List<int> imageBytes = await file!.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

    Future<void> buildContextBody(BuildContext context) async {
    List<String> param = file!.path.split('/');
    List<String> paramSufix = param.last.toString().split('.');
    String fileName = paramSufix.first;
    String ext = '.' + paramSufix.last;
    String mimetype = 'image/' + paramSufix.last;
    imageModel = ImageModel();
    Map<String, dynamic> data = {
      "base64": await convertImage(),
      "extension": ext,
      "fileName": fileName,
      "mimetype": mimetype
    };
    imageModel = ImageModel.fromJson(data);
    await serviceImage.registerImage(imageModel!.sendToJson()).then((value) async {
      if(value != null){
        print(value['photoUrl']);
        String avatarUrl = value['photoUrl'];
        
        Map userphoto = {
          avatarUrl: avatarUrl,
        };
      }
    });
}
}  
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rpg_app/model/person_model.dart';

class ServiceImage {
    Future<dynamic> registerImage(Map body) async {
      var uri =
        Uri.parse('https://stdrpg-default-rtdb.firebaseio.com/person');
    final response = await http.put(uri, body: json.encode(body));

    return response.body;
  }
}
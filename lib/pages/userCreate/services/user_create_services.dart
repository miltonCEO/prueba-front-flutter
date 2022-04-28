import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterUserService extends ChangeNotifier {

  final String _baseUrl = 'https://prueba-productos.herokuapp.com/api/v1/auth/register';

  register (String email, String name, String password) async {

    final Map<String, dynamic> registerData = {
      'fullName': name,
      'email': email,
      'password': password
    };

    var url = Uri.parse(_baseUrl);
    final resp = await http.post(url, body: {'fullName': name, 'email': email, 'password': password});
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('_id')) {
      return null;
    }else{
      return decodeResp['error'];
    }
  }

}
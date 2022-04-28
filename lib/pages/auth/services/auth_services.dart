import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {

  final String _baseUrl = 'https://prueba-productos.herokuapp.com/api/v1/auth/login';

  login (String email, String password) async {

    final Map<String, dynamic> authData = {
      'email': email,
      'password': password
    };

    var url = Uri.parse(_baseUrl);
    final resp = await http.post(url, body: {'email': email, 'password': password});
    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if(decodeResp.containsKey('accessToken')) {
      return null;
    }else{
      return decodeResp['error']['message'];
    }

    
  }
}
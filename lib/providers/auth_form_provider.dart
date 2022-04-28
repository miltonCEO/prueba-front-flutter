import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {

  GlobalKey <FormState> formKey = new GlobalKey<FormState> ();

  String email    = '';
  String password = '';

  bool isValidForm( ){
    return formKey.currentState?.validate() ?? false;
  }
}
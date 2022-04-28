import 'package:flutter/material.dart';

class RegisterUserProvider extends ChangeNotifier {

  GlobalKey <FormState> formKey = new GlobalKey<FormState> ();

  String email    = '';
  String name    = '';
  String password = '';

  bool isValidForm( ){
    return formKey.currentState?.validate() ?? false;
  }
}
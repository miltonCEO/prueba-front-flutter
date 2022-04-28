// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_prueba/pages/services.dart';
import 'package:flutter_prueba/pages/ui/input_decorations.dart';
import 'package:flutter_prueba/pages/userCreate/services/user_create_services.dart';
import 'package:flutter_prueba/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/register_form_provider.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250),
                CardContainer(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text('Registrar usuario', style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: 30),

                      ChangeNotifierProvider(
                          create: (_) => RegisterUserProvider(),
                          child: _AuthForm(),
                        ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          )
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final authForm = Provider.of<RegisterUserProvider>(context);

    return Container(
      child: Form(

        key: authForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'example.example.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: (value) => authForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                : 'El correo electronico no es correcto';
              }
            ),
            SizedBox(height: 30,),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre',
                labelText: 'Nombre',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => authForm.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'El nombre debe ser mayor a 6 caracteres';                                    
                  
              },
            ),

            SizedBox(height: 30,),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*******',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline
              ),
              onChanged: (value) => authForm.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';                                    
                  
              },
            ),
            SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.green,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () async{
                final registerService = RegisterUserService();
                if(!authForm.isValidForm()) return;
                final String? errorMassage = await registerService.register(authForm.email, authForm.name,authForm.password);
                if(errorMassage == null){
                  Navigator.pushReplacementNamed(context, 'auth');
                }else{
                  print(errorMassage); 
                }
              }
            )
          ],
        ),
      ),
    );
  }
}
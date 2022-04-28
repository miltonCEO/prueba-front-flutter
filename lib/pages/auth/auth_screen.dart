// ignore_for_file: use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_prueba/pages/services.dart';
import 'package:flutter_prueba/pages/ui/input_decorations.dart';
import 'package:flutter_prueba/providers/auth_form_provider.dart';
import 'package:flutter_prueba/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {

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
                      Text('Login', style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: 30),

                      ChangeNotifierProvider(
                          create: (_) => AuthProvider(),
                          child: _AuthForm(),
                        ),
                      
                    ],
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.green.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                  child: Text('Crear un nuevo usuario', style: TextStyle(fontSize: 18, color: Colors.black87))
                ),
                
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

    final authForm = Provider.of<AuthProvider>(context);

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
                hintText: 'example@example.com',
                labelText: 'Correo electrónico',
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
                  'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: () async{
                final authService = AuthService();
                if(!authForm.isValidForm()) return;

                final String? errorMassage = await authService.login(authForm.email, authForm.password);
                if(errorMassage == null){
                  Navigator.pushReplacementNamed(context, 'home');
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
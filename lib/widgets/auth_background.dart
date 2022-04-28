// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  final Widget child;

  const AuthBackground(
      {Key? key, 
      required this.child}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _VioletBox(),
          //_HeaderIcon(),
          this.child
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Icon(Icons.person_pin, color: Colors.white, size: 100,),
      )
    );
  }
}

// ignore: duplicate_ignore
class _VioletBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _buildBoxDecoration(),
      /*child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, right: -20),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 30),
        ],
      ),*/
    );
  }

  // ignore: prefer_const_constructors
  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      // ignore: prefer_const_literals_to_create_immutables
      colors: [
        Color.fromARGB(255, 93, 158, 63),
        Color.fromARGB(255, 70, 165, 178)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}
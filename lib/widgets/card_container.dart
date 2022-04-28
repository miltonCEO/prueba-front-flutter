// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer(
      {Key? key, 
      required this.child}
    ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 30 ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: _create_card_shape(),
        child: this.child, 
      ),
    );
  }

  BoxDecoration _create_card_shape() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  );
}
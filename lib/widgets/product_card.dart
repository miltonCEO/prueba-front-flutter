import 'package:flutter/material.dart';
import 'package:flutter_prueba/pages/home/model/product.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard(
      {
        Key? key, 
        required this.product
      }
    ) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 40),
        width: double.infinity,
        height: 100,
        decoration: _cardBorder(),
        child: Center(
          child: Text(product.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          
        ),
      ),
    );
  }

  BoxDecoration _cardBorder() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,5),
        blurRadius: 10
      )
    ],
    
  );
}
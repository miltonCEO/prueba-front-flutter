

// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_prueba/pages/models.dart';
import 'package:http/http.dart' as http;

class ProductServices extends ChangeNotifier {

  final String _baseUrl = 'flutter-varios-a9c77-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

  ProductServices() {
    this.loadProduct();
  }
  //<List<Product>> 
  Future <List<Product>> loadProduct() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productMap = json.decode(resp.body);
    //print(productMap);
    productMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });
    
    this.isLoading = false;
    notifyListeners();

    return this.products;
  }
  
}
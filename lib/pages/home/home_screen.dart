// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_prueba/pages/services.dart';
import 'package:flutter_prueba/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos usuario'),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
          itemBuilder: ((context, index) => ProductCard(
            product: productService.products[index],
          ))
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print('agregar producto');
          },
        ),
    );
  }
}
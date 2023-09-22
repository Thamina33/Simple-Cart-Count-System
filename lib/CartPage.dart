import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CartScreen extends StatelessWidget {
  final String counter;
  const CartScreen({super.key , required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () { Navigator.pop(context); },

            );
          },
        ),
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Center(
          child: Text("Total Products: $counter" , style: TextStyle(
            fontSize: 20,
          ),),
        ),
      ),
    );
  }
}

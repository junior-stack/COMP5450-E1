import 'package:flutter/material.dart';
import 'package:exercise1/data/Item.dart';

class ItemPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Item"),
        centerTitle: true,
      ),
      body: Text("Item page")
    );
  }
}
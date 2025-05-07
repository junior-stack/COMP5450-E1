import 'package:flutter/material.dart';
import 'package:exercise1/data/Item.dart';

class ItemPage extends StatefulWidget {

  @override
  _ItemPageState createState() => _ItemPageState();


}

class _ItemPageState extends State<ItemPage> {

  @override
  Widget build(BuildContext context){
    if(ModalRoute.of(context)!.settings.arguments == null){
      return Scaffold(
        appBar: AppBar(title: Text("Item"), centerTitle: true),
        body: Center(child: Text("Invalid access. No data provided"))
      );
    }

    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    final String imageUrl = data["imageUrl"];
    final String title = data["title"];
    final String description = data["description"];
    final double price = data["price"];


    return Scaffold(
        appBar: AppBar(
          title: Text("Item"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            )),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  Text("\$$price", textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),)
                ],
              )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(description),
            )
          ],
        )
    );
  }
}
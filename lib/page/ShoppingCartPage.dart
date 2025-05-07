import 'package:flutter/material.dart';
import 'package:exercise1/data/Item.dart';

class ShoppingCartPage extends StatefulWidget {

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  @override
  Widget build(BuildContext context){
    if(ModalRoute.of(context)!.settings.arguments == null){
      return Scaffold(
          appBar: AppBar(title: Text("Shopping Cart"), centerTitle: true),
          body: Center(child: Text("Invalid access. No data provided"))
      );
    }

    final List<Item> rawdata = ModalRoute.of(context)!.settings.arguments as List<Item>;
    final List<Item> data = rawdata.where((element) => element.added).toList();
    final total = data.length == 0 ? 0 : data.map((e) => e.price).reduce((value, element) => value + element);
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final d = data[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    d.imageURI,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    d.title,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Text("\$${d.price}", style: TextStyle(fontSize: 16))
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).appBarTheme.backgroundColor ?? Theme.of(context).primaryColor,
        elevation: 4,
        child: Container(
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text("\$$total", style: TextStyle(fontSize: 20, color: Colors.white))
            ],
          ),
        )
      ),
    );
  }
}
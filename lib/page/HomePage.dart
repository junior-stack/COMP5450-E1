import 'package:flutter/material.dart';
import 'package:exercise1/data/Item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<Item> _items = [
    Item("shoe",
        "https://static.nike.com/a/images/f_auto,cs_srgb/w_960,c_limit/63c81961-0e99-47d0-a905-7893ca9df07b/men-s-shoes-clothing-accessories.png",
        false),
    Item("Nike",
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/d4e3b9c4-ed5c-4ab9-b66b-74dbd6ca199a/men-s-shoes-clothing-accessories.png",
        false),
    Item("sneakers",
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/8599251f-ed87-4442-898c-6ce26b28dfbf/men-s-shoes-clothing-accessories.png",
        false)
  ];


  void _toShoppingCart() {
    Navigator.pushNamed(context, "/shoppingCart");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: _items.map((item) => GalleryCard(imageUrl: item.imageURI, title: item.title)).toList(),

      ),
      floatingActionButton: FloatingActionButton(
        // jump to the shopping cart page
        onPressed: _toShoppingCart,
        tooltip: 'shopping cart',
        child: const Icon(Icons.add_shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class GalleryCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const GalleryCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/item");
        },
        child: Column(
          children: [
            Expanded(child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl, fit: BoxFit.cover)
            )),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(title, textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                )
              ],
            )

          ],
        ),
      )
    );
  }
}
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
    Item("General Shoes",
        "https://static.nike.com/a/images/f_auto,cs_srgb/w_960,c_limit/63c81961-0e99-47d0-a905-7893ca9df07b/men-s-shoes-clothing-accessories.png",
        "The Field General returns from its gritty American football roots to shake up the sneaker scene. It pairs synthetic leather and tough textiles with a nubby Waffle sole—creating that vintage gridiron look. Step into a piece of sneaker history and carve your own path into the future.\nColour Shown: Elemental Pink/Gum Medium Brown/Obsidia.\nStyle: FZ5593-600\nCountry/Region of Origin: Vietnam",
        135),
    Item("Nike P-6000",
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/d4e3b9c4-ed5c-4ab9-b66b-74dbd6ca199a/men-s-shoes-clothing-accessories.png",
        "Look to the future with the Nike P-6000. Refreshing the 2006 Air Pegasus with space-age details, like chrome synthetic leather and metallic fabric, this shoe is ready for whatever's next.\nColour Shown: Metallic Silver/Sail/Black/Metallic Silver\nStyle: CN0149-001\nCountry/Region of Origin: Vietnam\n",
        30),
    Item("Air Max Dn8",
        "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/8599251f-ed87-4442-898c-6ce26b28dfbf/men-s-shoes-clothing-accessories.png",
        "More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement.\nColour Shown: Black/Indigo Burst/Total Orange/Fierce Purple\nStyle: FQ7860-009\nCountry/Region of Origin: Vietnam",
        60),
    Item("Pegasus 41",
    "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/898c7faa-3229-4b9d-907b-7995b3a2f0cb/men-s-shoes-clothing-accessories.png",
    "Responsive cushioning in the Pegasus provides an energised ride for everyday road running. Experience lighter-weight energy return with dual Air Zoom units and a ReactX foam midsole. Plus, improved engineered mesh on the upper decreases weight and increases breathability.\nColour Shown: Black/Anthracite/White\nStyle: FD2722-002\nCountry/Region of Origin: Indonesia, Vietnam",
    70),
    Item("Vomero 18",
    "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/40295882-3292-437f-bf2b-4990740447b9/men-s-shoes-clothing-accessories.png",
    "Maximum cushioning in the Vomero provides a comfortable ride for everyday runs. Our softest, most cushioned ride has lightweight ZoomX foam stacked on top of responsive ReactX foam in the midsole. Plus, a redesigned traction pattern offers a smooth heel-to-toe transition.\nColour Shown: Sail/Hyper Pink/Hyper Pink/Sequoia\nStyle: IB7315-100\nCountry/Region of Origin: Vietnam",
    45),
    Item("Air Max Plus",
    "https://static.nike.com/a/images/f_auto/dpr_1.0,cs_srgb/w_1807,c_limit/f8bdbc8a-f412-483a-8c5e-0fc695cc9e4a/men-s-shoes-clothing-accessories.png",
    "Let your attitude have the edge in the Air Max Plus. Its iconic caging adds heat to your look while airy mesh keeps you cool. And the visible cushioning lets you celebrate your defiant style in comfort.\nColour Shown: Black/University Gold/White\nStyle: DM0032-013\nCountry/Region of Origin: Indonesia",
    25)
  ];


  void _toShoppingCart() {
    Navigator.pushNamed(context, "/shoppingCart", arguments: _items);
  }

  void updateCartStatus(int index){
    List<Item> newItems = []..addAll(_items);
    newItems[index].added = !newItems[index].added;
    setState((){
      _items = newItems;
    });
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
        children: _items.asMap().map((i, item) =>
            MapEntry(i,
                GalleryCard(
                  item: item,
                  index: i,
                  onUpdate: updateCartStatus,
                )
            )).values.toList(),

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
  final Item item;
  final int index;
  final Function(int) onUpdate;

  const GalleryCard({required this.item, required this.index, required this.onUpdate});

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, "/item", arguments: {
              "imageUrl": item.imageURI,
              "title": item.title,
              "description": item.description
            });
          },
          child: Column(
            children: [
              Expanded(child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(item.imageURI, fit: BoxFit.cover)
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(item.title, textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),),
                  ),
                  IconButton(onPressed: item.added ? null : () => onUpdate(index), icon: Icon(Icons.add))
                ],
              )

            ],
          ),
        )
    ),
        if(item.added)
          Positioned(
            right: 8,
            top: 8,
            child: GestureDetector(
              onTap: () => onUpdate(index),
              child: Icon(
              Icons.close,
              size: 20,
              color: Colors.grey[700],
              ),
            ),
          ),

      ],
    );
  }
}
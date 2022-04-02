// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors
import 'package:artohm/pages/cart.dart';
import 'package:provider/provider.dart';
import 'package:artohm/producttiles.dart';
import 'package:flutter/material.dart';
import 'package:artohm/pages/home.dart';
import 'Models/products.dart';
import './Models/cartmodel.dart';

Widget myLabel(String label, MaterialAccentColor blueAccent,
    {Color textColor = Colors.amber, double size = 23}) {
  return (Text(
    label,
    style: TextStyle(
        color: textColor, fontSize: size, fontWeight: FontWeight.w600),
  ));
}

Widget myTextField() {
  return TextField(
    // return (TextField(autocorrect: ,))
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'Enter a search term',
    ),
  );
}

SnackBar createSnackBar(String message) {
  var priColor;
  return SnackBar(
      backgroundColor: priColor,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: snackText(),
      ));
}

snackText() {
  return TextStyle();
}

//add this class to mywidgets, we will use it for Progress Bar
class DialogBuilder {
  DialogBuilder(this.context);

  final BuildContext context;

  void showLoadingIndicator(String text, String header) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0))),
              backgroundColor: Colors.blue,
              content: LoadingIndicator(text: text, header: header),
            ));
      },
    );
  }

  void hideOpenDialog() {
    Navigator.of(context).pop();
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({this.text = '', this.header = ''});

  final String text;
  final String header;

  @override
  Widget build(BuildContext context) {
    var displayedText = text;
    var headerText = header;
    return Container(
        padding: EdgeInsets.all(16),
        color: Colors.white60,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _getLoadingIndicator(),
              _getHeading(context, headerText),
              _getText(displayedText)
            ]));
  }

  Padding _getLoadingIndicator() {
    return Padding(
        child: Container(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.deepOrange,
            ),
            width: 32,
            height: 32),
        padding: const EdgeInsets.only(bottom: 16));
  }

  Widget _getHeading(context, String headerText) {
    return Padding(
        child: Text(
          headerText,
          textAlign: TextAlign.center,
        ),
        padding: const EdgeInsets.only(bottom: 4));
  }

  Text _getText(String displayedText) {
    return Text(
      displayedText,
      textAlign: TextAlign.center,
    );
  }
}

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return ListView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              // create: (context) => products[index],
              value: products[index],
              child: ProductTile(
                priceInShillings: products[index].priceInShillings,
                productName: products[index].productName,
                rating: products[index].rating,
                imgUrl: products[index].imgUrl,
                id: products[index].id,
                description: products[index].description,
              ),
            )

        // itemBuilder: (ctx,index)=>ProductTile(description: '',),
        );
  }
}

class StickersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stickersData = Provider.of<Products>(context);
    final stickers = stickersData.stickers;
    return ListView.builder(
        itemCount: stickers.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return StickerTile(
            priceInShillings: stickers[index].priceInShillings,
            productName: stickers[index].productName,
            imgUrl: stickers[index].imgUrl,
            rating: stickers[index].rating,
            description: stickers[index].description,
            id: stickers[index].description,
          );
        });
  }
}

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryData = Provider.of<Products>(context);
    final categories = categoryData.category;
    return ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryTile(
            categoryName: categories[index].categoryName,
            imgAssetPath: categories[index].imgAssetPath,
            color1: categories[index].color1,
            color2: categories[index].color2,
          );
        });
  }
}

enum FavoriteCategories {
  Favorites,
  All,
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // ignore: prefer_const_constructors

      decoration: BoxDecoration(
        color: Color.fromARGB(77, 192, 167, 167),
        
        border: Border(
            top: BorderSide(color: Colors.black26, width: 3.0),
            bottom: BorderSide(color: Colors.black26, width: 2.0)),
      ),
      child: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              },
              icon: const Icon(
                Icons.home_outlined,
                color: Color.fromARGB(255, 8, 0, 0),
                    

                size: 30,
              ),
            ),

            
            Consumer<Cart>(
              builder: (_, cartData, ch) =>
               Badge(
                color: Colors.accents.last,
                child: IconButton(
                  enableFeedback: false,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => cart()));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 8, 0, 0),
                    size: 30,
                  ),
                ),
                value: cartData.itemCount.toString(),

              ),
              
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 8, 0, 0),
                size: 30,
              ),
            ),
            // IconButton(
            //   enableFeedback: false,
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.chat_bubble_outline_rounded,
            //     color: Color.fromARGB(255, 8, 0, 0),
            //     size: 30,
            //   ), 
            // ),
            PopupMenuButton(
                onSelected: (FavoriteCategories chosenValue) {
                  if (chosenValue==FavoriteCategories.Favorites){

                  }else{

                  }
                },
                icon: Icon(
                  Icons.more_vert,
                ),
                itemBuilder: (_) => [
                      PopupMenuItem(
                        child: Text('Favorites'),
                        value: FavoriteCategories.Favorites,
                      ),
                      PopupMenuItem(
                        child: Text('All'),
                        value: FavoriteCategories.All,
                      )
                    ])
          ],
        );
      }),
    );
  }
}




// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, deprecated_member_use, prefer_if_null_operators, unnecessary_null_comparison

import 'package:artohm/Models/cartmodel.dart';
import 'package:artohm/Models/productsmodel.dart';
import 'package:artohm/pages/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final double priceInShillings;
  final String productName;
  final int rating;
  final String imgUrl;
  final String description;
  final String id;

  ProductTile({
    Key? key,
    required this.priceInShillings,
    required this.imgUrl,
    required this.rating,
    required this.productName,
    required this.id,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(
      context,
    );
    final cart=Provider.of<Cart>(context, listen: false);
    return Container(
      // width: 200,
      margin: EdgeInsets.only(right: 16),

      child: Column(
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetail.routeName,
                    arguments: productModel.id,
                  );
                },
                child: Image.network(
                  imgUrl,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 25,
                width: 75,
                margin: EdgeInsets.only(left: 8, top: 8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      const Color(0xff8EA2FF).withOpacity(0.5),
                      const Color(0xff557AC7).withOpacity(0.5)
                    ])),
                child: Text(
                  "\Ksh $priceInShillings",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 120,
                  top: 100,
                ),
                child: Consumer(
                  builder: (ctx, ProductModel, _) => IconButton(
                    icon: Icon(productModel.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      productModel.favoriteOrNot();
                    },
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(productName),
              // Icons.margin
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  cart.addItem(productModel.id, productModel.priceInShillings, productModel.productName);
                },
                color: Theme.of(context).accentColor,
              )
            ],
          ),
          // SizedBox(
          //   height: 8,
          // ),
        ],
      ),
    );
  }
}

class StickerTile extends StatelessWidget {
  final int priceInShillings;
  final String productName;
  final String imgUrl;
  final int rating;
  final String description;
  final String id;

  StickerTile({
    Key? key,
    required this.priceInShillings,
    required this.productName,
    required this.imgUrl,
    required this.rating,
    required this.id,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(children: [
        Stack(
          children: [
            Image.asset(
              imgUrl,
              height: 140,
              fit: BoxFit.cover,
            ),
            Container(
              height: 25,
              width: 75,
              margin: EdgeInsets.only(left: 8, top: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  gradient: LinearGradient(colors: [
                    const Color(0xff8EAFF).withOpacity(0.5),
                    const Color(0xff557AC7).withOpacity(0.5),
                  ])),
              child: Text(
                "\Ksh$priceInShillings",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        Text(productName),
        SizedBox(
          height: 8,
        )
      ]),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String categoryName;
  final String imgAssetPath;
  final String color1;
  final String color2;
  CategoryTile(
      {required this.imgAssetPath,
      required this.color2,
      required this.color1,
      required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 65,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(int.parse(color1)),
                  Color(int.parse(color2))
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
                child: Image.asset(
              imgAssetPath,
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}



class Badge extends StatelessWidget {
  const Badge({
     Key? key,
    required this.child,
    required this.value,
    required this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}

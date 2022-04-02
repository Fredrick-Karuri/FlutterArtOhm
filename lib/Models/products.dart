// ignore_for_file: unnecessary_new, deprecated_member_use, prefer_collection_literals, unused_element, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:artohm/Models/categoriesmodel.dart';
import 'package:artohm/Models/productsmodel.dart';
import 'package:artohm/Models/stickersmodel.dart';

class Products with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ProductModel> _items = [
    ProductModel(
      id: 'p1',
      productName: "Keyboard",
      imgUrl:
          "https://www.lenovo.com/medias/GY40Y57708-01-500x400.png?context=bWFzdGVyfHJvb3R8MTE0NTYxfGltYWdlL3BuZ3xoMmEvaDg5LzExMDQ1MTIwNTA3OTM0LnBuZ3xlZDFkNmMyOTc3YTY5NzAxOWU0ZmM0NDZkMTAyZDQxNjdjNjUyZGUzNmZlNmRlNTc0MzVhM2I1YjBkOTE4M2I2",
      rating: 4,
      priceInShillings: 2000,
      description: "monster keyboard",
    ),
    ProductModel(
      id: 'p2',
      productName: "Mouse",
      imgUrl:
          "https://cdn.shopify.com/s/files/1/0112/1203/0016/products/ONIKUMA-CW902-Wired-Gaming-Mouse-RGB-Optical-Mause-With-Colorful-Lighting-PC-Laptop-Adjustable-DPI-Mechanical-Mouse_800x.png?v=1644802333",
      rating: 4,
      priceInShillings: 500,
      description: "Gaming Mouse",
    ),
    ProductModel(
      id: 'p3',
      productName: "Wireless Mouse",
      imgUrl:
          "https://www.lenovo.com/medias/GY50X88832-01-500x400.png?context=bWFzdGVyfHJvb3R8NzE5MzB8aW1hZ2UvcG5nfGgzMy9oZGQvMTEwNDUxMjA5NjY2ODYucG5nfDVlZWE3ZDJmNTM2ZWY0MDE3ZDQ0NmIwZDY3MDg2ZmFiZjc2YmE3NmViOWVlM2JjYTM0NmIwNzI1ZGYyOGE5Mzc",
      rating: 4,
      priceInShillings: 600,
      description: "Lenovo 600 Bluetooth Silent mouse",
    ),
    ProductModel(
      id: 'p4',
      productName: "Gaming pad ",
      imgUrl:
          "https://www.xgamertechnologies.com/images/products/thumbnails/tn_Playstation%204%20%7BPS4%7D%20New%20Generation%20Original%20Sony%20Wireless%20Dualshock%204%20Gamepad.webp",
      rating: 4,
      priceInShillings: 2000,
      description: "ps3 Wireless GamePad",
    ),
    ProductModel(
      id: 'p5',
      productName: "Gaming Pad",
      imgUrl: "https://www.gobeys.co.ke/img/products/519/1614246479_1.png",
      rating: 4,
      priceInShillings: 4000,
      description: "PS5 Gaming Pad  ",
    )
  ];

  List<ProductModel> get items {
    //returning a copy of items
    //to prevent editing items class  from anywhere else in code
    //as items represents a location in memory
    return [..._items];
  }

  ProductModel findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<StickersModel> _stickers = [
    StickersModel(
      id: 'p1',
      productName: "Rick and Morty",
      imgUrl: "assets/rick.jpg",
      rating: 4,
      priceInShillings: 1200,
      description: "50 pieces of Rick and morty  ",
    ),
    StickersModel(
      id: 'p1',
      productName: "The Simpsons",
      imgUrl: "assets/simpsons.jpg",
      rating: 4,
      priceInShillings: 1200,
      description: "50 pieces of The Simpsons ",
    ),
    StickersModel(
      id: 'p1',
      productName: "Family Guy",
      imgUrl: "assets/familyguy.jpg",
      rating: 4,
      priceInShillings: 1200,
      description: "50 pieces of Family Guy ",
    ),
    StickersModel(
      id: 'p1',
      productName: "Friends",
      imgUrl: "assets/friends.jpg",
      rating: 4,
      priceInShillings: 1200,
      description: "50 pieces of Friends  ",
    ),
    StickersModel(
      id: 'p1',
      productName: "Trends",
      imgUrl: "assets/trends.jpeg",
      rating: 4,
      priceInShillings: 1200,
      description: "50 pieces of Trends   ",
    ),
  ];
  List<StickersModel> get stickers {
    return [..._stickers];
  }

  List<CategoryModel> _category = [
    CategoryModel(
      categoryName: "Keyboard",
      color1: "0xff8EA2FF",
      color2: "0xff557AC7",
      imgAssetPath: "assets/keyboard.png",
    ),
    CategoryModel(
      categoryName: "Mouse",
      color1: "0xff50F9B4",
      color2: "0xff38CAE9",
      imgAssetPath: "assets/mouse1.png",
    ),
    CategoryModel(
      categoryName: "GamePad",
      color1: "0xffFFB397",
      color2: "0xffF46AA0",
      imgAssetPath: "assets/pad.png",
    ),
    CategoryModel(
      categoryName: "GamePad",
      color1: "0xff8EA2FF",
      color2: "0xff557AC7",
      imgAssetPath: "assets/pad2.png",
    ),
  ];
  List<CategoryModel> get category {
    return [..._category];
  }
}

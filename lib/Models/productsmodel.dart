import 'package:flutter/foundation.dart';

class ProductModel with ChangeNotifier {
   double priceInShillings; // price
   String productName; // name of the product
   int rating; // rating
   String imgUrl; // product image url
   String id;
   String description;
  bool isFavorite;
  ProductModel({
    required this.productName,
    required this.imgUrl,
    required this.priceInShillings,
    required this.description,
    required this.id,
    this.isFavorite = false,
    this.rating = 0,
  });


  void favoriteOrNot(){
  isFavorite =!isFavorite;
  notifyListeners();
}
}



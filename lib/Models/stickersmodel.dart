class StickersModel {
  int priceInShillings; // price
  String productName; // name of the product
  int rating; // rating
  String imgUrl; // product image url
  String id;
  String description;
  bool isFavorite;
  // number of rating
  StickersModel({
    required this.productName ,
    required this.imgUrl ,
    required this.priceInShillings ,
    this.rating =0,
    required this.description,
    required this.id,
     this.isFavorite = false,
  });
}





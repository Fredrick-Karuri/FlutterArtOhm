import 'package:artohm/Models/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatelessWidget {
  // const ProductDetail({ Key? key }) : super(key: key);

  static const routeName = '/productDetail';
  @override
  Widget build(BuildContext context) {
    //extract id
    final productId = ModalRoute.of(context)?.settings.arguments as String;

    final displayProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      //will change
      appBar: AppBar(
        title: Text(displayProduct.productName),
      ),
    );
  }
}

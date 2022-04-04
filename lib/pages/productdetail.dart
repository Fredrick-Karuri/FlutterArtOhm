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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  displayProduct.imgUrl,
                  fit: BoxFit.cover,
                )),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("\Ksh ${displayProduct.priceInShillings}",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    )),
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            Text(
              displayProduct.description,
              textAlign: TextAlign.center,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}

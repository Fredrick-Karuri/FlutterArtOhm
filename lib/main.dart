// ignore_for_file: prefer_const_constructors, deprecated_member_use, camel_case_types, unused_import, prefer_const_constructors_in_immutables

import 'package:artohm/Models/cartmodel.dart';
import 'package:artohm/pages/welcome.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:artohm/Models/products.dart';
import 'package:artohm/pages/productdetail.dart';
void main() {
  runApp(const ArtOhm());
}
class ArtOhm extends StatefulWidget {
  const ArtOhm({Key? key}) : super(key: key);

  @override
  State<ArtOhm> createState() => _ArtOhmState();
}

class _ArtOhmState extends State<ArtOhm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(create: (ctx) => Cart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey.shade300,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return SingleChildScrollView(
                child: Welcome(),
              );
            }),
          ),
        ),
        routes: {ProductDetail.routeName: (ctx) => ProductDetail()},
      ),
    );
  }
}

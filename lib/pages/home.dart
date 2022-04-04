// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:artohm/mywidgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(5.0, 5.0),
                      blurRadius: 5.0,
                      color: Colors.black87.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        "Search ArtOhm",
                        style:
                            TextStyle(color: Color(0xff9B9B9B), fontSize: 17),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                    ),
                  ],
                ),
                
              ),
              
              
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Top categories",
                  style: TextStyle(color: Colors.black87, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 22),
                  child: CategoriesGrid(),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              /// implementing Best Selling tile
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Text(
                      "Best Sellers",
                      style: TextStyle(color: Colors.black87, fontSize: 22),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    //can add text here for precise info
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 220,
                padding: EdgeInsets.only(left: 22),
                // child: GridView.builder(
                child: ProductsGrid(),
              ),

              SizedBox(
                height: 20,
              ),

              // implementing stickers tile
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Stickers",
                      style: TextStyle(color: Colors.black87, fontSize: 22),
                    ),
                    SizedBox(
                      width: 12,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 200,
                padding: EdgeInsets.only(left: 22),
                child: StickersGrid(),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigation(),

    );
  }
}


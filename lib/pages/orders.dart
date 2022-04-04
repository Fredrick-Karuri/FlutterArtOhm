// ignore_for_file: prefer_const_constructors

import 'package:artohm/Models/orders.dart' show Orders;
import 'package:artohm/mywidgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  // const OrdersPage({Key? key}) : super(key: key);
  static const routeName = '/ordersPage';


  @override
  Widget build(BuildContext context) {
    final orderProducts = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderProducts.orders.length,
        itemBuilder: (context, index) => OrderItem(
          orderProducts.orders[index],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      drawer: Sandwich(),


    );
  }
}

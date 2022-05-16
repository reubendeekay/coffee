import 'package:coffee/constants.dart';
import 'package:coffee/models/order_model.dart';
import 'package:coffee/screens/home/home_tile.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: kPrimary,
          child: const Text(
            'OrderDetails',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            color: Colors.white,
            child: HomeTile(
              product: order.product!,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          myText('Order ID', order.id!),
          myText('Quantity', order.quantity!.toString()),
          myText('Size', order.size!.toString()),
          myText('Name', order.name!),
          myText('Address', order.address!),
          myText('Pin Code', order.pinCode!),
          myText('City', order.city!),
          myText('Country', order.country!),
          myText('Mode of Pickup', order.pickup!),
        ],
      ),
    );
  }

  Widget myText(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          value,
        ),
      ]),
    );
  }
}

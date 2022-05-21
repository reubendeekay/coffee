import 'package:coffee/constants.dart';
import 'package:coffee/models/product_model.dart';
import 'package:coffee/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: kPrimary,
          child: const Text(
            'Your Cart',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Expanded(
            child: ListView(
          children: List.generate(
              cart.cart!.products!.length,
              (index) => CartWidget(
                    product: cart.cart!.products![index],
                  )),
        )),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  Text(
                    '\$${cart.cart!.totalPrice!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {},
                  color: kPrimary,
                  child: const Text(
                    'Proceed to Checkout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl!),
      ),
      title: Text(product.name!),
      subtitle: Text('Quantity: ${product.quantity}'),
      trailing:
          Text('\$${(product.price! * product.quantity).toStringAsFixed(2)}'),
    );
  }
}

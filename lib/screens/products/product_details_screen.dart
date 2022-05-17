import 'package:coffee/constants.dart';
import 'package:coffee/models/product_model.dart';
import 'package:coffee/screens/products/delivery_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> options = ['Small', 'Medium', 'Large', 'Xtra Large'];

  int selectedindex = 0;
  int groupIndex = 0;
  int amount = 1;
  double price = 5.5;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topImage(size, context),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name!,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 30,
                ),
                ...List.generate(
                    options.length,
                    (index) => RadioListTile(
                        value: index,
                        groupValue: groupIndex,
                        toggleable: true,
                        contentPadding: EdgeInsets.zero,
                        activeColor: kPrimary,
                        title: Text(options[index]),
                        onChanged: (i) {
                          setState(() {
                            selectedindex = index;
                            groupIndex = index;
                            if (selectedindex > 0) {
                              price = 5.5 + (selectedindex) * 1.5;
                            } else {
                              price = 5.5;
                            }
                          });
                        })),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text('\$${(price * amount).toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 20)),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (amount > 0) {
                          setState(() {
                            amount--;
                          });
                        }
                      },
                      child: const Icon(
                        Icons.remove,
                        color: kPrimary,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text('$amount',
                            style: const TextStyle(fontSize: 20))),
                    InkWell(
                      onTap: () {
                        setState(() {
                          amount++;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: kPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Get.to(() => DeliveryModeScreen(
                            product: widget.product,
                            size: options[selectedindex],
                            amount: amount * price,
                            quantity: amount,
                          ));
                    },
                    color: kPrimary,
                    child: const Text(
                      'PLACE ORDER',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack topImage(Size size, BuildContext context) {
    return Stack(
      children: [
        Container(
          color: kPrimary,
          width: double.infinity,
          height: size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: size.height * 0.26,
                  child: Image.network(
                    widget.product.imageUrl!,
                    height: size.height * 0.26,
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).padding.top,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
              const Text(
                'Details',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(
                width: 40,
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}

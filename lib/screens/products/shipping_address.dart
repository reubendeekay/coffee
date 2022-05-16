import 'package:coffee/constants.dart';
import 'package:coffee/models/my_loader.dart';
import 'package:coffee/models/order_model.dart';
import 'package:coffee/models/product_model.dart';
import 'package:coffee/providers/order_provider.dart';
import 'package:coffee/screens/auth/widgets/my_text_field.dart';
import 'package:coffee/screens/products/success_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen(
      {Key? key,
      required this.pickup,
      required this.product,
      this.size,
      this.quantity,
      this.amount})
      : super(key: key);
  final String pickup;
  final String? size;
  final ProductModel product;
  final double? amount;
  final int? quantity;

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  String? name, address, city, code, country;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: kPrimary,
          child: const Text(
            'Shipping Address',
            style: TextStyle(color: Colors.white),
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          MyTextField(
            hintText: 'Your Name',
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'Address',
            onChanged: (val) {
              setState(() {
                address = val;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  hintText: 'City',
                  onChanged: (val) {
                    setState(() {
                      city = val;
                    });
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyTextField(
                  hintText: 'Pincode',
                  onChanged: (val) {
                    setState(() {
                      code = val;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'Country',
            onChanged: (val) {
              setState(() {
                country = val;
              });
            },
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                final order = OrderModel(
                  name: name,
                  address: address,
                  city: city,
                  pinCode: code,
                  country: country,
                  pickup: widget.pickup,
                  amount: widget.amount,
                  quantity: widget.quantity,
                  product: widget.product,
                  size: widget.size,
                );
                setState(() {
                  isLoading = true;
                });

                await Provider.of<OrderProvider>(context, listen: false)
                    .postOrder(order);
                setState(() {
                  isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: kPrimary,
                    content: Text(
                      'Successful purchase',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
                Get.off(() => const SuccessScreen());
              },
              color: kPrimary,
              child: isLoading
                  ? const MyLoader()
                  : const Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
          )
        ]),
      ),
    );
  }
}

import 'package:coffee/constants.dart';
import 'package:coffee/screens/auth/widgets/my_text_field.dart';
import 'package:coffee/screens/products/success_scree.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

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
            onChanged: (val) {},
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'Address',
            onChanged: (val) {},
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: MyTextField(
                  hintText: 'City',
                  onChanged: (val) {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyTextField(
                  hintText: 'Pincode',
                  onChanged: (val) {},
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          MyTextField(
            hintText: 'Country',
            onChanged: (val) {},
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {
                Get.to(() => const SuccessScreen());
              },
              color: kPrimary,
              child: const Text(
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

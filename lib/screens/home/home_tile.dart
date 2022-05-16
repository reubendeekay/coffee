import 'package:coffee/screens/products/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailsScreen());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Row(children: [
          SizedBox(
            height: 120,
            width: 100,
            child: Image.asset('assets/images/splash.jpg', fit: BoxFit.cover),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Hot Creamy',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Cappicino Latte',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$ 8.99',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

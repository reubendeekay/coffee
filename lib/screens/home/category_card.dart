import 'package:coffee/constants.dart';
import 'package:coffee/screens/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductsScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 35),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 0),
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            SizedBox(height: 30, child: Image.asset('assets/images/cof.png')),
            const SizedBox(width: 20),
            Column(
              children: const [
                Text(
                  'Beverages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '67 Menus',
                  style: TextStyle(
                    color: kPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

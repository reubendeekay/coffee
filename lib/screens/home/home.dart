import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/constants.dart';
import 'package:coffee/models/product_model.dart';
import 'package:coffee/providers/auth_provider.dart';
import 'package:coffee/providers/product_provider.dart';
import 'package:coffee/screens/auth/login.dart';
import 'package:coffee/screens/home/add_product.dart';
import 'package:coffee/screens/home/category_card.dart';
import 'package:coffee/screens/home/home_card.dart';
import 'package:coffee/screens/home/home_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).getUser();
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
                const Spacer(),
                InkWell(
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(() => const SignInScreen());
                    },
                    child: const Icon(Icons.logout)),
              ],
            ),
            Text(
              user!.userName ?? 'William',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 210,
              child: StreamBuilder<QuerySnapshot>(
                  stream: productRef.snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    List<DocumentSnapshot> docs = snapshot.data!.docs;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: docs
                              .map((e) =>
                                  HomeTile(product: ProductModel.fromJson(e)))
                              .toList()),
                    );
                  }),
            ),
            const SizedBox(height: 40),
            const Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                  CategoryCard(),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Featured Beverages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // ...List.generate(5, (index) => const HomeTile())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: kPrimary,
          onPressed: () {
            Get.to(() => const AddProductScreen());
          }),
    );
  }
}

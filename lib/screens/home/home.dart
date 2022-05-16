import 'package:coffee/providers/auth_provider.dart';
import 'package:coffee/screens/auth/login.dart';
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
                    child: Icon(Icons.logout)),
              ],
            ),
            Text(
              user!.userName ?? 'William',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 210,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    HomeCard(),
                    HomeCard(),
                    HomeCard(),
                    HomeCard(),
                  ],
                ),
              ),
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
            ...List.generate(5, (index) => const HomeTile())
          ],
        ),
      ),
    );
  }
}

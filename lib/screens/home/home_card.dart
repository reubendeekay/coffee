import 'package:coffee/constants.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: kPrimary, borderRadius: BorderRadius.circular(20)),
      child: AspectRatio(
        aspectRatio: 1.2,
        child: Column(children: [
          SizedBox(
            height: 100,
            child: Image.asset(
              'assets/images/coffee.png',
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Creamy Ice Coffee',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '\$5.00',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}

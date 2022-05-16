import 'package:coffee/constants.dart';
import 'package:coffee/screens/auth/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please enter the email id below.\nLink wil be sent to your id to reset it',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  hintText: 'Email Id',
                  onChanged: (val) {},
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: kPrimary,
                    child: const Text('SUBMIT',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

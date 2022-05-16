import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({Key? key, this.hintText, this.onChanged})
      : super(key: key);

  final String? hintText;
  final Function(String val)? onChanged;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      onChanged: (val) {
        setState(() {
          widget.onChanged!(val);
        });
      },
    );
  }
}

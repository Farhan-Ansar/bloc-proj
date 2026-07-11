import 'package:flutter/material.dart';


class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email",
        border: OutlineInputBorder(),
      ),
      onChanged: (val) {},
      validator: (val) {
        if (val!.isEmpty) {
          return "Enter Email";
        } else {
          return null;
        }
      },
    );
  }
}

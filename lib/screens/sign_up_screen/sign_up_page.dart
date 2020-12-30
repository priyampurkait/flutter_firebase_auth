import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

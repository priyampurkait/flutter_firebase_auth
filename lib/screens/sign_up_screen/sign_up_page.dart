import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/providers/firebase_auth_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_auth/widgets/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  final String navigator;

  const SignUpPage({Key key, this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _isDisableButton = context.watch<FirebaseAuthState>().isDisableButton;
    return WillPopScope(
      onWillPop: () async {
        return !_isDisableButton;
      },
      child: Scaffold(
        backgroundColor: Colors.yellow[50],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SignUpForm(navigator: navigator),
            ),
          ),
        ),
      ),
    );
  }
}

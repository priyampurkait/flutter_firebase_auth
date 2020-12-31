import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/providers/firebase_auth_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firebase_auth/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  final String navigator;

  const SignInPage({Key key, this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _isDisableButton = context.watch<FirebaseAuthState>().isDisableButton;
    return WillPopScope(
      onWillPop: () async {
        return !_isDisableButton;
      },
      child: Scaffold(
        backgroundColor: Colors.green[50],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SignInForm(navigator: navigator),
            ),
          ),
        ),
      ),
    );
  }
}

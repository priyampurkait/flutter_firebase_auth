import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/providers/firebase_auth_state.dart';
import 'package:flutter_firebase_auth/res/strings.dart';
import 'package:flutter_firebase_auth/screens/sign_in_screen/sign_in_page.dart';
import 'package:flutter_firebase_auth/screens/sign_up_screen/sign_up_page.dart';
import 'package:flutter_firebase_auth/utils/utils.dart';
import 'package:provider/provider.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.welcome,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32.0),
        Text(
          Strings.welcomeSubtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 24.0),
        ),
        const SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            _onGetStartedButtonClick(context);
          },
          child: Text(Strings.getStartedButton.toUpperCase()),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () {
            _onSignInButtonClick(context);
          },
          child: Text(Strings.signinButton.toUpperCase()),
        ),
      ],
    );
  }

  void _onGetStartedButtonClick(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AlertDialog(
        title: Text(
          Strings.account,
          textAlign: TextAlign.center,
        ),
        content: DialogContent(),
      ),
    );
  }

  void _onSignInButtonClick(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignInPage(),
        ),
      );
}

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          Strings.accountInfo,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            _onSignUpButtonClick(context);
          },
          child: Text(Strings.signupButton.toUpperCase()),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () async {
            _onSkipButtonClick(context);
          },
          child: Text(Strings.skipButton.toUpperCase()),
        ),
      ],
    );
  }

  void _onSignUpButtonClick(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignUpPage(),
        ),
      );

  Future<void> _onSkipButtonClick(BuildContext context) async {
    final result = await context.read<FirebaseAuthState>().signInAnonymously();
    if (result == 'no connection!') {
      Utils.snakbar(context: context);
    }
    if (result == null) {
      Navigator.of(context).pop();
    }
  }
}

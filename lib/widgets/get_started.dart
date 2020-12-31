import 'package:flutter/cupertino.dart';
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
    final _isDisableButton = context.watch<FirebaseAuthState>().isDisableButton;
    final _authProgressn = context.watch<FirebaseAuthState>().authProgressn;
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
            _onGetStartedButtonClick(context, _isDisableButton);
          },
          child: Text(Strings.getStartedButton.toUpperCase()),
        ),
        TextButton(
          onPressed: _isDisableButton
              ? null
              : () {
                  _onSignInButtonClick(context);
                },
          child: Text(Strings.signinButton.toUpperCase()),
        ),
        if (_authProgressn) ...[
          const SizedBox(height: 8.0),
          const CupertinoActivityIndicator()
        ],
      ],
    );
  }

  void _onGetStartedButtonClick(BuildContext context, bool isDisableButton) {
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
          builder: (_) => const SignInPage(navigator: 'push'),
        ),
      );
}

class DialogContent extends StatelessWidget {
  const DialogContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authProgressn = context.watch<FirebaseAuthState>().authProgressn;
    final _isDisableButton = context.watch<FirebaseAuthState>().isDisableButton;
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
          onPressed: _isDisableButton
              ? null
              : () {
                  Navigator.of(context).pop();
                  _onSignUpButtonClick(context);
                },
          child: Text(Strings.signupButton.toUpperCase()),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: _isDisableButton
              ? null
              : () async {
                  _onSkipButtonClick(context);
                },
          child: _authProgressn
              ? const CupertinoActivityIndicator()
              : Text(Strings.skipButton.toUpperCase()),
        ),
      ],
    );
  }

  void _onSignUpButtonClick(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignUpPage(navigator: 'push'),
        ),
      );

  Future<void> _onSkipButtonClick(BuildContext context) async {
    final result = await context.read<FirebaseAuthState>().signInAnonymously();
    if (result == 'no connection!') {
      Navigator.of(context).pop();
      Utils.snakbar(context: context);
    }
    if (result == null) {
      Navigator.of(context).pop();
    }
  }
}

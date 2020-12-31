import 'package:flutter_firebase_auth/providers/firebase_auth_state.dart';
import 'package:flutter_firebase_auth/screens/sign_in_screen/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/strings.dart';
import 'package:flutter_firebase_auth/utils/utils.dart';

class SignUpForm extends StatelessWidget {
  final String navigator;

  const SignUpForm({Key key, this.navigator}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _isDisableButton = context.watch<FirebaseAuthState>().isDisableButton;
    final _formKey = GlobalKey<FormState>();
    String _name;
    String _email;
    String _password;
    String _firebaseError;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            Strings.signup,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32.0),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              labelText: Strings.labelTextName,
              hintText: Strings.hintTextName,
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                Utils.nameValidator(value.trim(), _firebaseError),
            onSaved: (value) => _name = value.trim(),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              labelText: Strings.labelTextEmail,
              hintText: Strings.hintTextEmail,
              border: OutlineInputBorder(),
            ),
            validator: (value) => Utils.emailValidator(value, _firebaseError),
            onSaved: (value) => _email = value.trim(),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              labelText: Strings.labelTextPassword,
              hintText: Strings.hintTexPassword,
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                Utils.passwordValidator(value, _firebaseError),
            onSaved: (value) => _password = value.trim(),
            obscureText: true,
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                final form = _formKey.currentState;
                if (form.validate()) {
                  form.save();
                  debugPrint(
                      "name: $_name email: $_email  password: $_password");
                }
              },
              child: Text(
                Strings.signupButton.toUpperCase(),
              ),
            ),
          ),
          TextButton(
            onPressed: _isDisableButton
                ? null
                : () {
                    if (navigator == 'push') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const SignInPage(),
                        ),
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
            child: const Text(Strings.haveAnAccount),
          ),
        ],
      ),
    );
  }
}

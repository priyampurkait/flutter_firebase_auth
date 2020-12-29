import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/strings.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _email;
    String _password;
    // String _firebaseError;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            Strings.login,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              labelText: Strings.labelTextEmail,
              hintText: Strings.hintTextEmail,
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              final bool emailValidation = RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                  .hasMatch(value);

              if (value.isEmpty) {
                return 'Email is required!';
              } else if (!emailValidation) {
                return 'The email is not a valid email address.';
              }
              return null;
            },
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
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Password is required!';
              } else if (value.length < 6) {
                return 'Minimun length of password is 6.';
              }
              return null;
            },
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
                  debugPrint("email: $_email  password: $_password");
                }
              },
              child: Text(
                Strings.signinEmailButton.toUpperCase(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

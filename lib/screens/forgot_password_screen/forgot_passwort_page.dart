import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/strings.dart';
import 'package:flutter_firebase_auth/utils/utils.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _firebaseError;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 64.0),
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    labelText: Strings.labelTextEmail,
                    hintText: Strings.hintTextEmail,
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      Utils.emailValidator(value, _firebaseError),
                  onSaved: (value) => _email = value.trim(),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        debugPrint('email: $_email');
                      }
                    },
                    child: Text(
                      Strings.forgotPasswordButton.toUpperCase(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

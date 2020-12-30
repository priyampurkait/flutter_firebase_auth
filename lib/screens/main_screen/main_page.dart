import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/providers/firebase_auth_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('MainPage');
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await context.read<FirebaseAuthState>().signOut();
          },
          child: Text('Sign out'.toUpperCase()),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/widgets/get_started.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('GetStartedPage');
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GetStarted(),
          ),
        ),
      ),
    );
  }
}

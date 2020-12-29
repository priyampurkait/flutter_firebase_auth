import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/res/strings.dart';
import 'package:flutter_firebase_auth/screens/sign_in_screen/sign_in_page.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('GetStartedPage');
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.appName,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(Strings.getStartedButton.toUpperCase()),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignInPage(),
                  ),
                );
              },
              child: Text(Strings.signinButton.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}

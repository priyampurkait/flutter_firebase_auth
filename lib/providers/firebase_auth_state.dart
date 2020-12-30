import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth/utils/utils.dart';

enum ErrorMessages { passwordDidNotMatch }

class FirebaseAuthState with ChangeNotifier, DiagnosticableTreeMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signInAnonymously() async {
    final bool _checkConnection = await Utils.checkConnection();
    if (_checkConnection) {
      try {
        await _firebaseAuth.signInAnonymously();
        return null;
      } on FirebaseAuthException catch (error) {
        debugPrint('error: ${error.message}');
        return error.message;
      }
    } else {
      return 'no connection!';
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

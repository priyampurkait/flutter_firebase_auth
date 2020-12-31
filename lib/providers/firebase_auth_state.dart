import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_auth/utils/utils.dart';

enum ErrorMessages { passwordDidNotMatch }

class FirebaseAuthState with ChangeNotifier, DiagnosticableTreeMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _authProgress = false;
  bool _disableButton = false;

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
  bool get isDisableButton => _disableButton;
  bool get authProgressn => _authProgress;

  Future<String> signInAnonymously() async {
    _disableButton = true;
    _authProgress = true;
    notifyListeners();
    final bool _checkConnection = await Utils.checkConnection();
    if (_checkConnection) {
      try {
        await _firebaseAuth.signInAnonymously();
        _disableButton = false;
        _authProgress = false;
        notifyListeners();
        return null;
      } on FirebaseAuthException catch (error) {
        debugPrint('error: ${error.message}');
        _disableButton = false;
        _authProgress = false;
        notifyListeners();
        return error.message;
      }
    } else {
      _disableButton = false;
      _authProgress = false;
      notifyListeners();
      return 'no connection!';
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

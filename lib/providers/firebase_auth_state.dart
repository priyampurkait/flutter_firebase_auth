import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthState with ChangeNotifier, DiagnosticableTreeMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();
}

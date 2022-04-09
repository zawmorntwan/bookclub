import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser extends ChangeNotifier {
  late String _uid;
  late String _email;

  String get getUid => _uid;
  String get getEmail => _email;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signupUser(String email, String password) async {
    bool retVal = false;

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (_authResult.user != null) {
        retVal = true;
      }
    } catch (exception) {
      print(exception);
    }

    return retVal;
  }

  Future<bool> loginUser(String email, String password) async {
    bool retVal = false;

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (_authResult.user != null) {
        _uid = _authResult.user!.uid;
        _email = _authResult.user!.email!;
        retVal = true;
      }
    } catch (exception) {
      print(exception);
    }

    return retVal;
  }
}

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Map<String, String?>?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null; // sucesso
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return {'email': 'This email is not registered.'};
      } else if (e.code == 'wrong-password') {
        return {'password': 'Incorrect password.'};
      } else if (e.code == 'invalid-email') {
        return {'email': 'Invalid email format.'};
      } else {
        return {'general': 'Login failed. Try again later.'};
      }
    } catch (_) {
      return {'general': 'Unexpected error occurred.'};
    }
  }
}

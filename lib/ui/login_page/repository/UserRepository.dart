import 'package:google_sign_in/google_sign_in.dart';

class UserRepository {
  final GoogleSignIn _googleSignIn;

  UserRepository(
      {GoogleSignIn googleSignin})
      : _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<void> signInWithGoogle() async {

  }

  Future<void> signInWithCredentials(String email, String password) {

  }

  Future<void> signUp({String email, String password}) async {

  }

  Future<void> signOut() async {
  }

  Future<bool> isSignedIn() async {

  }

  Future<String> getUserEmail() async {

  }

  Future<String> getUserUid() async {

  }
}

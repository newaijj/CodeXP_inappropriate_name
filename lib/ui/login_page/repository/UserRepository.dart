import 'dart:io';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:codexp_inapporpriate_name/repository/authentication_bloc/authentication_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final GoogleSignIn _googleSignIn;
  final userPool = new CognitoUserPool(
    'ap-southeast-1_8HmeI0wn8',
    '2t30npjddcrm8ilfoj1dji9qih',
  );

  UserRepository({GoogleSignIn googleSignin})
      : _googleSignIn = googleSignin ?? GoogleSignIn();

  Future<void> signInWithGoogle() async {}

  Future<void> signInWithCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final userPool = new CognitoUserPool(
      'ap-southeast-1_8HmeI0wn8',
      '2t30npjddcrm8ilfoj1dji9qih',
    );
    final cognitoUser = new CognitoUser(email, userPool);
    final authDetails = new AuthenticationDetails(
      username: email,
      password: password,
    );

    CognitoUserSession session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
    } on CognitoUserNewPasswordRequiredException catch (e) {
      print(e);
      // handle New Password challenge
    } on CognitoUserMfaRequiredException catch (e) {
      print(e);
      // handle SMS_MFA challenge
    } on CognitoUserSelectMfaTypeException catch (e) {
      print(e);
      // handle SELECT_MFA_TYPE challenge
    } on CognitoUserMfaSetupException catch (e) {
      print(e);
      // handle MFA_SETUP challenge
    } on CognitoUserTotpRequiredException catch (e) {
      print(e);
      // handle SOFTWARE_TOKEN_MFA challenge
    } on CognitoUserCustomChallengeException catch (e) {
      print(e);
      // handle CUSTOM_CHALLENGE challenge
    } on CognitoUserConfirmationNecessaryException catch (e) {
      print(e);
      // handle User Confirmation Necessary
    } on CognitoClientException catch (e) {
      print(e);
      // handle Wrong Username and Password and Cognito Client
    } catch (e) {
      print(e);
    }
    print(session.getAccessToken().getJwtToken());
    prefs.setString("email", email);
  }

  Future<void> signUp({String email, String password}) async {
    print("sign up here");
    var data;
    try {
      data = await userPool.signUp(
        email,
        password,
      );
    } catch (e) {
      print(e);
    }
  }

  Future<bool> verifyAccount({String email, String verificationCode}) async {
    final cognitoUser = new CognitoUser(email, userPool);

    bool registrationConfirmed = false;
    try {
      registrationConfirmed =
          await cognitoUser.confirmRegistration(verificationCode);
    } catch (e) {
      print(e);
    }
    return registrationConfirmed;
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);

    final cognitoUser = new CognitoUser(prefs.getString("email"), userPool);
    await cognitoUser.signOut();
  }

  Future<bool> isSignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      if (prefs.getString("email") == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  Future<String> getUserUid() async {}
}

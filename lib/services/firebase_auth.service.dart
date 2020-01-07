import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nkap_earn/model/user.model.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FacebookLogin _facebookLogin = FacebookLogin();

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  User _userFromFirebase(FirebaseUser firebaseUser) {
    return firebaseUser == null
        ? null
        : User(
            displayName: firebaseUser.displayName,
            email: firebaseUser.email,
            uid: firebaseUser.uid,
            photoUrl: firebaseUser.photoUrl,
          );
  }

  Stream<User> get onAuthStateChanged {
    return firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  /*Future<User> signInAnonymously() async {
      final authResult = await firebaseAuth.signInAnonymously();
      return _userFromFirebase(authResult.user);
  }*/
  
  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUsers = await _googleSignIn.signIn();

    if (googleUsers != null) {
      final GoogleSignInAuthentication googleAuth = await googleUsers.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken
        );
        final authResult = await firebaseAuth.signInWithCredential(credential);
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: "Missing Google Auth Token"
        );
      }
    } else {
      throw PlatformException(
        code: "ERROR_ABORTED_BY_USER", 
        message: "Google Sign in was aborted by user"
      );
    }
  }

  Future<User> signInWithFacebook() async {
    final FacebookLoginResult result = await _facebookLogin.logIn(
      <String>['public_profile']
    );

    if(result.accessToken != null) {
      final authResult = await firebaseAuth.signInWithCredential(
        FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token
        )
      );
      return _userFromFirebase(authResult.user);
    }
    else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: "Sign in aborted by user"
      );
    }

  }

  Future<User> currentUser() async {
    return _userFromFirebase(await firebaseAuth.currentUser());
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    return firebaseAuth.signOut();
  }
}

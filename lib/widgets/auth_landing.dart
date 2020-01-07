import 'package:nkap_earn/services/firebase_auth.service.dart';
import 'package:nkap_earn/model/user.model.dart';
import 'package:flutter/material.dart';
import 'package:nkap_earn/screens/login.screen.dart';
import 'package:nkap_earn/screens/profile.screen.dart';
import 'package:nkap_earn/widgets/loading.dart';
import 'package:provider/provider.dart';

class AuthLanding extends StatelessWidget {
  const AuthLanding({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService firebaseAuth =
        Provider.of<FirebaseAuthService>(context);
    return StreamBuilder<User>(
      stream: firebaseAuth.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return LoginScreen();
          } else {
            return Provider<User>.value(
              value: user,
              key: Key(user.uid),
              child: Profile(),
            );
          }
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Loading(),
          ),
        );
      },
    );
  }
}

/*
    StreamBuilder<FirebaseUser>(        
      stream: firebaseAuth.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
           if (snapshot.connectionState == ConnectionState.active) {
              FirebaseUser user = snapshot.data;
              if (user == null) {
                return LoginScreen();
              } else {
                return Profile();
              }
            }
          } else if (snapshot.hasError) {
           return Text(snapshot.error.toString());
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Image.asset("images/loading.gif"),
            ),
          );
       },
    );
*/

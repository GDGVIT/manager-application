import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:manager_app/events_list.dart';

class MainScreen extends StatelessWidget {
  final GoogleSignInAccount googleUser;
  final FirebaseUser firebaseUser;
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  const MainScreen(
      {Key key,
        @required this.googleUser,
        @required this.firebaseUser,
        @required this.auth,
        @required this.googleSignIn})
      : assert(googleUser != null),
        assert(firebaseUser != null),
        assert(auth != null),
        assert(googleSignIn != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventsList(
                  googleUser: googleUser,
                  auth: auth,
                  googleSignIn: googleSignIn,
                )),
          );
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Offstage(
                  offstage: googleUser.photoUrl == null,
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(googleUser.photoUrl)),
                ),
                SizedBox(height: 8.0),
                Text(googleUser.displayName, style: theme.textTheme.title),
                Text(googleUser.email),
              ],
            ),
          ),
        ));
  }
}

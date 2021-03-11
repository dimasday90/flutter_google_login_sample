import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoogleLogin(),
    );
  }
}

class GoogleLogin extends StatefulWidget {
  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  Future login() async {
    final googleSignIn = GoogleSignIn(
      scopes: <String>[
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final user = await googleSignIn.signIn();
    if (user == null) {
      print('error');
      return;
    } else {
      final googleAuth = await user.authentication;

      print('token from authentication');
      print(googleAuth.idToken);
      print('access token');
      print(googleAuth.accessToken);
      print('server auth code');
      print(googleAuth.serverAuthCode);

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      print('id token from credential');
      print(credential.idToken);
      print(credential.token);
      print(credential.accessToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      IdTokenResult idToken =
          await FirebaseAuth.instance.currentUser.getIdTokenResult(true);
      print('idToken to be verified');
      print(idToken.signInProvider);
      print(idToken.token);
      // print(currentUser.displayName);
      // print(currentUser.email);
      // print(currentUser.emailVerified);
      // print(currentUser.phoneNumber);
      // print(currentUser.photoURL);
      // print(currentUser.refreshToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton.icon(
          onPressed: login,
          icon: FaIcon(FontAwesomeIcons.google),
          label: Text('Sign in with google'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(StadiumBorder()),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

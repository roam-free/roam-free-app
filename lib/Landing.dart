import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/Register.dart';
import 'UserRegistrationAndLogin.dart';

class LandingPage extends StatefulWidget {
  static const String id = 'landing';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roam Free')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: EmailPasswordForm(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: 'Don\'t have an account? '),
                  TextSpan(
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      text: 'Sign Up Now',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.pushNamed(context, RegisterPage.id);
                          print('Sign Up Now clicked');
                        })
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: InkWell(
              child: Text('Forgot Password?'),
              onTap: () {
                //TODO link to forgot password
                print('Forgot Password? clicked');
              },
            ),
          ),
        ],
      ),
    );
  }
}

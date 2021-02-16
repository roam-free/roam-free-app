import 'package:flutter/material.dart';
import 'UserRegistrationAndLogin.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Roam Free')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: RegisterEmailSection(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: InkWell(
              child: Text('Back to login'),
              onTap: () {
                Navigator.pop(context);
                print('Forgot Password? clicked');
              },
            ),
          ),
        ],
      ),
    );
  }
}

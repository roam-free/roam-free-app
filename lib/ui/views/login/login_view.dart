import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:roam_free/ui/shared/ui_helpers.dart';
import 'package:roam_free/ui/widgets/busy_button.dart';
import 'package:roam_free/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/login/login_view_model.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Log In',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceLarge,
              // TODO: Add additional user data here to save (episode 2)
              InputField(
                placeholder: 'Email',
                controller: model.emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: model.passwordController,
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Login',
                    busy: model.isBusy,
                    onPressed: () {
                      model.login(
                        email: model.emailController.text,
                        password: model.passwordController.text,
                      );
                    },
                  )
                ],
              ),
              RichText(
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
                          model.signupNow();
                          print('Sign Up Now clicked');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

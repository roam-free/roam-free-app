import 'package:flutter/material.dart';
import 'package:roam_free/ui/shared/ui_helpers.dart';
import 'package:roam_free/ui/widgets/busy_button.dart';
import 'package:roam_free/ui/widgets/input_field.dart';
import 'package:stacked/stacked.dart';
import 'package:roam_free/ui/views/signup/signup_view_model.dart';

import '../../shared/ui_helpers.dart';

class SignupView extends StatelessWidget {
  static const String id = 'signup_view';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 38,
                ),
              ),
              verticalSpaceLarge,
              InputField(
                placeholder: 'First Name',
                controller: firstNameController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Last Name',
                controller: lastNameController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Email',
                controller: emailController,
              ),
              verticalSpaceSmall,
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController,
                additionalNote: 'Password has to be a minimum of 6 characters.',
              ),
              verticalSpaceMedium,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BusyButton(
                    title: 'Sign Up',
                    busy: model.isBusy,
                    onPressed: () {
                      model.signUp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

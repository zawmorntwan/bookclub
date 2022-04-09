import 'package:bookclub/screens/login/localwidgets/login_form.dart';
import 'package:bookclub/screens/signup/localwidgets/signup_form.dart';
import 'package:flutter/material.dart';

class OurSignup extends StatelessWidget {
  static String route = 'SignupRoute';
  const OurSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(
                  height: 50,
                ),
                OurSignupForm()
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/screens/signup/signup.dart';
import 'package:bookclub/utils/our_theme.dart';
import 'package:bookclub/widgets/our_container.dart';
import 'package:flutter/material.dart';

class OurSignupForm extends StatefulWidget {
  OurSignupForm({Key? key}) : super(key: key);

  @override
  State<OurSignupForm> createState() => _OurSignupFormState();
}

class _OurSignupFormState extends State<OurSignupForm> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 8,
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline,
                color: OurTheme().lightGrey,
              ),
              hintText: 'Name',
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.alternate_email,
                color: OurTheme().lightGrey,
              ),
              hintText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                color: OurTheme().lightGrey,
              ),
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: isPasswordVisible
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                        size: 16,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                onPressed: () => setState(
                  () => isPasswordVisible = !isPasswordVisible,
                ),
              ),
            ),
            obscureText: isPasswordVisible,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_open,
                color: OurTheme().lightGrey,
              ),
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: isConfirmPasswordVisible
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.grey,
                        size: 16,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                onPressed: () => setState(
                  () => isConfirmPasswordVisible = !isConfirmPasswordVisible,
                ),
              ),
            ),
            obscureText: isConfirmPasswordVisible,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, OurLogin.route);
            },
            child: const Text("Back to login"),
          )
        ],
      ),
    );
  }
}

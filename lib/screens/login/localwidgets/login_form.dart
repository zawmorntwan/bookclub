import 'package:bookclub/screens/signup/signup.dart';
import 'package:bookclub/utils/our_theme.dart';
import 'package:bookclub/widgets/our_container.dart';
import 'package:flutter/material.dart';

class OurLoginForm extends StatefulWidget {
  OurLoginForm({Key? key}) : super(key: key);

  @override
  State<OurLoginForm> createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  bool isPasswordVisible = true;

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
              'Log In',
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
          ElevatedButton(
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 100,
              ),
              child: Text(
                'Log In',
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
              Navigator.pushNamed(context, OurSignup.route);
            },
            child: const Text("Don't have an account? Sign up here"),
          )
        ],
      ),
    );
  }
}

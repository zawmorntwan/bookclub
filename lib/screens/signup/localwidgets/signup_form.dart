import 'package:bookclub/screens/login/login.dart';
import 'package:bookclub/states/current_user.dart';
import 'package:bookclub/utils/our_theme.dart';
import 'package:bookclub/widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurSignupForm extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OurSignupForm({Key? key}) : super(key: key);

  @override
  State<OurSignupForm> createState() => _OurSignupFormState();
}

class _OurSignupFormState extends State<OurSignupForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of(context, listen: false);

    try {
      if (await _currentUser.signupUser(email, password)) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

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
            controller: _nameController,
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
            controller: _emailController,
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
            controller: _passwordController,
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
            controller: _confirmPasswordController,
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
            onPressed: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(
                    _emailController.text, _passwordController.text, context);
              } else {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Passwords do not match'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
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

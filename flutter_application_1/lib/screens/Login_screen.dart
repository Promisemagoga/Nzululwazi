import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';
import 'package:flutter_application_1/screens/Dashboard.dart';
import 'package:flutter_application_1/screens/SignUp_Screen.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/widgets/text_field_input.dart';

import '../../responsive/mobile_screen_layout.dart';
import '../../responsive/responsive_layout_screen.dart';
import '../../responsive/web_screen_layout.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == "success") {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (Context) => const Dashboard()));
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const SignUp()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 64),
          Flexible(
            child: Container(
              child: Column(
                children: [
                  Image.asset(
                    'Assets/images/IMG-20220730-WA0002.jpg',
                  ),
                ],
              ),
            ),
            flex: 2,
          ),

          const SizedBox(height: 64),
          //text field for email
          TextFieldInput(
            hintText: 'Enter your email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),
          const SizedBox(
            height: 24,
          ),
          //text field for password
          TextFieldInput(
            hintText: 'Enter your Password',
            textInputType: TextInputType.text,
            textEditingController: _passwordController,
            isPass: true,
          ),
          const SizedBox(
            height: 24,
          ),
          //button login
          InkWell(
            onTap: loginUser,
            child: Container(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : const Text('Log in'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                color: blueColor,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          //transitioning to signup
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: const Text("Don't have an account?"),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
            GestureDetector(
              onTap: navigateToSignUp,
              child: Container(
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
              ),
            )
          ])
        ],
      ),
    )));
  }
}

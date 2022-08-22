import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';
import 'package:flutter_application_1/responsive/responsive_layout_screen.dart';
import 'package:flutter_application_1/screens/Login_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_application_1/widgets/text_field_input.dart';

import 'package:image_picker/image_picker.dart';

import '../../responsive/mobile_screen_layout.dart';
import '../../responsive/web_screen_layout.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: WebScreenLayout(),
              )),
        ),
      );
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const LoginScreen()),
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
          Flexible(
            child: Container(
              height: 150,
              width: 200,
              child: Image.asset(
                'Assets/IMG-20220722-WA0065.jpg',
            
              ),
            ),
            flex: 2,
          ),
          const SizedBox(height: 35),
          // circular widget to accept and show our  selected file
          Stack(children: [
            _image != null
                ? CircleAvatar(
                    radius: 55,
                    backgroundImage: MemoryImage(_image!),
                  )
                : const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://www.bing.com/th?id=OIP.0rCkjRj7GfjjFD2tvQriRAHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2s"),
                  ),
            Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo)))
          ]),
          const SizedBox(
            height: 24,
          ),
          //text  field input for user name
          TextFieldInput(
            hintText: 'Enter your username',
            textInputType: TextInputType.text,
            textEditingController: _usernameController,
          ),
          const SizedBox(
            height: 20,
          ),
          //text field for email
          TextFieldInput(
            hintText: 'Enter your email',
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          //text field for password
          TextFieldInput(
            hintText: 'Enter your Password',
            textInputType: TextInputType.text,
            textEditingController: _passwordController,
            isPass: true,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFieldInput(
            hintText: 'Enter your bio',
            textInputType: TextInputType.text,
            textEditingController: _bioController,
          ),
          const SizedBox(
            height: 20,
          ),
          //button login
          InkWell(
            onTap: signUpUser,
            child: Container(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : const Text('Sign Up'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
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
              onTap: navigateToLogin,
              child: Container(
                child: const Text(
                  "Login",
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

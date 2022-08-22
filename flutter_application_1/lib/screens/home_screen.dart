import 'package:flutter/material.dart';

//this is just the demo,not part of the application

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
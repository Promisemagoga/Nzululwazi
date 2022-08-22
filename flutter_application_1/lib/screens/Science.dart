import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hypertext extends StatefulWidget {
  const Hypertext({Key? key}) : super(key: key);

  @override
  State<Hypertext> createState() => _HypertextState();
}

class _HypertextState extends State<Hypertext> {
  var _hover = false;
  late final _recogniser = TapGestureRecognizer()..onTap = _onTap;

  void _onTap() {
    launch('https://lively-forest-0bf9a6a0f.1.azurestaticapps.net/');
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 35,color: Colors.white),
          child: SelectableText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'This is a science ',
                ),
                TextSpan(
                  text: 'Simulation',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: _hover ? Colors.blue : null,
                  ),
                  mouseCursor: SystemMouseCursors.click,
                  onEnter: (event) => setState(() => _hover = true),
                  onExit: (event) => setState(() => _hover = false),
                  recognizer: _recogniser
                ),
                TextSpan(
                  text:'!',
                ),
              ],
            ),
            ),
        ),
      ),
    );
  }
}
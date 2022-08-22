import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Engineering.dart';
import 'package:flutter_application_1/screens/Mathematics.dart';
import 'package:flutter_application_1/screens/Science.dart';
import 'package:flutter_application_1/screens/Technology.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                    'Assets/images/IMG-20220730-WA0003.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 70),
                child: const Text(
                  'Welcome\nBack',
                  style: const TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                  child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                      Card(
                      elevation: 8,
                      shadowColor: Colors.blue,
                      margin: const EdgeInsets.all(25),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.blue, width: 1)),
                      child: ListTile(
                          leading: const Icon(Icons.science_outlined),
                          title: Text(
                            'Science',
                            style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'Root your knowledge!',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          trailing: IconButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Hypertext()))
                            },
                            icon: const Icon(Icons.forward),
                            color: Colors.purple,
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(top: 0.5)),
                      Card(
                      elevation: 8,
                      shadowColor: Colors.blue,
                      margin: const EdgeInsets.all(25),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.blue, width: 1)),
                      child: ListTile(
                          leading: const Icon(Icons.computer_outlined),
                          title: Text(
                            'Technology',
                            style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'Make your WhatsApp come alive!',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          trailing: IconButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Technology()))
                            },
                            icon: const Icon(Icons.forward),
                            color: Colors.purple,
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(top: 0.5)),
                    Card(
                      elevation: 8,
                      shadowColor: Colors.blue,
                      margin: const EdgeInsets.all(25),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.white, width: 1)),
                      child: ListTile(
                          leading: const Icon(Icons.engineering_outlined),
                          title: Text(
                            'Engineering',
                            style: TextStyle(
                                color: Colors.blue[800],
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text(
                            'Root your knowledge!',
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          ),
                          trailing: IconButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Engineering()))
                            },
                            icon: const Icon(Icons.forward),
                            color: Colors.purple,
                          )),
                    ),
                    Padding(padding: EdgeInsets.only(top: 0.5)),
                    Card(
                      elevation: 8,
                      shadowColor: Colors.blue,
                      margin: const EdgeInsets.all(25),
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.blue, width: 1)),
                      child: ListTile(
                        leading: const Icon(Icons.calculate_outlined),
                        title: Text(
                          'Mathematics',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text(
                          'Root your knowledge!',
                          style: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.italic),
                        ),
                        trailing: IconButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Mathematics()))
                          },
                          icon: const Icon(Icons.forward),
                          color: Colors.purple,
                        ),
                      ),
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}

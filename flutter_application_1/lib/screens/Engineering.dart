import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Dashboard.dart';

class Engineering extends StatelessWidget {
  const Engineering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
                            onPressed: () => {
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Dashboard()))
                            }, 
            ),
          )        
        ],
      )
      
      
    );
    
  }
}
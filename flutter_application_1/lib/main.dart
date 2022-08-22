import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
import 'package:flutter_application_1/responsive/responsive_layout_screen.dart';
import 'package:flutter_application_1/responsive/web_screen_layout.dart';
import 'package:flutter_application_1/screens/Dashboard.dart';
import 'package:flutter_application_1/screens/Login_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
       apiKey: "AIzaSyCsMD9jsLdqWC1ixmflaemftlBJqx8f-nk",
  authDomain: "nzululwazi-5a2aa.firebaseapp.com",
  projectId: "nzululwazi-5a2aa",
  storageBucket: "nzululwazi-5a2aa.appspot.com",
  messagingSenderId: "872460850120",
  appId: "1:872460850120:web:77f3afddd314311754e6fd",
  measurementId: "G-TKC4ESZHTD"
     ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nzululwazi',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
            // stream: FirebaseAuth.instance.idTokenChanges(),
            //stream: FirebaseAuth.instance.userChanges(),
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const Dashboard();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                );
              }

              return const LoginScreen();
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_easy/screens/phone_screen.dart';
import 'package:live_easy/screens/screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'screens/select_profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // systemNavigationBarColor: Color(0xff2E3B62), // navigation bar color
    statusBarColor: Color(0xff2E3B62),
  ));
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        fontFamily: "Montserrat",
        primarySwatch: Colors.blue,
      ),
      home: const SelectLanguageScreen(),
      routes: {
        PhoneScreen.routeName: (ctx) => const PhoneScreen(),
        SelectProfileScreen.routeName: (ctx) => const SelectProfileScreen(),
        VerifyPhoneScreen.routeName: (ctx) => const VerifyPhoneScreen(),
      },
    );
  }
}

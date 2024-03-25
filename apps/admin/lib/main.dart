import 'package:admin/features/auth/screens/Login-Screens/first_login_screen.dart';
import 'package:admin/features/auth/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Future<String?> jwt() async {
      var sp = await SharedPreferences.getInstance();
      String? val = sp.getString('USER_JWT');
      return val;
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF37003C),
        buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF730C51)),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                color: Color(0xFFE0DADD),
                fontSize: 28,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w800,
                height: 0),
            displayMedium: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            displaySmall: TextStyle(
                color: Color(0xFFBAAFBB),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0),
            bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
            bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
            bodySmall: TextStyle(
              fontSize: 10,
              color: Colors.black,
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: jwt(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return const FirstLoginScreen();
            } else {
              return const SignUpPage();
            }
          }),
    );
  }
}

import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final Size pageSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF111114),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: pageSize.height - 80),
          child: Container(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                //aplying gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF111114),
                  Color(0xFF161A3A),
                  Color(0xFF171D45),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: pageSize.height / 4),
                const Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Color(0xFFE0DADD),
                    fontSize: 28,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),

                const SizedBox(
                  height: 18,
                ),

                const SizedBox(height: 20),
                TextfieldLogin(
                  initailValue: '',
                  onChange: (val) {},
                  textInputType: TextInputType.emailAddress,
                  aboveText: 'E-mail',
                  hintText: 'Enter your E-mail',
                ), //TextField for email
                TextfieldLogin(
                  initailValue: '',
                  textInputType: TextInputType.visiblePassword,
                  aboveText: 'Password',
                  onChange: (val) {},
                  hintText: 'Enter your password',
                  obscureText: false,
                  isPassword: true,
                ), //TextField for password
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 320,
                  child: TextButton(
                    //Register button
                    onPressed: () {
                      // _onButtonPressed();
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        backgroundColor: const Color.fromRGBO(225, 25, 109, 1)),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                    children: [
                      const Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      GestureDetector(
                        //making signup text clickabe
                        onTap: () {},
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: Color(0xFFC01A60),
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: pageSize.height / 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

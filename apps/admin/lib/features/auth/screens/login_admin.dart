import 'package:admin/features/auth/repository/auth_repository.dart';
import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:admin/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageAdmin extends ConsumerWidget {
  const LoginPageAdmin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Player player = Player(
      'pateldivyakumar820@gmail.com',
      'firstName',
      'lastName',
      'password',
      'role',
      'sport',
      'branch',
      0,
      'contactNo',
      [],
    );
    return Scaffold(
      body: Expanded(
        child: Container(
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
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40.0, 0, 40, 0.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Create your Account',
                    style: TextStyle(
                      color: Color(0xFFE0DADD),
                      fontSize: 28,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                  const Text(
                    'Fill in the details to create your account',
                    style: TextStyle(
                      color: Color(0xFFBAAFBB),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                        image: AssetImage(
                            'assets/images/sports_illustration_gCSB.png')),
                  ),
                  const SizedBox(height: 20),
                  TextfieldLogin(
                    onChange: (value) {},
                    aboveText: 'Name',
                    hintText: 'Enter your Name',
                    textInputType: TextInputType.name,
                  ), //TextField for name
                  TextfieldLogin(
                    aboveText: 'E-mail',
                    hintText: 'Enter your E-mail',
                    textInputType: TextInputType.emailAddress,
                    onChange: (value) {},
                  ), //TextField for email
                  TextfieldLogin(
                    aboveText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    textInputType: TextInputType.phone,
                    onChange: (value) {},
                  ), //TextField for phone number
                  TextfieldLogin(
                    aboveText: 'Password',
                    hintText: 'Enter your password',
                    textInputType: TextInputType.visiblePassword,
                    onChange: (value) {},
                  ), //TextField for password
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 320,
                    child: TextButton(
                      onPressed: () {
                        ref.read(AuthRepositoryProvider).clickRegister(
                              player,
                              context,
                            );
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                          ),
                          backgroundColor:
                              const Color.fromRGBO(225, 25, 109, 1)),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Row(
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            // builder: (context) => const SignUpPage(),
                            //   ),
                            // );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFFC01A60),
                              fontSize: 15,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
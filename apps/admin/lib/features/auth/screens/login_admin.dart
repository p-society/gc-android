import 'package:admin/constants/scaffold_messenger.dart';
import 'package:admin/features/auth/repository/player_provider.dart';
import 'package:admin/features/auth/screens/signUp_page.dart';
import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageAdmin extends ConsumerWidget {
  const LoginPageAdmin({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var player = ref.watch(playerProvider);
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
                    aboveText: 'Year',
                    hintText: 'Enter your Year',
                    textInputType: TextInputType.number,
                  ), //TextField for name
                  TextfieldLogin(
                    aboveText: 'Contact Number',
                    hintText: 'Enter your Contact number',
                    textInputType: TextInputType.phone,
                    onChange: (value) {},
                  ), //TextField for phone number
                  TextfieldLogin(
                    aboveText: 'Password',
                    hintText: 'Enter your password',
                    textInputType: TextInputType.visiblePassword,
                    isPassword: true,
                    onChange: (value) {
                      player = player.copyWith(password: value.toString());
                      ref
                          .watch(playerProvider.notifier)
                          .update((state) => player);
                    },
                  ), //TextField for password
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 320,
                    child: TextButton(
                      onPressed: () {
                        MyScaffoldMessage().showScaffoldMessenge(
                            context: context, content: player.password);
                        // ref
                        //     .read(AuthRepositoryProvider)
                        //     .clickRegister(
                        //       player,
                        //       context,
                        //     )
                        //     .then((value) {
                        //   Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //       builder: (context) => const OtpPage(),
                        //     ),
                        //   );
                        // }).catchError((error) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text(
                        //           'Registration failed. Please try again later.'),
                        //     ),
                        //   );
                        // });
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
                      mainAxisAlignment: MainAxisAlignment.end,
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const SignUpPage(),
                              ),
                            );
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            '< < Previous',
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

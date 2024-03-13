import 'package:admin/features/auth/screens/login_admin.dart';
import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondLoginScreen extends ConsumerWidget {
  const SecondLoginScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              //aplying gradient
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF171D45),
                Color(0xFF161A3A),
                Color(0xFF111114),
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
                        'assets/images/sports_illustration_gCSB.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextfieldLogin(
                    onChange: (value) {},
                    aboveText: 'Branch Name',
                    hintText: 'Enter your Branch Name',
                    textInputType: TextInputType.name,
                  ),
                  TextfieldLogin(
                    aboveText: 'Sport',
                    hintText: 'Enter your Sport',
                    textInputType: TextInputType.emailAddress,
                    onChange: (value) {},
                  ), //TextField for Sport
                  TextfieldLogin(
                    onChange: (value) {},
                    aboveText: 'Role',
                    hintText: 'Enter your Role Name',
                    textInputType: TextInputType.name,
                  ), //TextField for Role
                  const SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginPageAdmin(),
                              ),
                            );
                          },
                          child: const Text(
                            'Next > >',
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

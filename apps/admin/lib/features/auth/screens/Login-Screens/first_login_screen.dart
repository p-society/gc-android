import 'package:admin/constants/scaffold_messenger.dart';
import 'package:admin/features/auth/repository/player_provider.dart';
import 'package:admin/features/auth/screens/Login-Screens/second_login_screen.dart';
import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstLoginScreen extends ConsumerStatefulWidget {
  const FirstLoginScreen({super.key});

  @override
  ConsumerState<FirstLoginScreen> createState() => _FirstLoginScreenState();
}

class _FirstLoginScreenState extends ConsumerState<FirstLoginScreen> {
  bool isAllDetailFilled = false;
  int count = 0;
  void checkAllFields() {
    var player = ref.read(playerProvider);
    print('values are : ${player.firstName} ${player.lastName}');
    if (player.firstName.isNotEmpty &&
        player.lastName.trim().isNotEmpty &&
        player.email.trim().isNotEmpty) {
      setState(() {
        isAllDetailFilled = true;
      });
    } else {
      setState(() {
        isAllDetailFilled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    onChange: (value) {
                      player = player.copyWith(firstName: value.trim());
                      ref
                          .read(playerProvider.notifier)
                          .update((state) => player);
                      if (value.trim().isNotEmpty) {
                        checkAllFields();
                      } else {
                        setState(() {
                          isAllDetailFilled = false;
                        });
                      }
                    },
                    aboveText: 'First Name',
                    hintText: 'Enter your First Name',
                    textInputType: TextInputType.name,
                  ),
                  TextfieldLogin(
                    onChange: (value) {
                      player = player.copyWith(lastName: value.trim());
                      ref
                          .read(playerProvider.notifier)
                          .update((state) => player);
                      if (value.trim().isNotEmpty) {
                        checkAllFields();
                      } else {
                        setState(() {
                          isAllDetailFilled = false;
                        });
                      }
                    },
                    aboveText: 'Last Name',
                    hintText: 'Enter your Last Name',
                    textInputType: TextInputType.name,
                  ), //TextField for name
                  TextfieldLogin(
                    aboveText: 'E-mail',
                    hintText: 'Enter your E-mail',
                    textInputType: TextInputType.emailAddress,
                    onChange: (value) {
                      player = player.copyWith(email: value.trim());
                      ref
                          .read(playerProvider.notifier)
                          .update((state) => player);
                      if (value.trim().isNotEmpty) {
                        checkAllFields();
                      } else {
                        setState(() {
                          isAllDetailFilled = false;
                        });
                      }
                    },
                  ), //TextField for email
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            if (isAllDetailFilled) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SecondLoginScreen(),
                                ),
                              );
                            } else {
                              MyScaffoldMessage().showScaffoldMessenge(
                                  context: context,
                                  content: 'Enter All the Details');
                            }
                          },
                          child: Text(
                            'Next > >',
                            style: TextStyle(
                              color: isAllDetailFilled
                                  ? Color(0xFFC01A60)
                                  : Colors.grey,
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

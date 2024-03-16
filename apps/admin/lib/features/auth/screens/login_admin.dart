import 'package:admin/features/auth/controller/auth_controller.dart';
import 'package:admin/features/auth/repository/player_provider.dart';
import 'package:admin/features/auth/screens/otp_page.dart';
import 'package:admin/features/auth/screens/sign_up_page.dart';
import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPageAdmin extends ConsumerStatefulWidget {
  const LoginPageAdmin({super.key});

  @override
  ConsumerState<LoginPageAdmin> createState() => _LoginPageAdminState();
}

class _LoginPageAdminState extends ConsumerState<LoginPageAdmin> {
  bool isAllDetailFilled = false;
  @override
  void initState() {
    super.initState();
    var player = ref.read(playerProvider);
    if (player.year.toString().trim().isNotEmpty &&
        player.contactNo.trim().isNotEmpty &&
        player.password.trim().isNotEmpty) {
      setState(() {
        isAllDetailFilled = true;
      });
    }
  }

  final _scrollController = ScrollController();
  void checkAllFields() {
    scrollToBottom();
    var player = ref.read(playerProvider);
    if (player.year != 0 &&
        player.contactNo.trim().isNotEmpty &&
        player.password.trim().isNotEmpty) {
      setState(() {
        isAllDetailFilled = true;
      });
    } else {
      setState(() {
        isAllDetailFilled = false;
      });
    }
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 3),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  String? selectedOption;

  final List<int> items = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    var player = ref.watch(playerProvider);
    return Scaffold(
      body: Container(
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
            controller: _scrollController,
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
                Center(
                  child: DropdownButton<int>(
                    hint: const Text(
                      'Select Your Year',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: const TextStyle(color: Colors.blue),
                    // Value to display in the dropdown button
                    value:
                        player.year - 1 < 0 ? items[0] : items[player.year - 1],
                    // List of items to display in the dropdown menu
                    items: items.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    // Callback function when a new item is selected
                    onChanged: (int? newValue) {
                      player = newValue != null
                          ? player.copyWith(year: newValue)
                          : player.copyWith(year: 0);
                      ref
                          .watch(playerProvider.notifier)
                          .update((state) => player);
                      if (newValue != null) {
                        checkAllFields();
                      } else {
                        setState(() {
                          isAllDetailFilled = false;
                        });
                      }
                    },
                  ),
                ),
                TextfieldLogin(
                  onChange: (value) {
                    if (value != '') {
                      player = player.copyWith(year: 0);
                    } else {
                      int? year = int.tryParse(value);
                      player = player.copyWith(year: year);
                    }
                    ref
                        .watch(playerProvider.notifier)
                        .update((state) => player);
                    if (value.trim().isNotEmpty) {
                      checkAllFields();
                    } else {
                      setState(() {
                        isAllDetailFilled = false;
                      });
                    }
                  },
                  aboveText: 'Year',
                  hintText: 'Enter your Year',
                  textInputType: TextInputType.number,
                  initailValue: player.year.toString(),
                ), //TextField for name
                TextfieldLogin(
                  initailValue: player.contactNo,
                  aboveText: 'Contact Number',
                  hintText: 'Enter your Contact number',
                  textInputType: TextInputType.phone,
                  onChange: (value) {
                    player = player.copyWith(contactNo: value.toString());
                    ref
                        .watch(playerProvider.notifier)
                        .update((state) => player);
                    if (value.trim().isNotEmpty) {
                      checkAllFields();
                    } else {
                      setState(() {
                        isAllDetailFilled = false;
                      });
                    }
                  },
                ), //TextField for phone number
                TextfieldLogin(
                  initailValue: player.password,
                  aboveText: 'Password',
                  hintText: 'Enter your password',
                  textInputType: TextInputType.visiblePassword,
                  isPassword: true,
                  onChange: (value) {
                    player = player.copyWith(password: value.toString());
                    ref
                        .watch(playerProvider.notifier)
                        .update((state) => player);
                    if (value.trim().isNotEmpty) {
                      checkAllFields();
                    } else {
                      setState(() {
                        isAllDetailFilled = false;
                      });
                    }
                  },
                ), //TextField for password
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 320,
                  child: TextButton(
                    onPressed: () {
                      if (isAllDetailFilled) {
                        ref
                            .read(authControllerProvider)
                            .clickRegister(
                              player,
                              context,
                            )
                            .then((value) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const OtpPage(),
                            ),
                          );
                        }).catchError((error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Registration failed. Please try again later.'),
                            ),
                          );
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Adjust the radius as needed
                      ),
                      backgroundColor: isAllDetailFilled
                          ? const Color.fromRGBO(225, 25, 109, 1)
                          : Colors.grey,
                    ),
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
    );
  }
}

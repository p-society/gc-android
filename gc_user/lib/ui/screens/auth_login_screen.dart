import 'package:flutter/material.dart';
import 'package:gc_user/core/style/colors.dart';
import 'package:gc_user/core/style/sizes.dart';
import 'package:gc_user/ui/components/auth_button.dart';
import 'package:gc_user/ui/components/auth_text_field.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  late final TextEditingController _emailTextEditingCOntroller;

  @override
  void initState() {
    super.initState();
    _emailTextEditingCOntroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppComponestsSizes(context)
          .runningDeviceDimensionAdjustedWidth(360.0),
      height:
          AppComponestsSizes(context).runningDeviceDimensionAdjustedHeight(716),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: AppColors.authPagebackgroundColor),
      child: Stack(
        children: [
          Positioned(
            left: AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedWidth(27.0),
            top: AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedHeight(114.2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                    height: AppComponestsSizes(context)
                        .runningDeviceDimensionAdjustedHeight(25.2)),
                const SizedBox(
                  child: Text(
                    'Enter your email address \nto sign in',
                    style: TextStyle(
                      color: Color(0xFFE0E0E0),
                      fontSize: 20,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppComponestsSizes(context)
                      .runningDeviceDimensionAdjustedHeight(53.0),
                ),
                CustomAuthTextField(
                    hintText: 'Email',
                    icon: Icons.alternate_email_rounded,
                    controller: _emailTextEditingCOntroller,
                    obsecureText: false),
                SizedBox(
                  height: AppComponestsSizes(context)
                      .runningDeviceDimensionAdjustedHeight(11.76),
                ),
                CustomAuthTextField(
                    hintText: 'Password',
                    icon: Icons.key,
                    controller: _emailTextEditingCOntroller,
                    obsecureText: false),
                SizedBox(
                  height: AppComponestsSizes(context)
                      .runningDeviceDimensionAdjustedHeight(11.76),
                ),
                const CustomAuthButton(buttonText: 'LOG IN', isDisabled: true),
              ],
            ),
          ),
          Positioned(
            left: AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedWidth(117),
            top: AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedHeight(513),
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'League Spartan',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            top: AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedHeight(575),
            left: AppComponestsSizes(context)
                .runningDeviceDimensionAdjustedWidth(48),
            child: const Column(
              children: [
                SizedBox(
                  child: Text(
                    'Don\'t have an account ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFFA7FF37),
                      fontSize: 20,
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

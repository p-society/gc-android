import 'package:admin/constants/scaffold_messenger.dart';
import 'package:admin/constants/scroll_controller.dart';
import 'package:admin/features/auth/repository/player_provider.dart';
import 'package:admin/features/auth/screens/login_admin.dart';
import 'package:admin/features/auth/screens/textfield_login.dart';
import 'package:admin/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondLoginScreen extends ConsumerStatefulWidget {
  const SecondLoginScreen({super.key});

  @override
  ConsumerState<SecondLoginScreen> createState() => _SecondLoginScreenState();
}

class _SecondLoginScreenState extends ConsumerState<SecondLoginScreen> {
  final ScrollController _scrollController = ScrollController();
  void backTobottom() {
    MyScrollController(controller: _scrollController).scrolltoBottom();
  }

  bool isAllDetailFilled = false;
  @override
  void initState() {
    super.initState();
    var player = ref.read(playerProvider);
    if (player.branch.trim().isNotEmpty &&
        player.sport.trim().isNotEmpty &&
        player.role.trim().isNotEmpty) {
      setState(() {
        isAllDetailFilled = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void checkAllFields() {
    backTobottom();
    var player = ref.read(playerProvider);
    print('values are : ${player.firstName} ${player.lastName}');
    if (player.branch.isNotEmpty &&
        player.sport.trim().isNotEmpty &&
        player.role.trim().isNotEmpty) {
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
    Player player = ref.watch(playerProvider);
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
                        'assets/images/sports_illustration_gCSB.png',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextfieldLogin(
                    initailValue: player.branch,
                    onChange: (value) {
                      player = player.copyWith(branch: value.trim().toString());
                      ref
                          .read(playerProvider.notifier)
                          .update((state) => player);
                      checkAllFields();
                    },
                    aboveText: 'Branch Name',
                    hintText: 'Enter your Branch Name',
                    textInputType: TextInputType.name,
                  ),
                  TextfieldLogin(
                    initailValue: player.sport,
                    aboveText: 'Sport',
                    hintText: 'Enter your Sport',
                    textInputType: TextInputType.emailAddress,
                    onChange: (value) {
                      player = player.copyWith(sport: value.trim().toString());
                      ref
                          .read(playerProvider.notifier)
                          .update((state) => player);
                      checkAllFields();
                    },
                  ), //TextField for Sport
                  TextfieldLogin(
                    initailValue: player.role,
                    onChange: (value) {
                      player = player.copyWith(role: value.trim().toString());
                      ref
                          .read(playerProvider.notifier)
                          .update((state) => player);
                      checkAllFields();
                    },
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
                            if (isAllDetailFilled) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPageAdmin(),
                                ),
                              );
                            } else {
                              MyScaffoldMessage().showScaffoldMessenge(
                                  context: context, content: 'Fill All Detail');
                            }
                          },
                          child: Text(
                            'Next > >',
                            style: TextStyle(
                              color: isAllDetailFilled
                                  ? const Color(0xFFC01A60)
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

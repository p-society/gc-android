import 'dart:convert';

import 'package:admin/constants/scaffold_messenger.dart';
import 'package:admin/features/auth/screens/otp_page.dart';
import 'package:admin/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

//http://57.151.122.119:3030/

final AuthRepositoryProvider = Provider((ref) => AuthRepository(
      url: 'http://57.151.122.119:3030/player',
    ));

class AuthRepository {
  final String url;

  AuthRepository({
    required this.url,
  });
  void clickRegister(Player player, BuildContext context) async {
    print('Click Register Button');
    Map<String, dynamic> decoded = {
      "email": "b122079@iiit-bh.ac.in",
      "firstName": "Soubhik",
      "lastName": "Gon",
      "password": "b422056",
      "role": 32768,
      "sport": "football",
      "branch": "it",
      "year": 2,
      "contactNo": "6370462354",
      "socials": [
        {"instagram": "soubhikgon_", "linkedin": "soubhikgon"}
      ]
    };
    String myData = jsonEncode(decoded);
    try {
      print('Enter in Try block Register Button');

      var response = await http.post(
        Uri.parse(url),
        body: myData,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print(
            'Register Sccessfully : JS-Token is : ${response.body.toString()}');
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OtpPage(),
          ),
        );
      }
    } catch (e) {
      print('Catches Error Register Button : ${e.toString()}');

      MyScaffoldMessage().showScaffoldMessenge(
        context: context,
        content: e.toString(),
      );
    }
  }
}

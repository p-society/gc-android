import 'dart:convert';

import 'package:admin/constants/scaffold_messenger.dart';
import 'package:admin/models/player_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final authRepositoryProvider = Provider(
  (ref) {
    String gUrl = dotenv.get('GENERAL_URL');
    return AuthRepository(
      url: '$gUrl/player',
      ref: ref,
    );
  },
);

class AuthRepository {
  final String url;
  ProviderRef ref;
  AuthRepository({required this.url, required this.ref});
  Future clickRegister(Player player, BuildContext context) async {
    Map<String, dynamic> decoded = player.toMap();
    String myData = jsonEncode(decoded);
    try {
      MyScaffoldMessage()
          .showScaffoldMessenge(context: context, content: player.password);
      var response = await http.post(
        Uri.parse(url),
        body: myData,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 201) {
        String jsonResponseString = response.body.toString();
        Map<String, dynamic> jsonResponse = jsonDecode(jsonResponseString);
        String value = jsonResponse['token'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        await sharedPreferences.setString('USER_JWT', value);
        return;
      }
    } catch (e) {
      rethrow;
    }
  }
}
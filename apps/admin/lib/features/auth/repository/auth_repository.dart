import 'dart:convert';

import 'package:admin/DataBase/database_helper_class.dart';
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
      url: gUrl,
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
        Uri.parse('$url/users'),
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
      } else {
        throw ('this is an error');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future verifyOtp(String otp) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? uid = sharedPreferences.getString('USER_JWT');
      int op = int.parse(otp);
      Map<String, dynamic> mpp = {"otp": op};

      if (uid != null) {
        String oUrl = 'http://20.81.43.214:3030/users/verification';
        var response = await http.post(
          Uri.parse(oUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $uid'
          },
          body: mpp.toString(), //'{"otp" : $op}'
        );
        if (response.statusCode == 201) {
          /*
          We have to store this user model in the local database
   {
    "firstName": "Soubhik Kumar ",
    "lastName": "Gon",
    "email": "afafsfs@iiit-bh.ac.in",
    "role": 1,
    "branch": "it",
    "year": 2,
    "contactNo": "1234567890",
    "_id": "65f58e5659ac83296d66e448",
    "createdAt": "2024-03-16T12:19:34.918Z",
    "updatedAt": "2024-03-16T12:19:34.918Z",
    "__v": 0
}*/
          Map<String, dynamic> map = jsonDecode(response.body);
          return;
        } else {
          throw Exception('Network Error');
        }
      } else {
        throw Exception('User Doesn\'t Exist');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

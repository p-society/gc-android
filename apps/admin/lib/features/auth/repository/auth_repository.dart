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
      url: '$gUrl',
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
        print('otp sent successfully ');
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
// curl --location 'http://20.81.43.214:3030/users/verification' \
// --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImZpcnN0TmFtZSI6IlNvdWJoaWsgS3VtYXIgIiwibGFzdE5hbWUiOiJHb24iLCJlbWFpbCI6ImI0MjIwNTZAaWlpdC1iaC5hYy5pbiIsInBhc3N3b3JkIjoiJDJhJDEwJDBMZXVkUWp5OU9ONFlJenhpRjFkS2VKeFNMZDVTd2UwMU5NZldQRlBmMVNQRGx0dGt5akJTIiwicm9sZSI6MSwiYnJhbmNoIjoiaXQiLCJ5ZWFyIjoyLCJjb250YWN0Tm8iOiIxMjM0NTY3ODkwIn0sIm90cCI6ODkwMTk5LCJpYXQiOjE3MTA1OTEzODR9.ZjNUwmY69vKFT8GVrxXAXDTAhYlrLiUazeBOm0psCNs' \
// --header 'Content-Type: application/json' \
// --data '{
//     "otp":890199
// }'

  Future verifyOtp(String otp) async {
    print('otp is : $otp');

    try {
      print('enter in otp try block');
      int op = int.parse(otp);
      print('this is the converted otp :$op');
      Map<String, dynamic> mpp = {"otp": op};
      var jsonOtp = jsonEncode(mpp);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? uid = sharedPreferences.getString('USER_JWT');

      if (uid != null) {
        String oUrl = 'http://20.81.43.214:3030/users/verification';
        print('JWT token is : $uid');
        var response = await http.post(
          Uri.parse(oUrl),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $uid'
          },
          body: '{"otp" : $op}',
        );
        print(response.toString());
        if (response.statusCode == 201) {
          print(response.toString());
          var jsonData = jsonDecode(response.body);
          String id = jsonData['_id'];
          print('Data Access Successfully');
          print(id);
          print(jsonData['email']);
        } else {
          print('response is : ${response.body}');
          throw ('Network Error');
        }
      } else {
        print('user not exist');
        throw ('User Doesn\'t Exist');
      }
    } catch (e) {
      print('Enter in the catch error block');
      print('this is an error : $e');
      throw (e);
    }
  }
}

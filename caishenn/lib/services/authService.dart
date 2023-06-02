import 'dart:convert';

import 'package:caishenn/login&signup/resetpass.dart';
import 'package:caishenn/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

import '../models/token.dart';

class authService {
 // static String BASE_URL = "http://192.168.1.188:3000/api/auth";
  static String BASE_URL = "http://192.168.22.100:3000/api/auth";
  static Future<String> signupRequest(User user) async {
    http.Response res = await http.post(
      Uri.parse(BASE_URL + '/signup'),

      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(user),
      //encoding: Encoding.getByName("utf-8"),
    );

    print(res);
    print(res.statusCode);
    if (res.statusCode == 201) {
      return res.body;
    }

    return "error";
  }

  static Future<String> loginRequest(User user) async {
    http.Response res = await http.post(
      Uri.parse(BASE_URL + '/login'),

      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode(user),
      //encoding: Encoding.getByName("utf-8"),
    );

    print(res);
    print(res.statusCode);
    if (res.statusCode == 201) {
      return res.body;
    }

    return "error";
  }

  static Future<Token> checkmail(String mail) async {
    http.Response res = await http.post(
      Uri.parse(BASE_URL + '/checkmail'),
      body: {"email": mail},
      encoding: Encoding.getByName("utf-8"),
    );

    print(res);
    print(res.statusCode);
    if (res.statusCode == 201) {
      if (res.body.contains("token")) {
        return Token.fromJson(JwtDecoder.decode(res.body), res.body);
      }
    }

    return Token(token: "error");
  }

  static Future<bool> resetpass(String newpass, String token) async {
    http.Response res = await http.post(
      Uri.parse(BASE_URL + '/resetpass'),
      headers: {"Authorization": "Bearer ${token}"},
      body: {"newpass": newpass},
      encoding: Encoding.getByName("utf-8"),
    );

    print(res);
    print(res.body);
    print(res.statusCode);
    if (res.statusCode == 201) {
      return true;
    }

    return false;
  }
}

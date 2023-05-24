
import 'package:caishenn/models/token.dart';
import 'package:caishenn/models/user.dart';
import 'package:flutter/material.dart';
import 'package:caishenn/services/authService.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../home/home.dart';
import '../tools/utilities.dart';

Future<void> validate(BuildContext cont, String logsig,
    GlobalKey<FormState> _formKey, User user) async {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();
    var encoded_token = await (logsig == "login"
        ? authService.loginRequest(user)
        : authService.signupRequest(user));
    if (encoded_token.contains("token")) {
      var decoded_token = Token.fromJson(JwtDecoder.decode(encoded_token),encoded_token);
      Navigator.push(
          cont,
          MaterialPageRoute(
              builder: (_) => home(
                    token: decoded_token,
                  )));
    } else {
      ScaffoldMessenger.of(cont)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackbar(
            'Erreur!!',
            logsig == "login"
                ? 'Vérifiez vos informations'
                : 'Vérifiez vos informations ou il se peut que vos information sont deja prises'));
    }
  }
}

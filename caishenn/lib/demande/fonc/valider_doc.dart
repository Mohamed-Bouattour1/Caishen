import 'dart:io';

import 'package:caishenn/demande/fonc/fonc.dart';
import 'package:caishenn/models/token.dart';
import 'package:caishenn/services/demande_service.dart';
import 'package:flutter/material.dart';

import '../../tools/utilities.dart';




valider_doc(BuildContext context, File file, Token token, String titre, List<dynamic> titres) async{
  print(file);
    var res = await demandeservice.upload(file, titre, token);
    print("hhhhhh"+res);
    if (res == "Uploaded!") {
      titres.remove(titre);
      Navigator.push(context,
                      MaterialPageRoute(builder: (_) => fonc(token: token, titres: titres)));
    } else {
      ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackbar("erreur", "quelques choses ne va pas "));
    }
}
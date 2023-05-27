import 'dart:io';

import 'package:caishenn/models/demande.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/token.dart';


class demandeservice {


  static String BASE_URL = "http://192.168.1.188:3000/api/demande";
 static Future<List<dynamic>> demRequest(demande dem , Token token) async {

    http.Response res = await http.post( Uri.parse(BASE_URL), 

        headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":"Bearer ${token.token}"
    },
    body:jsonEncode(dem) ,
    encoding: Encoding.getByName("utf-8"),
    );

    print(res.statusCode);
      if (res.statusCode == 201) {
        
        return jsonDecode(res.body);
      }

      return ["error"];

}

static Future<String> upload(File file , String titre, Token token) async {

    http.Response res = await http.post( Uri.parse(BASE_URL+'/file/${titre}'), 

        headers: {
      "Authorization":"Bearer ${token.token}"
    },
    body:file ,
    //encoding: Encoding.getByName("utf-8"),
    );

    print(res.statusCode);
      if (res.statusCode == 201) {
        
        return "file uploaded";
      }

      return "error";

}

 static Future<List<dynamic>> getEngRequest() async {

    http.Response res = await http.get( Uri.parse(BASE_URL+'/eng'), 

      
    );

    print(res.statusCode);
      if (res.statusCode == 200) {
        
        return jsonDecode(res.body);
      }

      return ["error"];

}


}
import 'dart:typed_data';

import 'package:caishenn/models/simulation.dart';
import 'package:caishenn/models/token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class simulationService
{

    static String BASE_URL = "http://192.168.1.188:3000/api/simulation";
 static Future<String> simRequest(simulation sim , Token token) async {

    http.Response res = await http.post( Uri.parse(BASE_URL), 

        headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":"Bearer ${token.token}"
    },
    body:jsonEncode(sim) ,
    encoding: Encoding.getByName("utf-8"),
    );

    print(res.statusCode);
      if (res.statusCode == 201) {
        
        return res.body;
      }

      return "error";

}

static Future<List<dynamic>> getAllsimRequest(Token token) async {

    http.Response res = await http.get( Uri.parse(BASE_URL), 

        headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":"Bearer ${token.token}"
    },
    );

    print(res.statusCode);
      if (res.statusCode == 200) {
        List<dynamic> sims = jsonDecode(res.body);
        return sims;
      }

      return [];

}

 static Future<String> simRequestinv(simulation sim , String imei) async {

    http.Response res = await http.post( Uri.parse(BASE_URL+'/invite/${imei}'), 

        headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
    body:jsonEncode(sim) ,
    encoding: Encoding.getByName("utf-8"),
    );

    print(res.statusCode);
      if (res.statusCode == 201) {
        
        return res.body;
      }

      return "error";

}

static Future<Uint8List>  getpdf(Token token, String id) async {

    http.Response res = await http.get( Uri.parse(BASE_URL+'/getpdf/user/${id}'), 

        headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization":"Bearer ${token.token}"
    },
    );

    print(res.statusCode);
      if (res.statusCode == 200) {
        return res.bodyBytes;
      }
throw Exception();
      

}

static Future<Uint8List>  getpdfinv(String id) async {

    http.Response res = await http.get( Uri.parse(BASE_URL+'/getpdf/invite/${id}'), 

        headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
    );

    print(res.statusCode);
      if (res.statusCode == 200) {
        return res.bodyBytes;
      }
      throw Exception();

      

}

static Future<String> deletesim(String id , Token token) async {
  print(id);
 var url = Uri.parse(BASE_URL+'/${id}');
 print(url);
    http.Response res = await http.delete(url, 

        headers: {
      "Authorization":"Bearer ${token.token}"
    },
    );

    print(res.statusCode);
      if (res.statusCode == 200) {
        
        return "deleted";
      }

      return "error";

}


}




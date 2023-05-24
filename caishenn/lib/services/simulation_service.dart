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

 


}




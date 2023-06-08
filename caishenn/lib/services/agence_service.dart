import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/token.dart';


class AgenceService{

  static String BASE_URL = "http://192.168.1.188:3000/api/agence";
  //static String BASE_URL = "http://192.168.22.100:3000/api/agence";
  static Future<List<dynamic>> getAllAgencies() async {
final nomimf = "test";
    http.Response res = await http.get( Uri.parse(BASE_URL+'/mobile/${nomimf}'), 

       /*  headers: {
      "Authorization":"Bearer ${token.token}"
    }, */
    );

    print(res.statusCode);
      if (res.statusCode == 200) {
        List<dynamic> AG = jsonDecode(res.body);
        return AG;
      }

      return [];

}
}
/* 
@Controller('api/agence')
 @Get('/:nomimf')
    @UseGuards(AuthGuard())
    getAllAgencies(@Param('nomimf') nomimf) : Promise<Agence[]> {
      return this.agenceService.getAllAgencies(nomimf);
    }
 */
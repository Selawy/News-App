import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/my_url.dart';

class HttpHelper {
  HttpHelper._internal();
  static final HttpHelper _singleton = HttpHelper._internal();
  factory HttpHelper() {
    return _singleton;
  }
   Future<Map<String , dynamic>> loginUserFromApi()async{
    try {
      var myUrl = Uri.parse(LOGIN);
      var res = await http.post(myUrl , body:{
        "username":"kminchelle",
        "password":"0lelplR"
      });
      if(res.statusCode == 200){
        Map<String , dynamic> myMap = jsonDecode(res.body) ;
        return myMap;
      }else{
        return {} ;
      }
    }catch (e){
      throw("${e.toString()}");
    }
  }



   Future<Map<String , dynamic>> getDataFromApi({required String LINK})async{
    try{
      var myUrl = Uri.parse(LINK);
      var res = await http.get(myUrl);
      if(res.statusCode == 200){
        Map<String , dynamic> myMap = jsonDecode(res.body);
        return myMap ;
      } else {
        return {};
      }
    }catch(e){
      throw("Error is ${e.toString()}");
    }

  }
}
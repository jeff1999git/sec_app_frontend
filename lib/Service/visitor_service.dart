import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:security_app/Model/visitor_model.dart';

class VisitorApiService
{
  Future<List<Visitor>> getVisitor() async{
    var client= http.Client();
    var apiUrl=Uri.parse("http://172.16.185.236:3001/api/visitor/viewall");
    var response= await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return visitorFromJson(response.body);
    }
    else
    {
      return [];
    }

  }
  Future<dynamic> addVisitorApi(String securityId,String name,String address,String phone,String purpose) async
  {
    var client =http.Client();
    var apiUrl= Uri.parse("http://172.16.185.236:3001/api/visitor/add");

    var response =await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "securityId": securityId,
          "name": name,
          "address": address,
          "phone": phone,
          "purpose": purpose,
        })
    );
    if(response.statusCode==200)
    {
      return json.decode(response.body);
    }
    else
    {
      throw Exception("failed to add");
    }
  }
}
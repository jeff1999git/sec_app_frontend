import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:security_app/Model/security_model.dart';


class SecurityApiService
{
  Future<dynamic> SecurityloginData(String email, String password) async {
    var client = http.Client();
    var apiUrl = Uri.parse("http://172.16.185.236:3001/api/sec/login");

    var response = await client.post(apiUrl,
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        })
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    else {
      throw Exception("failed to login");
    }
  }

  Future<List<Security>> getSecurityApi() async{
    var client= http.Client();
    var apiUrl=Uri.parse("http://172.16.185.236:3001/api/sec/viewall");

    var response= await client.get(apiUrl);
    if(response.statusCode==200)
    {
      return securityFromJson(response.body);
    }
    else
    {
      return [];
    }

  }

  Future<dynamic> addSecurityApi(String name,String empid,String address,String phno,String email,String password) async
  {
    var client =http.Client();
    var apiUrl= Uri.parse("http://172.16.185.236:3001/api/sec/add");

    var response =await client.post(apiUrl,
        headers: <String,String>{
          "Content-Type" : "application/json; charset=UTF-8"
        },
        body: jsonEncode(<String,String>{
          "name": name,
          "empid": empid,
          "address": address,
          "phno": phno,
          "email": email,
          "password": password,
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
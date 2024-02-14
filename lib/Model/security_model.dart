// To parse this JSON data, do
//
//     final security = securityFromJson(jsonString);

import 'dart:convert';

List<Security> securityFromJson(String str) => List<Security>.from(json.decode(str).map((x) => Security.fromJson(x)));

String securityToJson(List<Security> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Security {
  String name;
  String empid;
  String address;
  String phno;
  String email;
  String password;

  Security({
    required this.name,
    required this.empid,
    required this.address,
    required this.phno,
    required this.email,
    required this.password,
  });

  factory Security.fromJson(Map<String, dynamic> json) => Security(
    name: json["name"],
    empid: json["empid"],
    address: json["address"],
    phno: json["phno"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "empid": empid,
    "address": address,
    "phno": phno,
    "email": email,
    "password": password,
  };
}

// To parse this JSON data, do
//
//     final visitor = visitorFromJson(jsonString);

import 'dart:convert';

List<Visitor> visitorFromJson(String str) => List<Visitor>.from(json.decode(str).map((x) => Visitor.fromJson(x)));

String visitorToJson(List<Visitor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Visitor {
  SecurityId securityId;
  String name;
  String address;
  String phone;
  String purpose;
  DateTime postedDate;

  Visitor({
    required this.securityId,
    required this.name,
    required this.address,
    required this.phone,
    required this.purpose,
    required this.postedDate,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) => Visitor(
    securityId: SecurityId.fromJson(json["securityId"]),
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    purpose: json["purpose"],
    postedDate: DateTime.parse(json["postedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "securityId": securityId.toJson(),
    "name": name,
    "address": address,
    "phone": phone,
    "purpose": purpose,
    "postedDate": postedDate.toIso8601String(),
  };
}

class SecurityId {
  String name;
  String empid;

  SecurityId({
    required this.name,
    required this.empid,
  });

  factory SecurityId.fromJson(Map<String, dynamic> json) => SecurityId(
    name: json["name"],
    empid: json["empid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "empid": empid,
  };
}

import 'dart:convert';

BuyCoinsModel buycoinsmodelFromJson(String str) => BuyCoinsModel.fromJson(json.decode(str));
String buycoinsmodelToJson(BuyCoinsModel data) => json.encode(data.toJson());

class BuyCoinsModel {
  BuyCoinsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory BuyCoinsModel.fromJson(Map<String, dynamic> json) => BuyCoinsModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
     this.id,
     this.name,
     this.price,
     this.description,
     this.discount,
     this.coins,
     this.status,
     this.dateCreated,
  });

  String? id;
  String? name;
  String? price;
  String? description;
  String? discount;
  String? coins;
  String? status;
  DateTime? dateCreated;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    discount: json["discount"],
    coins: json["coins"],
    status: json["status"],
    dateCreated: DateTime.parse(json["date_created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "description": description,
    "discount": discount,
    "coins": coins,
    "status": status,
    "date_created": "${dateCreated?.year.toString().padLeft(4, '0')}-${dateCreated?.month.toString().padLeft(2, '0')}-${dateCreated?.day.toString().padLeft(2, '0')}",
  };
}

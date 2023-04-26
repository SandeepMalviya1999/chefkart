// To parse this JSON data, do
//
//     final dishDetailsModel = dishDetailsModelFromJson(jsonString);

import 'dart:convert';

DishDetailsModel dishDetailsModelFromJson(String str) =>
    DishDetailsModel.fromJson(json.decode(str));

String dishDetailsModelToJson(DishDetailsModel data) =>
    json.encode(data.toJson());

class DishDetailsModel {
  DishDetailsModel({
    this.name,
    this.id,
    this.timeToPrepare,
    this.ingredients,
  });

  factory DishDetailsModel.fromRawJson(String str) =>
      DishDetailsModel.fromJson(json.decode(str));

  factory DishDetailsModel.fromJson(Map<String, dynamic> json) =>
      DishDetailsModel(
        name: json['name'],
        id: json['id'],
        timeToPrepare: json['timeToPrepare'],
        ingredients: json['ingredients'] == null
            ? null
            : Ingredients.fromJson(json['ingredients']),
      );
  final String? name;
  final int? id;
  final String? timeToPrepare;
  final Ingredients? ingredients;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'timeToPrepare': timeToPrepare,
        'ingredients': ingredients?.toJson(),
      };
}

class Ingredients {
  Ingredients({
    this.vegetables,
    this.spices,
    this.appliances,
  });

  factory Ingredients.fromRawJson(String str) =>
      Ingredients.fromJson(json.decode(str));

  factory Ingredients.fromJson(Map<String, dynamic> json) => Ingredients(
        vegetables: json['vegetables'] == null
            ? []
            : List<Spice>.from(
                json['vegetables']!.map((x) => Spice.fromJson(x)),
              ),
        spices: json['spices'] == null
            ? []
            : List<Spice>.from(json['spices']!.map((x) => Spice.fromJson(x))),
        appliances: json['appliances'] == null
            ? []
            : List<Appliance>.from(
                json['appliances']!.map((x) => Appliance.fromJson(x)),
              ),
      );
  final List<Spice>? vegetables;
  final List<Spice>? spices;
  final List<Appliance>? appliances;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'vegetables': vegetables == null
            ? []
            : List<dynamic>.from(vegetables!.map((x) => x.toJson())),
        'spices': spices == null
            ? []
            : List<dynamic>.from(spices!.map((x) => x.toJson())),
        'appliances': appliances == null
            ? []
            : List<dynamic>.from(appliances!.map((x) => x.toJson())),
      };
}

class Appliance {
  Appliance({
    this.name,
    this.image,
  });

  factory Appliance.fromRawJson(String str) =>
      Appliance.fromJson(json.decode(str));

  factory Appliance.fromJson(Map<String, dynamic> json) => Appliance(
        name: json['name'],
        image: json['image'],
      );
  final String? name;
  final String? image;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
      };
}

class Spice {
  Spice({
    this.name,
    this.quantity,
  });

  factory Spice.fromRawJson(String str) => Spice.fromJson(json.decode(str));

  factory Spice.fromJson(Map<String, dynamic> json) => Spice(
        name: json['name'],
        quantity: json['quantity'],
      );
  final String? name;
  final String? quantity;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
      };
}

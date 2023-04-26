// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  DashboardModel({
    this.dishes,
    this.popularDishes,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        dishes: json['dishes'] == null
            ? []
            : List<Dish>.from(json['dishes']!.map((x) => Dish.fromJson(x))),
        popularDishes: json['popularDishes'] == null
            ? []
            : List<PopularDish>.from(
                json['popularDishes']!.map((x) => PopularDish.fromJson(x)),
              ),
      );
  final List<Dish>? dishes;
  final List<PopularDish>? popularDishes;

  Map<String, dynamic> toJson() => {
        'dishes': dishes == null
            ? []
            : List<dynamic>.from(dishes!.map((x) => x.toJson())),
        'popularDishes': popularDishes == null
            ? []
            : List<dynamic>.from(popularDishes!.map((x) => x.toJson())),
      };
}

class Dish {
  Dish({
    this.name,
    this.rating,
    this.description,
    this.equipments,
    this.image,
    this.id,
  });

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        name: json['name'],
        rating: json['rating']?.toDouble(),
        description: json['description'],
        equipments: json['equipments'] == null
            ? []
            : List<String>.from(json['equipments']!.map((x) => x)),
        image: json['image'],
        id: json['id'],
      );
  final String? name;
  final double? rating;
  final String? description;
  final List<String>? equipments;
  final String? image;
  final int? id;

  Map<String, dynamic> toJson() => {
        'name': name,
        'rating': rating,
        'description': description,
        'equipments': equipments == null
            ? []
            : List<dynamic>.from(equipments!.map((x) => x)),
        'image': image,
        'id': id,
      };
}

class PopularDish {
  PopularDish({
    this.name,
    this.image,
    this.id,
  });

  factory PopularDish.fromJson(Map<String, dynamic> json) => PopularDish(
        name: json['name'],
        image: json['image'],
        id: json['id'],
      );
  final String? name;
  final String? image;
  final int? id;

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'id': id,
      };
}

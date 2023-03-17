import 'package:flutter/material.dart';

class TitlePageType {
  String title;

  TitlePageType({
    required this.title,
  });

  factory TitlePageType.fromJson(Map<String, dynamic> json) => TitlePageType(
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
      };
}

class MenuType {
  String label;
  String route;
  int? icon;

  MenuType({
    required this.label,
    required this.route,
    this.icon,
  });

  factory MenuType.fromJson(Map<String, dynamic> json) => MenuType(
        label: json['label'],
        route: json['route'],
        icon: json['icon'],
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'route': route,
        'icon': icon,
      };
}

class ResultPageType {
  String title;
  String description;

  ResultPageType({
    required this.title,
    required this.description,
  });

  factory ResultPageType.fromJson(Map<String, dynamic> json) => ResultPageType(
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}

class PartnersDetailPageType {
  final String title;
  final String description;
  final String image;
  final int deals;

  PartnersDetailPageType({
    required this.title,
    required this.description,
    required this.image,
    required this.deals,
  });

  factory PartnersDetailPageType.fromJson(Map<String, dynamic> json) =>
      PartnersDetailPageType(
        title: json['title'],
        description: json['description'],
        image: json['image'],
        deals: json['deals'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'image': image,
        'deals': deals,
      };
}

class ListType {
  String label;
  String value;

  ListType({
    required this.label,
    required this.value,
  });

  factory ListType.fromJson(Map<String, dynamic> json) => ListType(
        label: json['label'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
      };
}

class CarListSummaryType {
  int percentage;
  bool isElectricVehicle;

  CarListSummaryType({
    required this.percentage,
    required this.isElectricVehicle,
  });

  factory CarListSummaryType.fromJson(Map<String, dynamic> json) =>
      CarListSummaryType(
        percentage: json['percentage'],
        isElectricVehicle: json['isElectricVehicle'],
      );

  Map<String, dynamic> toJson() => {
        'percentage': percentage,
        'isElectricVehicle': isElectricVehicle,
      };
}

class HyundaiServicesType {
  IconData icon;
  String name;

  HyundaiServicesType({
    required this.icon,
    required this.name,
  });

  factory HyundaiServicesType.fromJson(Map<String, dynamic> json) =>
      HyundaiServicesType(
        icon: json['icon'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'icon': icon,
        'name': name,
      };
}

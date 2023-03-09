import 'package:flutter/material.dart';

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

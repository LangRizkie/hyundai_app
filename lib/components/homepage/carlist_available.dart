import "package:flutter/material.dart";
import "package:hyundai_app/components/homepage/carlist_available_add.dart";
import "package:hyundai_app/components/homepage/carlist_available_summary.dart";

class CarListAvailable extends StatefulWidget {
  const CarListAvailable({Key? key}) : super(key: key);

  @override
  State<CarListAvailable> createState() => _CarListAvailableState();
}

class _CarListAvailableState extends State<CarListAvailable> {
  final List<Map<String, dynamic>> cars = [
    {
      "percentage": 100,
      "isElectricVehicle": true,
    },
    {
      "percentage": 80,
      "isElectricVehicle": false,
    },
    {
      "percentage": 50,
      "isElectricVehicle": false,
    },
    {
      "percentage": 75,
      "isElectricVehicle": true,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 144,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...List.generate(
              cars.length,
              (index) => CarListAvailableSummary(
                car: cars[index],
              ),
            ),
            const CarListAvailableAdd(),
          ],
        ),
      ),
    );
  }
}

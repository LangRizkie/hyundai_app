import "package:flutter/material.dart";
import "package:hyundai_app/components/homepage/carlist_available.dart";
import "package:hyundai_app/components/homepage/carlist_empty.dart";

class CarListComponent extends StatefulWidget {
  const CarListComponent({Key? key}) : super(key: key);

  @override
  State<CarListComponent> createState() => _CarListComponentState();
}

class _CarListComponentState extends State<CarListComponent> {
  final bool haveCar = true;

  @override
  Widget build(BuildContext context) {
    return haveCar ? const CarListAvailable() : const CarListEmpty();
  }
}

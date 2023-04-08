import 'package:flutter/material.dart';
import 'package:hyundai_app/modules/theme.dart';

class CustomCardCar extends StatefulWidget {
  const CustomCardCar({super.key, this.child, this.image});

  final Widget? child;
  final String? image;

  @override
  State<CustomCardCar> createState() => _CustomCardCarState();
}

class _CustomCardCarState extends State<CustomCardCar> {
  double overflowHeight = 160;
  double extraHeight = 48;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: overflowHeight),
          padding: EdgeInsets.fromLTRB(
            16,
            extraHeight,
            16,
            16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Palette.backgroundSecondaryColor,
            ),
          ),
          child: widget.child,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            widget.image ?? "assets/images/car_placeholder.png",
            width: MediaQuery.of(context).size.width * .8,
            height: overflowHeight + extraHeight,
          ),
        ),
      ],
    );
  }
}

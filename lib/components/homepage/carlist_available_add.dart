import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class CarListAvailableAdd extends StatefulWidget {
  const CarListAvailableAdd({Key? key}) : super(key: key);

  @override
  State<CarListAvailableAdd> createState() => _CarListAvailableAddState();
}

class _CarListAvailableAddState extends State<CarListAvailableAdd> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () => Modular.to.pushNamed(Screens.myCar),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Palette.backgroundSecondaryColor,
          ),
        ),
        child: const SizedBox(
          width: 320,
          child: Center(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              children: [
                CircleAvatar(
                  backgroundColor: Palette.backgroundColor,
                  radius: 20,
                  child: Icon(
                    Icons.car_repair_outlined,
                    color: Palette.primaryColor,
                    size: 20,
                  ),
                ),
                Text(
                  "Add Hyundai Car",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

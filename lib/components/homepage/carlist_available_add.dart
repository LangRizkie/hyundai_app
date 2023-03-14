import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/modules/theme.dart';

class CarListAvailableAdd extends StatefulWidget {
  const CarListAvailableAdd({Key? key}) : super(key: key);

  @override
  State<CarListAvailableAdd> createState() => _CarListAvailableAddState();
}

class _CarListAvailableAddState extends State<CarListAvailableAdd> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Palette.backgroundSecondaryColor,
            ),
          ),
          child: SizedBox(
            width: 320,
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8,
                children: const [
                  CircleAvatar(
                    backgroundColor: Palette.backgroundColor,
                    radius: 24,
                    child: Icon(
                      Icons.car_repair_outlined,
                      color: Palette.primaryColor,
                    ),
                  ),
                  Text(
                    'Add New Car',
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
      ),
    );
  }
}

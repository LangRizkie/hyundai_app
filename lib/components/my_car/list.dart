import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/customization/custom_card_car.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/my_car/empty.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class MyCarListComponent extends StatefulWidget {
  const MyCarListComponent({super.key});

  @override
  State<MyCarListComponent> createState() => _MyCarListComponentState();
}

class _MyCarListComponentState extends State<MyCarListComponent> {
  final haveCar = true;

  @override
  Widget build(BuildContext context) {
    if (!haveCar) return const MyCarEmptyComponent();
    return list();
  }

  list() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                CustomCardCar(
                  image: "assets/images/ioniq.png",
                  child: customCardCarSummary(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        label: "Car Detail",
                        textColor: Palette.primaryColor,
                        buttonColor: Colors.white,
                        onPressed: () =>
                            Modular.to.pushNamed(Screens.myCarDetail),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        label: "Book Services",
                        textColor: Colors.white,
                        buttonColor: Palette.primaryColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  customCardCarSummary() {
    return const Gap(
      gap: 8,
      direction: Axis.vertical,
      children: [
        Text(
          "B 1234 IDN",
          style: TextStyle(
            fontFamily: Constant.fontFamilyText,
            fontSize: 14,
            color: Palette.secondaryColor,
          ),
        ),
        Text(
          "IONIQ 5",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Gap(
                gap: 4,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Vin Number",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "1234567890ABCDEF",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Gap(
                gap: 4,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Model Year",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "2021",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/modules/theme.dart';

class MyCarEmptyComponent extends StatefulWidget {
  const MyCarEmptyComponent({super.key});

  @override
  State<MyCarEmptyComponent> createState() => _MyCarEmptyComponentState();
}

class _MyCarEmptyComponentState extends State<MyCarEmptyComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Gap(
          gap: 8,
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.car_repair,
              size: 72,
              color: Colors.grey.shade300,
            ),
            const Text(
              "No registered car yet",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            const Text(
              "Get special perks and various benefits when you registered a Hyundai Car",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: Constant.fontFamilyText,
              ),
            ),
            CustomButton(
              label: "Register a Hyundai Car",
              prefixIcon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
              textColor: Colors.white,
              buttonColor: Palette.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/modules/theme.dart";

class HeroTextComponent extends StatelessWidget {
  const HeroTextComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: const Gap(
        gap: 8,
        direction: Axis.vertical,
        children: [
          Text(
            "Welcome to",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          Text(
            "myHyundai\nIndonesia",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 38,
            ),
          ),
          Text(
            "You are one tap away to Elevate Your Moments",
            style: TextStyle(
              fontFamily: Constant.fontFamilyText,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

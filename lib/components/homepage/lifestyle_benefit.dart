import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:hyundai_app/components/title_route.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class LifeStyleBenefitComponent extends StatefulWidget {
  const LifeStyleBenefitComponent({Key? key}) : super(key: key);

  @override
  State<LifeStyleBenefitComponent> createState() =>
      _LifeStyleBenefitComponentState();
}

class _LifeStyleBenefitComponentState extends State<LifeStyleBenefitComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRoute(
          title: "Lifestyle Benefit",
          description: "Get the best deal every time from our partners",
          fontSize: 20,
          action: true,
          onPressed: () => Modular.to.pushNamed(Screens.challenges),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) => card(index),
            ),
          ),
        ),
      ],
    );
  }

  card(int index) {
    return Container(
      width: 146,
      margin: EdgeInsets.only(
        left: 16,
        right: index == 4 - 1 ? 16 : 0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 144,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://via.placeholder.com/146x146",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Group",
                  style: TextStyle(
                    fontFamily: Constant.fontFamilyText,
                    fontSize: 12,
                  ),
                ),
                Text(
                  "New Hyundai PALISADE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "100.000 Coins",
                  style: TextStyle(
                    fontFamily: Constant.fontFamilyText,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Palette.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

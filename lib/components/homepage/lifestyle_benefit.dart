import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_list_icon_button.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/title_route.dart';
import 'package:hyundai_app/modules/theme.dart';

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
        const TitleRoute(
          title: "Lifestyle Benefit",
          description: "Get the best deal every time from our partners",
          fontSize: 20,
          action: true,
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
        Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Gap(
            gap: 8,
            direction: Axis.vertical,
            children: [
              CustomListIconButton(
                onPressed: () {},
                label: "Exclusive Deals For You",
                useBottomBorder: false,
                color: Colors.white,
                backgroundColor: Palette.primaryColor,
                suffixIconColor: Colors.white,
              ),
              CustomListIconButton(
                onPressed: () {},
                label: "Input Promo Code",
                useBottomBorder: false,
                color: Colors.white,
                backgroundColor: Palette.primaryColor,
                suffixIconColor: Colors.white,
              ),
            ],
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
          SizedBox(
            width: double.infinity,
            height: 146,
            child: Image.network('https://via.placeholder.com/146x146'),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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

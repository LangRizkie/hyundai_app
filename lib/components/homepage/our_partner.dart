import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/title_route.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';

class OurPartnerComponent extends StatefulWidget {
  const OurPartnerComponent({Key? key}) : super(key: key);

  @override
  State<OurPartnerComponent> createState() => _OurPartnerComponentState();
}

class _OurPartnerComponentState extends State<OurPartnerComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleRoute(
          title: "Our Partners",
          description: "Find fascinating deals from them",
          fontSize: 20,
          action: true,
          onPressed: () => Modular.to.pushNamed(Screens.partners),
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
      width: 280,
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
                image: NetworkImage('https://via.placeholder.com/280x144'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Lifestyle",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(
                  gap: 4,
                  children: [
                    Icon(
                      Icons.confirmation_number_outlined,
                      color: Palette.primaryColor,
                      size: 12,
                    ),
                    Text(
                      "21 Deals",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

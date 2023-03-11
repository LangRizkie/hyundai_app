import 'package:flutter/material.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/title_route.dart';
import 'package:hyundai_app/modules/theme.dart';

class WhatsOnComponent extends StatefulWidget {
  const WhatsOnComponent({Key? key}) : super(key: key);

  @override
  State<WhatsOnComponent> createState() => _WhatsOnComponentState();
}

class _WhatsOnComponentState extends State<WhatsOnComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleRoute(
          title: "What's On",
          description: "See the latest promo from Hyundai",
          fontSize: 20,
          action: true,
        ),
        Gap(
          direction: Axis.vertical,
          gap: 16,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  4,
                  (index) => card(index),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "See the latest promo from Hyundai",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
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
          SizedBox(
            width: double.infinity,
            height: 144,
            child: Image.network('https://via.placeholder.com/280x144'),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "28 July 2022",
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

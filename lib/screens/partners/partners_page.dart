import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/theme.dart';

class PartnersPageScreen extends StatefulWidget {
  const PartnersPageScreen({super.key});

  @override
  State<PartnersPageScreen> createState() => _PartnersPageScreenState();
}

class _PartnersPageScreenState extends State<PartnersPageScreen> {
  int length = 10;

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: const CustomAppBar(
        title: "Partners",
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: List.generate(length, (index) => card(index)),
          ),
        ),
      ),
    );
  }

  card(int index) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: index == length - 1 ? 0 : 16),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 160,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/256x160'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: const Gap(
              gap: 8,
              direction: Axis.vertical,
              children: [
                Text(
                  "ISMAYA Group",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "Get ISMAYA Group vouchers and services at myHyundai Indonesia app",
                  style: TextStyle(
                    fontSize: 14,
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

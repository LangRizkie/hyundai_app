import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/theme.dart';

class PartnersDetailPageScreen extends StatefulWidget {
  const PartnersDetailPageScreen({
    super.key,
    required this.tag,
    required this.title,
    required this.description,
    required this.image,
    required this.deals,
  });

  final String tag;
  final String title;
  final String description;
  final String image;
  final int deals;

  @override
  State<PartnersDetailPageScreen> createState() =>
      _PartnersDetailPageScreenState();
}

class _PartnersDetailPageScreenState extends State<PartnersDetailPageScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: const CustomAppBar(),
      child: Column(
        children: [
          Hero(
            tag: widget.tag,
            child: heroCard(),
          ),
          // tabs(),
        ],
      ),
    );
  }

  heroCard() {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Gap(
                gap: 8,
                direction: Axis.vertical,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Gap(
                    gap: 4,
                    children: [
                      const Icon(
                        Icons.confirmation_number_outlined,
                        color: Palette.primaryColor,
                        size: 12,
                      ),
                      Text(
                        "${widget.deals} Deals",
                        style: const TextStyle(
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
      ),
    );
  }

  tabs() {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          labelPadding: EdgeInsets.zero,
          indicatorColor: Palette.primaryColor,
          labelColor: Palette.primaryColor,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: "Deals"),
            Tab(text: "Freebies"),
            Tab(text: "FAQ"),
            Tab(text: "Download"),
          ],
        ),
        TabBarView(
          controller: tabController,
          children: const [
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ],
    );
  }
}

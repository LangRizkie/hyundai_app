import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/homepage/carlist.dart';
import 'package:hyundai_app/components/homepage/partner.dart';
import 'package:hyundai_app/components/homepage/profile.dart';
import 'package:hyundai_app/components/homepage/services.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/global.dart';
import 'package:hyundai_app/modules/theme.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
    Global.refreshBackgroundColor = Palette.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const CustomAppBar(
        isMain: true,
        title: "MyHyundai Indonesia",
      ),
      child: SafeArea(
        child: Column(
          children: [
            const ProfileComponent(),
            Container(
              color: Palette.backgroundColor,
              child: Column(
                children: const [
                  PartnerComponent(),
                  CarListComponent(),
                ],
              ),
            ),
            const ServicesComponent()
          ],
        ),
      ),
    );
  }
}

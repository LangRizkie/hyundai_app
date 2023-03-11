import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/homepage/advertisement.dart';
import 'package:hyundai_app/components/homepage/carlist.dart';
import 'package:hyundai_app/components/homepage/collect_coupons.dart';
import 'package:hyundai_app/components/homepage/lifestyle_benefit.dart';
import 'package:hyundai_app/components/homepage/our_partner.dart';
import 'package:hyundai_app/components/homepage/partner.dart';
import 'package:hyundai_app/components/homepage/partner_deals.dart';
import 'package:hyundai_app/components/homepage/profile.dart';
import 'package:hyundai_app/components/homepage/services.dart';
import 'package:hyundai_app/components/homepage/whats_on.dart';
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
    Global.canRefresh = true;
    Global.refreshBackgroundColor = Palette.primaryColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: const CustomAppBar(
        isMain: true,
        title: "MyHyundai Indonesia",
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(bottom: 32),
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
                const ServicesComponent(),
                const AdvertisementComponent(),
                const PartnerDealsComponent(),
                const LifeStyleBenefitComponent(),
                const OurPartnerComponent(),
                const CollectCouponComponent(),
                const WhatsOnComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

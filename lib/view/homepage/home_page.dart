import "package:flutter/material.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/customization/custom_bottomsheet.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/customization/custom_list_icon_button.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/homepage/advertisement.dart";
import "package:hyundai_app/components/homepage/carlist.dart";
import "package:hyundai_app/components/homepage/collect_coupons.dart";
import "package:hyundai_app/components/homepage/lifestyle_benefit.dart";
import "package:hyundai_app/components/homepage/our_partner.dart";
import "package:hyundai_app/components/homepage/partner.dart";
import "package:hyundai_app/components/homepage/partner_deals.dart";
import "package:hyundai_app/components/homepage/profile.dart";
import "package:hyundai_app/components/homepage/services.dart";
import "package:hyundai_app/components/homepage/whats_on.dart";
import "package:hyundai_app/components/labeled_textformfield.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/theme.dart";

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      refreshColor: Palette.primaryColor,
      appBar: CustomAppBar(
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
                  child: const Column(
                    children: [
                      CarListComponent(),
                      PartnerComponent(),
                    ],
                  ),
                ),
                const ServicesComponent(),
                const AdvertisementComponent(),
                const PartnerDealsComponent(),
                const LifeStyleBenefitComponent(),
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
                        onPressed: onInputPromoCode,
                        label: "Input Promo Code",
                        useBottomBorder: false,
                        color: Colors.white,
                        backgroundColor: Palette.primaryColor,
                        suffixIconColor: Colors.white,
                      ),
                    ],
                  ),
                ),
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

  onInputPromoCode() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => CustomBottomSheet(
        title: "Promo Code",
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Column(
                children: [
                  LabeledTextFormField(
                    label: "Input Promo Code here",
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Palette.backgroundColor,
                        border: InputBorder.none,
                        hintText: "Input promo code",
                      ),
                    ),
                  ),
                  CustomButton(
                    label: "Validate",
                    width: double.infinity,
                    textColor: Colors.white,
                    buttonColor: Palette.primaryColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

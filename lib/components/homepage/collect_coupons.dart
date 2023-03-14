import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/customization/custom_list_icon_button.dart';
import 'package:hyundai_app/modules/route.dart';
import 'package:hyundai_app/modules/theme.dart';

class CollectCouponComponent extends StatefulWidget {
  const CollectCouponComponent({Key? key}) : super(key: key);

  @override
  State<CollectCouponComponent> createState() => _CollectCouponComponentState();
}

class _CollectCouponComponentState extends State<CollectCouponComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Collect your coupons",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            ),
          ),
          const Text(
            "While supporting great cause with our community.",
            style: TextStyle(
              fontFamily: Constant.fontFamilyText,
              fontSize: 16,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 24),
            child: CustomListIconButton(
              onPressed: () => Modular.to.pushNamed(Screens.challenges),
              label: "See all challenges",
              useBottomBorder: false,
              color: Colors.white,
              backgroundColor: Palette.primaryColor,
              suffixIconColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

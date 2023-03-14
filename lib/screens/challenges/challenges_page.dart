import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/customization/custom_bottomsheet.dart';
import 'package:hyundai_app/components/customization/custom_list_icon_button.dart';
import 'package:hyundai_app/components/input_dropdown.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/theme.dart';
import 'package:hyundai_app/screens/detail/detail_page.dart';

class ChallengesPageScreen extends StatefulWidget {
  const ChallengesPageScreen({super.key});

  @override
  State<ChallengesPageScreen> createState() => _ChallengesPageScreenState();
}

class _ChallengesPageScreenState extends State<ChallengesPageScreen> {
  String filter = "Semua";

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: const CustomAppBar(
        title: "Voucher",
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            color: Colors.white,
            child: Center(
              child: InputDropdown(
                onPressed: onPressedFilter,
                placeholder: "Semua",
                color: Palette.backgroundColor,
                value: filter,
              ),
            ),
          ),
          Flexible(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1 / 1.44,
              padding: const EdgeInsets.all(16),
              children: List.generate(12, (index) => card(index)),
            ),
          ),
        ],
      ),
    );
  }

  card(int index) {
    return ScaleTap(
      onPressed: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (ctx, a, b) => DetailPageScreen(
            tag: index,
            title: "Ismaya Group",
            image: 'https://via.placeholder.com/160x160',
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: index,
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                  color: Colors.black12,
                  image: DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/160x160'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "ISMAYA Group",
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
      ),
    );
  }

  onPressedFilter() {
    const salute = [
      "Semua",
      "ISMAYA Group",
      "Garuda Indonesia",
      "Cashback Parking",
      "Marriott Bonvoy"
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: "Filter",
        children: List.generate(
          salute.length,
          (index) => CustomListIconButton(
            label: salute[index],
            onPressed: () {
              Modular.to.pop();
              setState(() => filter = salute[index]);
            },
            suffixIcon: filter == salute[index] ? Icons.check_circle : null,
            suffixIconColor:
                filter == salute[index] ? Palette.secondaryColor : null,
          ),
        ),
      ),
    );
  }
}

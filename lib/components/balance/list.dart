import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class ListComponent extends StatefulWidget {
  const ListComponent({super.key});

  @override
  State<ListComponent> createState() => _ListComponentState();
}

class _ListComponentState extends State<ListComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) => card()),
        ),
      ),
    );
  }

  card() {
    return ScaleTap(
      scaleMinValue: 0.99,
      onPressed: () => Modular.to.pushNamed(Screens.balanceHistory),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Palette.backgroundSecondaryColor,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(
              gap: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.assignment_ind_outlined),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Membership Reward",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "28 Dec 2022 11:14",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Text(
              "+20.000",
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/modules/theme.dart";

class SummaryComponent extends StatefulWidget {
  const SummaryComponent({super.key});

  @override
  State<SummaryComponent> createState() => _SummaryComponentState();
}

class _SummaryComponentState extends State<SummaryComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Palette.backgroundSecondaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Gap(
              gap: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.blur_circular),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Coins Balance",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "600.000",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Gap(
              gap: 12,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.group_add_outlined),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Referral",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "3",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
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

import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/theme.dart";

class BalanceHistoryPageScreen extends StatefulWidget {
  const BalanceHistoryPageScreen({super.key});

  @override
  State<BalanceHistoryPageScreen> createState() =>
      _BalanceHistoryPageScreenState();
}

class _BalanceHistoryPageScreenState extends State<BalanceHistoryPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: CustomAppBar(
        title: "Transaction Detail",
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 24, bottom: 12),
                      child: const Icon(Icons.assignment_ind_outlined),
                    ),
                    const Gap(
                      gap: 2,
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Membership Reward",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Top Up",
                          style: TextStyle(
                            fontFamily: Constant.fontFamilyText,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 1,
                      color: Palette.backgroundColor,
                    ),
                  ),
                ),
                child: const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Amount",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "20.000",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                child: Gap(
                  gap: 8,
                  direction: Axis.vertical,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Transaction No.",
                          style: TextStyle(
                            fontFamily: Constant.fontFamilyText,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        ScaleTap(
                          onPressed: () {},
                          child: const Gap(
                            gap: 4,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "TOP00004407VUJ",
                                style: TextStyle(
                                  fontFamily: Constant.fontFamilyText,
                                  fontSize: 12,
                                ),
                              ),
                              Icon(
                                Icons.copy,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            fontFamily: Constant.fontFamilyText,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "28 Dec 2022 11:14",
                          style: TextStyle(
                            fontFamily: Constant.fontFamilyText,
                            fontSize: 12,
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
      ),
    );
  }
}

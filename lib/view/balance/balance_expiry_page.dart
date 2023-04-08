import 'package:flutter/material.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/expandable.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/theme.dart';

class BalanceExpiryPageScreen extends StatefulWidget {
  const BalanceExpiryPageScreen({super.key});

  @override
  State<BalanceExpiryPageScreen> createState() =>
      _BalanceExpiryPageScreenState();
}

class _BalanceExpiryPageScreenState extends State<BalanceExpiryPageScreen> {
  int? activeIndex;

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: CustomAppBar(
        title: "Expiry",
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Gap(
          gap: 8,
          direction: Axis.vertical,
          children: [
            Expandable(
              title: "2020",
              onPressed: () => setState(
                () => activeIndex = activeIndex != null ? 1 : null,
              ),
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    16,
                  ),
                  child: Gap(
                    gap: 8,
                    direction: Axis.vertical,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        color: Palette.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "August",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "-10 Coins",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        color: Palette.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "September",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "-10 Coins",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expandable(
              title: "2021",
              onPressed: () => setState(
                () => activeIndex = activeIndex != null ? 1 : null,
              ),
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 0,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Gap(
                    gap: 8,
                    direction: Axis.vertical,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        color: Palette.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "August",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "-10 Coins",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        color: Palette.backgroundColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "September",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "-10 Coins",
                              style: TextStyle(
                                fontFamily: Constant.fontFamilyText,
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

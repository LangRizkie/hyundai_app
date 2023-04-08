import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/balance/summary.dart';
import 'package:hyundai_app/components/filter.dart';
import 'package:hyundai_app/components/balance/list.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/modules/route.dart';

class BalancePageScreen extends StatefulWidget {
  const BalancePageScreen({super.key});

  @override
  State<BalancePageScreen> createState() => _BalancePageScreenState();
}

class _BalancePageScreenState extends State<BalancePageScreen> {
  final filters = ["All", "Referral"];
  String activeFilter = "All";

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBar(
        title: "Balance History",
        actions: [
          IconButton(
            icon: const Icon(Icons.av_timer),
            color: Colors.black,
            onPressed: () => Modular.to.pushNamed(Screens.balanceExpiry),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Gap(
              gap: 16,
              direction: Axis.vertical,
              children: [
                const SummaryComponent(),
                Filter(
                  tags: filters,
                  activeFilter: activeFilter,
                  onTagPressed: (value) => setState(() => activeFilter = value),
                ),
              ],
            ),
          ),
          const ListComponent(),
        ],
      ),
    );
  }
}

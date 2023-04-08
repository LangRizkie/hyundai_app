import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:hyundai_app/components/customization/custom_app_bar.dart';
import 'package:hyundai_app/components/customization/custom_bottomsheet.dart';
import 'package:hyundai_app/components/customization/custom_list_icon_button.dart';
import 'package:hyundai_app/components/layout.dart';
import 'package:hyundai_app/components/my_car/list.dart';
import 'package:hyundai_app/components/my_car/status.dart';
import 'package:hyundai_app/modules/theme.dart';

class MyCarPageScreen extends StatefulWidget {
  const MyCarPageScreen({super.key});

  @override
  State<MyCarPageScreen> createState() => _MyCarPageScreenState();
}

class _MyCarPageScreenState extends State<MyCarPageScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBar(
        title: "My Car",
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_phone_outlined,
              color: Colors.black,
            ),
            onPressed: onPressedCustomerCare,
          )
        ],
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Palette.primaryColor,
          labelColor: Palette.primaryColor,
          unselectedLabelColor: Colors.black,
          tabs: const [
            Tab(text: "My Car"),
            Tab(text: "Registration Status"),
          ],
        ),
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          const MyCarListComponent(),
          MyCarStatusComponent(
            onPressedCustomerCare: onPressedCustomerCare,
          ),
        ],
      ),
    );
  }

  onPressedCustomerCare() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: "myHyundai Customer Care",
        children: [
          CustomListIconButton(
            prefixIcon: Icons.phone_outlined,
            label: "Call Customer Care",
            onPressed: () {
              Modular.to.pop();
            },
          ),
          CustomListIconButton(
            prefixIcon: FontAwesome.whatsapp,
            label: "WhatsApp Customer Care",
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ],
      ),
    );
  }
}

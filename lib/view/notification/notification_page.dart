import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/customization/custom_bottomsheet.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/customization/custom_list_icon_button.dart";
import "package:hyundai_app/components/filter.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/global.dart";
import "package:hyundai_app/modules/theme.dart";
import "package:iconify_flutter/iconify_flutter.dart";
import "package:iconify_flutter/icons/mdi.dart";
import "package:syncfusion_flutter_datepicker/datepicker.dart";

class NotificationPageScreen extends StatefulWidget {
  const NotificationPageScreen({super.key});

  @override
  State<NotificationPageScreen> createState() => _NotificationPageScreenState();
}

class _NotificationPageScreenState extends State<NotificationPageScreen> {
  final filters = [
    "All",
    "Promo",
    "Coins",
    "Campaign",
    "Service & Accessories",
    "daily Check-in"
  ];

  final sorts = ["Oldest", "Latest", "Read", "Unread"];

  String activeFilter = "All";
  String activeSort = "Latest";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBar(
        title: "Notification Center",
        actions: [
          IconButton(
            icon: const Iconify(Mdi.sort_bool_descending_variant),
            color: Colors.black,
            onPressed: onPressedSort,
          ),
          IconButton(
            icon: const Iconify(Mdi.calendar),
            color: Colors.black,
            onPressed: onPressedCalendar,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.white,
            child: Filter(
              tags: filters,
              activeFilter: activeFilter,
              onTagPressed: (value) => setState(() => activeFilter = value),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  card(),
                  card(isPrimary: false),
                  card(isPrimary: false),
                  card(),
                  card(isPrimary: false),
                  card(isPrimary: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  onPressedSort() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: "Sort",
        children: List.generate(
          sorts.length,
          (index) => CustomListIconButton(
            label: sorts[index],
            suffixIcon: null,
            customSuffixIcon: activeSort == sorts[index]
                ? const Iconify(
                    Mdi.check_circle,
                    size: 20,
                    color: Palette.secondaryColor,
                  )
                : null,
            onPressed: () {
              setState(() => activeSort = sorts[index]);
              Modular.to.pop();
            },
          ),
        ),
      ),
    );
  }

  onPressedCalendar() {
    // print(selectedDate);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        minimum: EdgeInsets.only(
          top: Global.underToolbarHeight,
        ),
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: CustomButton(
              label: "Close",
              textColor: Palette.primaryColor,
              onPressed: () {
                Modular.to.pop();
              },
            ),
            actions: [
              CustomButton(
                label: "Reset",
                textColor: Palette.primaryColor,
                onPressed: () {
                  Modular.to.pop();
                },
              ),
              CustomButton(
                label: "Submit",
                textColor: Palette.primaryColor,
                onPressed: () {
                  Modular.to.pop();
                },
              ),
            ],
          ),
          body: SfDateRangePicker(
            enableMultiView: true,
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            navigationDirection: DateRangePickerNavigationDirection.vertical,
          ),
        ),
      ),
    );
  }

  card({
    bool isPrimary = true,
    IconData? icon = Icons.campaign_outlined,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Palette.backgroundSecondaryColor,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isPrimary ? Palette.secondaryColor : Colors.black,
              ),
            ),
            child: Icon(
              icon,
              color: isPrimary ? Palette.secondaryColor : Colors.black,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Happy New Year 2023 from myHyundai Indonesia!",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isPrimary ? Palette.secondaryColor : Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 4,
                    bottom: 12,
                  ),
                  child: Text(
                    "We wish you an amazing year ahead and more exiting adventure with us!",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                      color: isPrimary ? Palette.secondaryColor : Colors.black,
                    ),
                  ),
                ),
                Text(
                  "01 Jan 2023 11:14",
                  style: TextStyle(
                    fontFamily: Constant.fontFamilyText,
                    fontSize: 10,
                    color: isPrimary ? Palette.secondaryColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

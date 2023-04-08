import "package:flutter/material.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/theme.dart";

class NotificationPageScreen extends StatefulWidget {
  const NotificationPageScreen({super.key});

  @override
  State<NotificationPageScreen> createState() => _NotificationPageScreenState();
}

class _NotificationPageScreenState extends State<NotificationPageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBar(
        title: "Notification Center",
      ),
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

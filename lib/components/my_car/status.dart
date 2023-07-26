import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/customization/custom_bottomsheet.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/customization/custom_card_car.dart";
import "package:hyundai_app/components/filter.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/my_car/empty.dart";
import "package:hyundai_app/components/tag.dart";
import "package:hyundai_app/modules/global.dart";
import "package:hyundai_app/modules/theme.dart";

class MyCarStatusComponent extends StatefulWidget {
  const MyCarStatusComponent({
    super.key,
    required this.onPressedCustomerCare,
  });

  final Function() onPressedCustomerCare;

  @override
  State<MyCarStatusComponent> createState() => _MyCarStatusComponentState();
}

class _MyCarStatusComponentState extends State<MyCarStatusComponent> {
  final haveCar = true;

  final filters = ["All", "Approved", "Pending"];
  String activeFilter = "All";

  @override
  Widget build(BuildContext context) {
    if (!haveCar) return const MyCarEmptyComponent();
    return list();
  }

  list() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Filter(
                tags: filters,
                activeFilter: activeFilter,
                onTagPressed: (value) => setState(() => activeFilter = value),
              ),
            ),
            CustomCardCar(
              image: "assets/images/ioniq.png",
              child: customCardCarSummary(),
            ),
          ],
        ),
      ),
    );
  }

  customCardCarSummary() {
    return Gap(
      gap: 8,
      direction: Axis.vertical,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "IONIQ 5",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Tag(
              value: "Pending",
              textColor: Colors.white,
              color: Palette.secondaryColor,
            )
          ],
        ),
        const Text(
          "EV 555 100K",
          style: TextStyle(
            fontFamily: Constant.fontFamilyText,
            fontSize: 14,
          ),
        ),
        Row(
          children: const [
            Expanded(
              child: Gap(
                gap: 4,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Vin Number",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "1234567890ABCDEF",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Gap(
                gap: 4,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Model Year",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "2021",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        TextFormField(
          keyboardType: TextInputType.multiline,
          readOnly: true,
          enabled: false,
          minLines: 1,
          maxLines: 3,
          initialValue: "Register Approved",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: "Notes",
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              fontSize: 14,
            ),
            fillColor: Palette.backgroundSecondaryColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ScaleTap(
            onPressed: onPressedMoreInformation,
            child: const Gap(
              gap: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_rounded,
                  size: 18,
                  color: Palette.primaryColor,
                ),
                Text(
                  "More Information",
                  style: TextStyle(
                    fontSize: 14,
                    color: Palette.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomButton(
          label: "Verify Car Ownership",
          width: double.infinity,
          textColor: Colors.white,
          buttonColor: Palette.primaryColor,
          onPressed: () {},
        ),
        CustomButton(
          label: "Contact Customer Service",
          width: double.infinity,
          textColor: Colors.white,
          buttonColor: Palette.secondaryColor,
          onPressed: widget.onPressedCustomerCare,
        ),
        CustomButton(
          label: "Cancel Registration",
          width: double.infinity,
          textColor: Colors.red,
          buttonColor: Colors.white,
          onPressed: () => Global.alert(
            context,
            title: "Cancel Registration",
            description: "Are you sure cancel this car registration?",
          ),
        ),
      ],
    );
  }

  onPressedMoreInformation() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => CustomBottomSheet(
        title: "More Information",
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text(
              "Your car registration is pending because there are some data that needs to be verified. Please contact customer care or click “Verify Car Ownership” button.",
              style: TextStyle(
                fontFamily: Constant.fontFamilyText,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

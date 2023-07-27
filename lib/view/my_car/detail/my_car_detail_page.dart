import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/customization/custom_bottomsheet.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/customization/custom_card_car.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class MyCarDetailPageScreen extends StatefulWidget {
  const MyCarDetailPageScreen({super.key});

  @override
  State<MyCarDetailPageScreen> createState() => _MyCarDetailPageScreenState();
}

class _MyCarDetailPageScreenState extends State<MyCarDetailPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppBar(
        title: "Car Detail",
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_book_outlined,
              color: Colors.black,
            ),
            onPressed: onPressedRegistrationData,
          )
        ],
      ),
      child: detail(),
    );
  }

  detail() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomCardCar(
              image: "assets/images/ioniq.png",
              child: customCardCarSummary(),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "Manual Book",
                    textColor: Palette.primaryColor,
                    buttonColor: Colors.white,
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    label: "Book Services",
                    textColor: Colors.white,
                    buttonColor: Palette.primaryColor,
                    onPressed: () {},
                  ),
                ),
              ],
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
        const Text(
          "B 1234 IDN",
          style: TextStyle(
            fontFamily: Constant.fontFamilyText,
            fontSize: 14,
            color: Palette.secondaryColor,
          ),
        ),
        const Text(
          "IONIQ 5",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        const Row(
          children: [
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
        const Row(
          children: [
            Expanded(
              child: Gap(
                gap: 4,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Engine Number",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "EM10KAB033AJ",
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
                    "Purchase Date",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "07 Jun 2020",
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
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: const Text(
            "Other Information",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(
              gap: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified,
                  size: 16,
                ),
                Text(
                  "Purchase Date",
                  style: TextStyle(
                    fontFamily: Constant.fontFamilyText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              "07 Jun 2020",
              style: TextStyle(
                fontFamily: Constant.fontFamilyText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(
              gap: 4,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.verified,
                  size: 16,
                ),
                Text(
                  "Car Registration Letter",
                  style: TextStyle(
                    fontFamily: Constant.fontFamilyText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              "06 Jun 2020",
              style: TextStyle(
                fontFamily: Constant.fontFamilyText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  onPressedRegistrationData() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isScrollControlled: true,
      builder: (context) => CustomBottomSheet(
        title: "Registration Data",
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Gap(
              gap: 16,
              direction: Axis.vertical,
              children: [
                const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "License Plate Number",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "B 1234 IDN",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Car Registration Letter (STNK/STCK) Name",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Annisa Salsabilla",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Car Registration Letter (STNK/STCK) Valid Date",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "20 September 2024",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Car Registration Letter (STNK/STCK) Number",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "098765555511222",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    const Text(
                      "Car Registration Letter Photo",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://via.placeholder.com/344x200",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                CustomButton(
                  label: "Update Data",
                  width: double.infinity,
                  textColor: Colors.white,
                  buttonColor: Palette.primaryColor,
                  onPressed: () {
                    Modular.to.pop();
                    Modular.to.pushNamed(Screens.myCarUpdate);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

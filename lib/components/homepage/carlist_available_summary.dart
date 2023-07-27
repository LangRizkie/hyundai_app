import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/bluelink_status.dart";
import "package:hyundai_app/components/customization/custom_bottomsheet.dart";
import "package:hyundai_app/components/customization/custom_list_icon_button.dart";
import "package:hyundai_app/modules/generic.dart";
import "package:hyundai_app/modules/theme.dart";
import "package:iconify_flutter/iconify_flutter.dart";
import "package:iconify_flutter/icons/mdi.dart";

class CarListAvailableSummary extends StatefulWidget {
  const CarListAvailableSummary({
    Key? key,
    required this.car,
  }) : super(key: key);

  final Map<String, dynamic> car;

  @override
  State<CarListAvailableSummary> createState() =>
      _CarListAvailableSummaryState();
}

class _CarListAvailableSummaryState extends State<CarListAvailableSummary> {
  late CarListSummaryType car;

  @override
  void initState() {
    car = CarListSummaryType.fromJson(widget.car);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: onPressedCar,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Palette.backgroundSecondaryColor,
          ),
        ),
        child: SizedBox(
          width: 320,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Palette.backgroundColor,
                        radius: 20,
                        child: Icon(
                          Icons.directions_car_outlined,
                          color: Palette.primaryColor,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Ioniq 5",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Bluelink",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    child: const BlueLinkStatus(
                                      isConnected: true,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  const Iconify(
                                    Mdi.fuel_station,
                                    size: 14,
                                    color: Palette.primaryColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressedCar() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => CustomBottomSheet(
        title: "IONIQ 5",
        children: [
          CustomListIconButton(
            prefixIcon: Icons.abc,
            label: "BlueLink",
            onPressed: () {},
          ),
          CustomListIconButton(
            prefixIcon: Icons.car_repair_outlined,
            label: "Car Detail",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/bluelink_status.dart';
import 'package:hyundai_app/components/percentage.dart';
import 'package:hyundai_app/modules/generic.dart';
import 'package:hyundai_app/modules/theme.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
      onPressed: () {},
      child: Container(
        margin: const EdgeInsets.only(
          left: 16,
        ),
        child: Container(
          margin: const EdgeInsets.only(
            bottom: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Palette.backgroundSecondaryColor,
            ),
          ),
          child: SizedBox(
            width: 320,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Palette.backgroundColor,
                              radius: 24,
                              child: Icon(
                                Icons.directions_car_outlined,
                                color: Palette.primaryColor,
                              ),
                            ),
                            Flexible(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 16,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        bottom: 4,
                                      ),
                                      child: const Text(
                                        'Ioniq 5',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 8,
                                      children: const [
                                        Text(
                                          'Bluelink',
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                        BlueLinkStatus(
                                          isConnected: true,
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
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Icon(
                          Icons.chevron_right,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Percentage(
                        percentage: car.percentage,
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: StepProgressIndicator(
                            totalSteps: 10,
                            currentStep: (car.percentage / 10).round(),
                            size: 24,
                            padding: 1,
                            unselectedColor: Colors.white,
                            roundedEdges: const Radius.circular(4),
                            selectedGradientColor: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white,
                                Palette.primaryColor,
                              ],
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        car.isElectricVehicle
                            ? Icons.battery_6_bar
                            : Icons.local_gas_station,
                        color: Palette.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

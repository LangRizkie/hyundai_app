import "package:flutter/material.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/bluelink_status.dart";
import "package:hyundai_app/modules/theme.dart";

class CarListEmpty extends StatefulWidget {
  const CarListEmpty({Key? key}) : super(key: key);

  @override
  State<CarListEmpty> createState() => _CarListEmptyState();
}

class _CarListEmptyState extends State<CarListEmpty> {
  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
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
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    "Car not found",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: const [
                                    Text(
                                      "Bluelink",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    BlueLinkStatus(),
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
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: Colors.black12,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4,
                      children: const [
                        Icon(
                          Icons.car_repair_outlined,
                          color: Palette.primaryColor,
                        ),
                        Text(
                          "Add Car",
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

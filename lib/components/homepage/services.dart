import "package:card_swiper/card_swiper.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:flutter_scale_tap/flutter_scale_tap.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/title_route.dart";
import "package:hyundai_app/modules/dummy.dart";
import "package:hyundai_app/modules/generic.dart";
import "package:hyundai_app/modules/theme.dart";

class ServicesComponent extends StatefulWidget {
  const ServicesComponent({Key? key}) : super(key: key);

  @override
  State<ServicesComponent> createState() => _ServicesComponentState();
}

class _ServicesComponentState extends State<ServicesComponent> {
  final SwiperController swiperController = SwiperController();

  final List data = Dummy.hyundaiServicesMenu;
  int currentIndex = 0;
  int maxPerColumn = 4;

  onIndexChanged(int value) => setState(() => currentIndex = value);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const TitleRoute(
            title: "One-Stop Hyundai",
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(
                  width: 0,
                  color: Palette.backgroundSecondaryColor,
                ),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  data.length,
                  (index) => ScaleTap(
                    onPressed: () => MenuType.fromJson(data[index]).route != ""
                        ? Modular.to
                            .pushNamed(MenuType.fromJson(data[index]).route)
                        : {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / maxPerColumn,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(
                          right: index == data.length - 1
                              ? BorderSide.none
                              : const BorderSide(
                                  width: 0,
                                  color: Palette.backgroundSecondaryColor,
                                ),
                        ),
                      ),
                      child: Gap(
                        gap: 12,
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            IconData(
                              MenuType.fromJson(data[index]).icon ?? 0,
                              fontFamily: "MaterialIcons",
                            ),
                            color: Palette.primaryColor,
                            size: 24,
                          ),
                          Text(
                            MenuType.fromJson(data[index]).label,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

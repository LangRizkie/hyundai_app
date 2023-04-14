import "package:card_swiper/card_swiper.dart";
import "package:flutter/material.dart";
import "package:flutter_modular/flutter_modular.dart";
import "package:hyundai_app/components/customization/custom_dropdown.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/dummy.dart";
import "package:hyundai_app/modules/generic.dart";
import "package:hyundai_app/modules/route.dart";
import "package:hyundai_app/modules/theme.dart";

class OnBoardingPageScreen extends StatefulWidget {
  const OnBoardingPageScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingPageScreen> createState() => _OnBoardingPageScreenState();
}

class _OnBoardingPageScreenState extends State<OnBoardingPageScreen> {
  final List lang = Dummy.languages;
  final List data = Dummy.onboardingData;
  final SwiperController swiperController = SwiperController();

  late String selectedLanguage;
  int currentIndex = 0;

  @override
  void initState() {
    selectedLanguage = ListType.fromJson(lang.first).label;

    super.initState();
  }

  onLanguageChanged(String value) => setState(() => selectedLanguage = value);
  onIndexChanged(int value) => setState(() => currentIndex = value);

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      resizeToAvoidBottomInset: false,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              swiper(
                data: data,
                itemCount: data.length,
                currentIndex: currentIndex,
                controller: swiperController,
                onIndexChanged: onIndexChanged,
              ),
              content(
                data: data,
                currentIndex: currentIndex,
              ),
              navigation(
                itemCount: data.length,
                currentIndex: currentIndex,
                controller: swiperController,
              ),
            ],
          ),
          Positioned(
            top: 48,
            right: 24,
            child: CustomDropdown(
              items: lang,
              value: selectedLanguage,
              onChanged: onLanguageChanged,
            ),
          ),
        ],
      ),
    );
  }

  swiper({
    required List data,
    required int itemCount,
    required int currentIndex,
    required SwiperController controller,
    required Function(int index) onIndexChanged,
  }) {
    return SizedBox(
      height: 496,
      child: Swiper(
        controller: controller,
        itemCount: data.length,
        loop: false,
        onIndexChanged: onIndexChanged,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://via.placeholder.com/376x496",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  content({
    required List data,
    required int currentIndex,
  }) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(
          16,
          32,
          16,
          0,
        ),
        child: Gap(
          gap: 8,
          direction: Axis.vertical,
          children: [
            Text(
              ListType.fromJson(data[currentIndex]).label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                ListType.fromJson(data[currentIndex]).value,
                style: const TextStyle(
                  fontFamily: Constant.fontFamilyText,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container navigation({
    required int itemCount,
    required int currentIndex,
    required SwiperController controller,
  }) {
    final isLastIndex = currentIndex == (itemCount - 1);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(
        16,
        16,
        16,
        MediaQuery.of(context).viewPadding.bottom,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () =>
                controller.move(isLastIndex ? currentIndex - 1 : itemCount - 1),
            child: Text(
              isLastIndex ? "Back" : "Skip",
              style: const TextStyle(
                color: Palette.primaryColor,
              ),
            ),
          ),
          Gap(
            gap: 8,
            direction: Axis.horizontal,
            children: List.generate(
              itemCount,
              (index) => dots(
                isActive: currentIndex == index,
                onTap: () => controller.move(index),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => currentIndex == itemCount - 1
                ? Modular.to.navigate(Screens.login)
                : controller.next(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Palette.primaryColor),
            ),
            child: Text(isLastIndex ? "Get Started" : "Next"),
          ),
        ],
      ),
    );
  }

  GestureDetector dots({
    bool isActive = false,
    required Function() onTap,
  }) {
    final activeColor =
        isActive ? Palette.secondaryColor : Palette.backgroundSecondaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activeColor,
        ),
      ),
    );
  }
}

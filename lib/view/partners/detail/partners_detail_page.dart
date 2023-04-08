import "package:flutter/material.dart";
import "package:hyundai_app/components/customization/custom_app_bar.dart";
import "package:hyundai_app/components/customization/custom_button.dart";
import "package:hyundai_app/components/expandable.dart";
import "package:hyundai_app/components/gap.dart";
import "package:hyundai_app/components/layout.dart";
import "package:hyundai_app/modules/theme.dart";

class PartnersDetailPageScreen extends StatefulWidget {
  const PartnersDetailPageScreen({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.deals,
  });

  final String title;
  final String description;
  final String image;
  final int deals;

  @override
  State<PartnersDetailPageScreen> createState() =>
      _PartnersDetailPageScreenState();
}

class _PartnersDetailPageScreenState extends State<PartnersDetailPageScreen>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Layout(
      canRefresh: false,
      appBar: CustomAppBar(),
      child: Column(
        children: [
          heroCard(),
          tabs(),
        ],
      ),
    );
  }

  heroCard() {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Gap(
                gap: 8,
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Gap(
                    gap: 4,
                    children: [
                      const Icon(
                        Icons.confirmation_number_outlined,
                        color: Palette.primaryColor,
                        size: 12,
                      ),
                      Text(
                        "${widget.deals} Deals",
                        style: const TextStyle(
                          fontFamily: Constant.fontFamilyText,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TabBar(
              controller: tabController,
              labelPadding: EdgeInsets.zero,
              indicatorColor: Palette.primaryColor,
              labelColor: Palette.primaryColor,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(text: "Deals"),
                Tab(text: "Freebies"),
                Tab(text: "FAQ"),
                Tab(text: "Download"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  tabs() {
    return Expanded(
      child: TabBarView(
        controller: tabController,
        children: [
          dealsTab(),
          freebiesTab(),
          faqTabs(),
          downloadTab(),
        ],
      ),
    );
  }

  dealsTab() {
    int length = 12;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1 / 1.32,
      padding: const EdgeInsets.all(16),
      children: List.generate(
        length,
        (index) => Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "challenges detail page $index",
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://via.placeholder.com/160x160",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "ISMAYA Voucher IDR 100.000 Coupons Edition",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "100.000 Coins",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  freebiesTab() {
    int length = 12;

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1 / 1.32,
      padding: const EdgeInsets.all(16),
      children: List.generate(
        length,
        (index) => Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "challenges detail page $index",
                child: Container(
                  width: double.infinity,
                  height: 160,
                  decoration: const BoxDecoration(
                    color: Colors.black12,
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://via.placeholder.com/160x160",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: const Gap(
                  gap: 4,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "ISMAYA Voucher IDR 100.000 Coupons Edition",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "0 Coins",
                      style: TextStyle(
                        fontFamily: Constant.fontFamilyText,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Palette.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  faqTabs() {
    int? activeIndex;
    String description = [
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
      "The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,",
      "as opposed to using "Content here, content here", making it look like readable English.",
    ].join(" ");

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Gap(
        gap: 16,
        direction: Axis.vertical,
        children: [
          Expandable(
            title: "What if the voucher code can"t be used",
            onPressed: () => setState(
              () => activeIndex = activeIndex != null ? 1 : null,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  0,
                  16,
                  16,
                ),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontFamily: Constant.fontFamilyText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  downloadTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Gap(
        gap: 16,
        direction: Axis.vertical,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/google-play-badge.png",
                  width: 72,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Download ISMAYA Group Apps from Google Play",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 32),
                      child: CustomButton(
                        label: "Download",
                        width: 112,
                        suffixIcon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 16,
                        ),
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
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/app-store-badge.png",
                  width: 72,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        "Download ISMAYA Group Apps from App Store",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 32),
                      child: CustomButton(
                        label: "Download",
                        width: 112,
                        suffixIcon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 16,
                        ),
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
        ],
      ),
    );
  }
}

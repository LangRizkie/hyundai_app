import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/customization/custom_button.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/modules/theme.dart';

class DetailPageScreen extends StatefulWidget {
  const DetailPageScreen({
    super.key,
    required this.tag,
    required this.title,
    required this.image,
  });

  final String tag;
  final String title;
  final String image;

  @override
  State<DetailPageScreen> createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen>
    with TickerProviderStateMixin {
  late ScrollController scrollController = ScrollController();
  late TabController tabController = TabController(length: 2, vsync: this);

  bool status = true;
  double top = 0;

  double get expandedHeight => 240;

  double get minExtent => 56 + 30;

  double get maxExtent => expandedHeight + 30;

  bool get shrink =>
      scrollController.hasClients &&
      scrollController.offset > (200 - kToolbarHeight);

  @override
  void initState() {
    scrollController.addListener(scrollControllerListener);
    scrollController.addListener(() => setState(() {}));
    if (top <= 0) top = expandedHeight + 30;
    super.initState();
  }

  scrollControllerListener() {
    if (shrink != status) {
      setState(() => status = shrink);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: expandedHeight,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: shrink ? Colors.black : Colors.white,
                  ),
                  onPressed: () => Modular.to.pop(),
                ),
                flexibleSpace: layoutBuilder(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: top / 2,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  TabBar(
                    controller: tabController,
                    indicatorColor: Palette.primaryColor,
                    labelColor: Palette.primaryColor,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(text: "Information"),
                      Tab(text: "T & C"),
                    ],
                  ),
                ),
              ),
              // the height is for testing purpose
              SliverToBoxAdapter(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(bottom: 48),
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      Center(
                        child: Text("It's cloudy here"),
                      ),
                      Center(
                        child: Text("It's rainy here"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          summaryContainer(minExtent: minExtent, maxExtent: maxExtent),
          redeemContainer(),
        ],
      ),
    );
  }

  layoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        top = constraints.biggest.height;

        return FlexibleSpaceBar(
          centerTitle: true,
          expandedTitleScale: 1,
          stretchModes: const [StretchMode.blurBackground],
          title: AnimatedOpacity(
            opacity: double.parse(
              ((constraints.biggest.height - maxExtent) /
                      (minExtent - maxExtent))
                  .toStringAsFixed(2),
            ),
            duration: const Duration(milliseconds: 100),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          background: Hero(
            tag: widget.tag,
            child: Container(
              width: double.infinity,
              height: expandedHeight,
              decoration: BoxDecoration(
                color: Palette.backgroundSecondaryColor,
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  summaryContainer({
    required double minExtent,
    required double maxExtent,
  }) {
    double opacity = double.parse(
      ((top - minExtent) / (maxExtent - minExtent)).toStringAsFixed(2),
    );

    if (top <= 0) top = expandedHeight + 30;
    if (opacity < 0) opacity = 1;

    return Visibility(
      visible: opacity > 0,
      child: Positioned(
        top: top - 30,
        child: AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 100),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width - 32,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Palette.backgroundSecondaryColor,
                ),
              ),
              child: const Gap(
                gap: 8,
                direction: Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ISMAYA Group",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "ISMAYA Voucher IDR 100.000 Coupons Edition",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Gap(
                    gap: 24,
                    children: [
                      Gap(
                        gap: 0,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            "Redeem",
                            style: TextStyle(
                              fontFamily: Constant.fontFamilyText,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "20.000 Coins",
                            style: TextStyle(
                              fontFamily: Constant.fontFamilyText,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Palette.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(
                        gap: 0,
                        direction: Axis.vertical,
                        children: [
                          Text(
                            "Deals Period",
                            style: TextStyle(
                              fontFamily: Constant.fontFamilyText,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "31 Dec 2024",
                            style: TextStyle(
                              fontFamily: Constant.fontFamilyText,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  redeemContainer() {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "20.000 Coins",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Palette.secondaryColor,
                    ),
                  ),
                  Text(
                    "Your coins 25.000",
                    style: TextStyle(
                      fontFamily: Constant.fontFamilyText,
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width * .24,
              label: "Redeem",
              textColor: Colors.white,
              buttonColor: Palette.primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

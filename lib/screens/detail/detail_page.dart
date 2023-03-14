import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hyundai_app/components/gap.dart';
import 'package:hyundai_app/modules/theme.dart';

class DetailPageScreen extends StatefulWidget {
  const DetailPageScreen({
    super.key,
    required this.tag,
    required this.title,
    required this.image,
  });

  final int tag;
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
  double average = 0;

  @override
  void initState() {
    scrollController.addListener(scrollControllerListener);
    super.initState();
  }

  scrollControllerListener() {
    if (shrink != status) {
      setState(() => status = shrink);
    }
  }

  double get minExtent => 56 + 30;

  double get maxExtent => 240 + 30;

  bool get shrink =>
      scrollController.hasClients &&
      scrollController.offset > (200 - kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          NestedScrollView(
            controller: scrollController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 240,
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
                // SliverToBoxAdapter(
                //   child: Container(
                //     width: MediaQuery.of(context).size.width - 16,
                //     padding: const EdgeInsets.all(16),
                //     child: Container(
                //       padding: const EdgeInsets.all(16),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         border: Border.all(
                //           color: Palette.backgroundSecondaryColor,
                //         ),
                //       ),
                //       child: const Gap(
                //         gap: 4,
                //         direction: Axis.vertical,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "ISMAYA Group",
                //             style: TextStyle(
                //               fontFamily: Constant.fontFamilyText,
                //               fontSize: 12,
                //             ),
                //           ),
                //           Text(
                //             "ISMAYA Voucher IDR 100.000 Coupons Edition",
                //             style: TextStyle(
                //               fontWeight: FontWeight.w500,
                //               fontSize: 20,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
              ];
            },
            body: TabBarView(
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
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Text("asdoiasoidjasd"),
            ),
          ),
        ],
      ),
    );
  }

  layoutBuilder() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
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
              height: 240,
              decoration: const BoxDecoration(
                color: Palette.backgroundSecondaryColor,
                image: DecorationImage(
                  image: NetworkImage('https://via.placeholder.com/160x160'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
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

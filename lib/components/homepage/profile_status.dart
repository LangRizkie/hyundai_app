import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/components/customization/custom_bottomsheet.dart';
import 'package:hyundai_app/modules/theme.dart';

class ProfileStatus extends StatefulWidget {
  const ProfileStatus({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  State<ProfileStatus> createState() => _ProfileStatusState();
}

class _ProfileStatusState extends State<ProfileStatus> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      bottom: (widget.height / 2) - 14,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            card(
              prefixIcon: Icons.contacts_outlined,
              suffixIcon: Icons.info_outline_rounded,
              title: 'Member',
              value: 'Blue +',
              onPressed: onPressedMember,
            ),
            card(
              prefixIcon: Icons.blur_circular,
              suffixIcon: Icons.chevron_right,
              title: 'Coins',
              value: '500.000',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget card({
    required IconData prefixIcon,
    required IconData suffixIcon,
    required String title,
    Function()? onPressed,
    String? value,
  }) {
    return ScaleTap(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.44,
        height: widget.height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
          color: Colors.white,
        ),
        child: SizedBox(
          height: widget.height,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      prefixIcon,
                      color: Palette.primaryColor,
                    ),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              value ?? '-',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Palette.primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                suffixIcon,
                color: Palette.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressedMember() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) => const CustomBottomSheet(
        title: "Member Info",
        children: [
          BulletedList(
            bullet: Text("\u2022"),
            listItems: [
              Text(
                  "Coin value equals to IDR value (i.e. 200,000 coins = 200,000 IDR)"),
              Text("You can earn more coins by signing up your Hyundai Car"),
              Text("You can redeem coins with our rewards (vouchers)"),
            ],
          ),
        ],
      ),
    );
  }
}

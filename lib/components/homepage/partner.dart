import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:hyundai_app/modules/helper.dart';
import 'package:hyundai_app/modules/theme.dart';

class PartnerComponent extends StatefulWidget {
  const PartnerComponent({Key? key}) : super(key: key);

  @override
  State<PartnerComponent> createState() => _PartnerComponentState();
}

class _PartnerComponentState extends State<PartnerComponent> {
  final int totalPartner = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            totalPartner,
            (index) => Container(
              margin: EdgeInsets.only(
                left: 16,
                right: index == (totalPartner - 1) ? 16 : 0,
              ),
              child: item(),
            ),
          ),
        ),
      ),
    );
  }

  Wrap item() {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          clipBehavior: Clip.none,
          children: [
            ScaleTap(
              onPressed: () {},
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/64x64',
                ),
              ),
            ),
            Positioned(
              top: -8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                color: Palette.secondaryColor,
                child: const Text(
                  'New',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            )
          ],
        ),
        Text(
          Helper.breakTwoWords('Hyundai Indonesia'),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

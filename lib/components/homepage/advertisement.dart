import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class AdvertisementComponent extends StatefulWidget {
  const AdvertisementComponent({Key? key}) : super(key: key);

  @override
  State<AdvertisementComponent> createState() => _AdvertisementComponentState();
}

class _AdvertisementComponentState extends State<AdvertisementComponent> {
  final SwiperController swiperController = SwiperController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      constraints: const BoxConstraints(
        maxHeight: 256,
      ),
      child: Swiper(
        controller: swiperController,
        itemCount: 3,
        loop: false,
        pagination: const SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://via.placeholder.com/376x256",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}

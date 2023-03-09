import 'package:flutter/material.dart';
import 'package:hyundai_app/components/title_route.dart';

class ServicesComponent extends StatefulWidget {
  const ServicesComponent({Key? key}) : super(key: key);

  @override
  State<ServicesComponent> createState() => _ServicesComponentState();
}

class _ServicesComponentState extends State<ServicesComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const [
          TitleRoute(
            title: 'Hyundai Services',
          ),
        ],
      ),
    );
  }
}

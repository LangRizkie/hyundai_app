import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hyundai_app/modules/generic.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.value,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  final Object value;
  final List<dynamic> items;
  final Function(String value)? onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        value: widget.value,
        items: widget.items
            .map(
              (e) => DropdownMenuItem(
                value: ListType.fromJson(e).label,
                child: Text(
                  ListType.fromJson(e).value,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (value) => widget.onChanged!(value.toString()),
        buttonStyleData: const ButtonStyleData(
          height: 40,
          width: 112,
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
          ),
          iconSize: 18,
        ),
        dropdownStyleData: const DropdownStyleData(
          width: 112,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

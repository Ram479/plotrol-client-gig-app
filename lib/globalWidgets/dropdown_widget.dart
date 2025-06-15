import 'package:flutter/material.dart';

class ReusableDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabelBuilder;
  final void Function(T?) onChanged;
  final String? hint;
  final double? fontSize;
  final Color? dropdownColor;
  final FontWeight? fontWeight;

  const ReusableDropdown({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.itemLabelBuilder,
    required this.onChanged,
    this.hint,
    this.fontSize,
    this.dropdownColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: true,
      value: selectedItem,
      hint: hint != null
          ? Text(
        hint!,
        style: TextStyle(fontSize: fontSize ?? 14),
      )
          : null,
      icon: const Icon(Icons.keyboard_arrow_down),
      dropdownColor: dropdownColor ?? Colors.white,
      items: items.map((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(
            itemLabelBuilder(value),
            style: TextStyle(
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

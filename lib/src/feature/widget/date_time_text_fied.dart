import 'package:flutter/material.dart';
import 'package:life_shared/life_shared.dart';

final class DateTimeTextFormField extends StatelessWidget {
  const DateTimeTextFormField({
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.onDateSelected,
    this.style,
    super.key,
  });

  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<DateTime> onDateSelected;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: true,
      textInputAction: TextInputAction.next,
      style: style,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.calendar_today),
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      onTap: () async => _selectedDateTime(context, controller),
    );
  }

  Future<void> _selectedDateTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final dateTimeModel = await DateTimePicker.selectedDateTime(context);
    if (dateTimeModel == null) return;
    controller.text = dateTimeModel.formattedText;
    onDateSelected.call(dateTimeModel.dateTime);
  }
}

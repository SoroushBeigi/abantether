import 'package:abantether/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final String? phoneNumber;
  final TextEditingController controller;

  const PhoneField(
      {required this.phoneNumber, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    controller.text = phoneNumber ?? '';
    return TextFormField(
      controller: controller,
      enabled: true,
      keyboardType: TextInputType.phone,
      style: TextStyle(
        color: Colors.grey.shade600,
      ),
      decoration: InputDecoration(
        labelText: phoneLabel,
        prefixIcon: const Icon(Icons.phone_iphone, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
        suffixIcon: const Icon(Icons.edit, color: Colors.grey),
        hintText: phoneHint,
      ),
    );
  }
}

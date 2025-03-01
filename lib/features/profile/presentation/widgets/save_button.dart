import 'package:abantether/core/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onPressed;
  const SaveButton({required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      icon: const Icon(
        Icons.save_outlined,
        color: Colors.white,
      ),
      label: const Text(
        saveChanges,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

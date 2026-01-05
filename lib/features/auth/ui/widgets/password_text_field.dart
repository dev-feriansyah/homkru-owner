import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasswordTextField extends HookWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.compareWith,
  });

  final TextEditingController controller;
  final TextEditingController? compareWith;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isVisible = useState(false);

    return TextFormField(
      cursorColor: colorScheme.outline,
      controller: controller,
      obscureText: !isVisible.value,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: colorScheme.outline,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: colorScheme.outlineVariant),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            isVisible.value = !isVisible.value;
          },
          icon: Icon(
            isVisible.value
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: colorScheme.outline,
            size: 20,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hintText is required';
        }

        if (compareWith != null && value != compareWith!.text) {
          return 'Passwords do not match';
        }

        return null;
      },
    );
  }
}

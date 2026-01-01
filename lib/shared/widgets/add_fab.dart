import 'package:flutter/material.dart';
import 'package:homekru_owner/core/theme/app_colors.dart';

class AddFab extends StatelessWidget {
  final void Function()? onPressed;

  const AddFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: appColors.primaryColor,
      elevation: 4,
      shape: CircleBorder(side: BorderSide(color: appColors.white, width: 1)),
      child: Center(
        child: Icon(Icons.add_rounded, color: appColors.white, size: 44),
      ),
    );
  }
}

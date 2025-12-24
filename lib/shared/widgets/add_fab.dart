import 'package:flutter/material.dart';
import 'package:homekru_owner/core/theme/theme_helper.dart';

class AddFab extends StatelessWidget {
  final void Function()? onPressed;

  const AddFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: appTheme.primaryColor,
      elevation: 4,
      shape: CircleBorder(side: BorderSide(color: appTheme.white, width: 1)),
      child: Center(
        child: Icon(Icons.add_rounded, color: appTheme.white, size: 44),
      ),
    );
  }
}

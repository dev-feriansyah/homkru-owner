import 'package:flutter/material.dart';
import 'package:homekru_owner/theme/theme_helper.dart';

class CommonFab extends StatelessWidget {
  final void Function()? onPressed;

  const CommonFab({super.key, required this.onPressed});

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

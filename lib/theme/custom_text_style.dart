import 'package:flutter/material.dart';
import 'package:homekru_owner/theme/theme_helper.dart';


extension on TextStyle {}

class CustomTextStyles {
  final BuildContext context;

  CustomTextStyles(this.context);

get font25White => theme.textTheme.displayMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontFamily:'LuckiestGuy', fontSize: 25);
}

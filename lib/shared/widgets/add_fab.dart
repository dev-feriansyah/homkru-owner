import 'package:flutter/material.dart';

class AddFab extends StatelessWidget {
  final void Function()? onPressed;

  const AddFab({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: colorScheme.primary,
      elevation: 4,
      shape: CircleBorder(side: BorderSide(color: colorScheme.onPrimary, width: 1)),
      child: Center(
        child: Icon(Icons.add_rounded, color: colorScheme.onPrimary, size: 44),
      ),
    );
  }
}

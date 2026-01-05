import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homekru_owner/core/theme/app_color_extension.dart';

class CustomToggleSwitch extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const CustomToggleSwitch({
    super.key,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch>
    with SingleTickerProviderStateMixin {
  late bool _isToggled;
  late AnimationController _animationController;
  late Animation<double> _thumbAnimation;

  @override
  void initState() {
    super.initState();
    _isToggled = widget.initialValue;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _thumbAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Set initial animation value based on initial state
    if (_isToggled) {
      _animationController.value = 1.0;
    } else {
      _animationController.value = 0.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isToggled = !_isToggled;
    });

    if (_isToggled) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    widget.onChanged?.call(_isToggled);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColorExtension;

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 48.w,
        height: 20.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r)),
        child: Stack(
          children: [
            // Track - Color changes based on toggle state
            Container(
              width: 48.w,
              height: 11.h,
              margin: EdgeInsets.only(top: 4.5.h),
              decoration: ShapeDecoration(
                color:
                    _isToggled
                        ? appColors.lightBlueThree
                        : colorScheme.outlineVariant,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
            // Animated Thumb
            AnimatedBuilder(
              animation: _thumbAnimation,
              builder: (context, child) {
                return Positioned(
                  left: _thumbAnimation.value * (48.w - 20.w),
                  child: Container(
                    width: 20.w,
                    height: 20.h,
                    decoration: ShapeDecoration(
                      color:
                          _isToggled
                              ? colorScheme.primary // Blue when active
                              : appColors.grey, // Gray when inactive
                      shape: const OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

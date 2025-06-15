import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/translation_extension.dart';
import '../../../../core/theme/cubit/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';

class ThemeSwitchTile extends StatefulWidget {
  const ThemeSwitchTile({super.key});

  @override
  State<ThemeSwitchTile> createState() => _ThemeSwitchTileState();
}

class _ThemeSwitchTileState extends State<ThemeSwitchTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 180,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.8,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDark = state.themeMode == ThemeMode.dark;
        if (isDark) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }

        return ListTile(
          leading: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value * 3.14159 / 180,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Icon(
                    isDark ? Icons.dark_mode : Icons.wb_sunny_rounded,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              );
            },
          ),
          title: Text('settings.dark_mode'.tr(context)),
          trailing: Switch(
            activeColor: AppColors.dark,
            activeTrackColor: AppColors.white,
            inactiveTrackColor: AppColors.dark,
            inactiveThumbColor: AppColors.white,
            value: isDark,
            onChanged: (_) {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        );
      },
    );
  }
}

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/profile/themes.dart';
import 'package:hotel_booking/profile/utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final isDarkMode = false;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: AppBar(
            backgroundColor: Colors.white,
            leading: const BackButton(color: Colors.black),
          ),
          onPressed: () {
            final theme = MyThemes.lightTheme;

            // final switcher = ThemeSwitcher.of(context)!;
            // switcher.changeTheme(theme: theme);
          },
        ),
      ),
    ],
  );
}

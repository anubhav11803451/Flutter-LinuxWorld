import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotely/controllers/themecontroller.dart';
import 'package:quotely/models/menuoptionModel.dart';
import 'package:quotely/widgets/segmentedSelector.dart';

Widget themeListTile(BuildContext context) {
  // final labels = AppLocalizations.of(context);
  final List<MenuOptionsModel> themeOptions = [
    MenuOptionsModel(key: "system", value: 'System', icon: Icons.brightness_4),
    MenuOptionsModel(key: "light", value: 'Light', icon: Icons.brightness_low),
    MenuOptionsModel(key: "dark", value: 'Dark', icon: Icons.brightness_3)
  ];
  return GetBuilder<ThemeController>(
    builder: (controller) => ListTile(
      title: Text('Theme'),
      trailing: SegmentedSelector(
        selectedOption: controller.currentTheme,
        menuOptions: themeOptions,
        onValueChanged: (value) {
          controller.setThemeMode(value);
        },
      ),
    ),
  );
}

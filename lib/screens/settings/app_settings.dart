import 'package:flutter/material.dart';
import 'package:workout_log/widgets/header/header.dart';
import '../../themes/theme_manager.dart';
import '../../widgets/header/navigate_before_button.dart';
import '../../widgets/settings/setting_row.dart';

ThemeManager _themeManager = ThemeManager();

class AppSettings extends StatefulWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Header(
              title: "App settings",
              navigationButton: NavigateBeforeButton(),
              secondaryButton: null),
          SettingRow(
              name: "Set theme",
              value: DropdownButton(
                value: _themeManager.themeMode == ThemeMode.dark,
                items: const <DropdownMenuItem<bool>>[
                  DropdownMenuItem(value: false, child: Text("Light")),
                  DropdownMenuItem(value: true, child: Text("Dark"))
                ],
                onChanged: (bool? newValue) {
                  _themeManager.toggleTheme(newValue);
                },
              ))
        ],
      )),
    );
  }
}

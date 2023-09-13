import 'package:flutter/material.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/theme_controller.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, required this.themeController});

  final ThemeController themeController;

  final textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();

    var timer = context.watch<TimerViewModel>().timerDto.timer;
    textEditController.text = timer.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            pageViewModel.bottomNavTap(0);
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("타이머설정"),
            tiles: [
              SettingsTile(
                title: TextField(
                  onChanged: (value) {
                    context.read<TimerViewModel>().setTimer(int.parse(value));
                  },
                  controller: textEditController,
                  decoration: const InputDecoration(labelText: "타이머 시작 값"),
                ),
                leading: const Icon(Icons.timer_outlined),
              ),
              SettingsTile(
                title: const TextField(
                  decoration: InputDecoration(labelText: "타이머 휴식 값"),
                ),
                leading: const Icon(Icons.timer_off_outlined),
              ),
            ],
          ),
          SettingsSection(
            title: const Text("테마설정"),
            tiles: [
              SettingsTile(
                title: Row(
                  children: [
                    const Text("테마모드"),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton<ThemeMode>(
                      value: themeController.themeMode,
                      onChanged: (value) =>
                          themeController.updateThemeMode(value),
                      items: const [
                        DropdownMenuItem(
                          value: ThemeMode.system,
                          child: Text("시스템 테마"),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.dark,
                          child: Text("어두운 테마"),
                        ),
                        DropdownMenuItem(
                          value: ThemeMode.light,
                          child: Text("밝은 테마"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          SettingsSection(
            title: const Text("공통설정"),
            tiles: [
              SettingsTile.switchTile(
                title: const Text("즉시실행"),
                initialValue: false,
                onToggle: (value) => false,
              ),
              SettingsTile(
                title: const Text("타이머"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

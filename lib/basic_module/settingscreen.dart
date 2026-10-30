import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'theme_notifier_provider.dart';


class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    _dark = ref.watch(themeNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        // backgroundColor: _dark ? Colors.black : Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: ListView(padding: .all(8), children: [_buildDarkSwitch()]),
    );
  }

  Widget _buildDarkSwitch() {
    return Card(
      child: ListTile(
        leading: Icon(Icons.dark_mode_outlined),
        title: Text("Night Mode"),
        trailing: Switch(
          value: _dark,
          onChanged: (value) {
            // setState(() {
            //   _dark=value;
            // });
            ref.read(themeNotifierProvider.notifier).toggleDark();
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_store/shared/provider/theme_notifer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeNotifer>();
    return Scaffold(
      body: SwitchListTile(
        value: theme.theme,
        onChanged: (value) {
          theme.toggle();
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          theme.theme ? 'Dart Mode' : 'Light Mode',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(
          'Change app theme',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}

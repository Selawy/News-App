import 'package:api_test/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit , HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  SettingsList(
          lightTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).colorScheme.background
          ),
          darkTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).colorScheme.background
          ),
          sections: [
            SettingsSection(
              title: Text('Settings' , style: GoogleFonts.abel(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
                fontWeight:  FontWeight.bold ,
              ),),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  onToggle: (value) {
                    homeCubit.changeTheme();
                  },
                  initialValue: homeCubit.isDark,
                  leading: homeCubit.isDark? Icon(Icons.dark_mode) :Icon(Icons.light_mode) ,
                  title: Text('Dark Theme'),
                ),
              ],
            ),
          ],
        );
      },
    ) ;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/injection/injection.dart';
import '../../../../features/authentication/session/i_session_manager.dart';
import '../bloc/theme_switch_bloc.dart';

class SwitchThemeWidget extends StatelessWidget {
  const SwitchThemeWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
          builder: (context, state) => SwitchListTile.adaptive(
              value: state.switchValue,
              onChanged: (value) async {
                await getIt<ISessionManager>().saveTheme(isDarkTheme: value);
                if (value) {
                  context
                      .read<ThemeSwitchBloc>()
                      .add(const ThemeSwitchEvent.switchOn());
                } else {
                  context
                      .read<ThemeSwitchBloc>()
                      .add(const ThemeSwitchEvent.switchOff());
                }
              }));
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../export.dart';
import '../../../injection/injection.dart';
import '../bloc/localization_bloc.dart';

class LocalizationDropDown extends StatefulWidget {
  const LocalizationDropDown({
    super.key,
  });

  @override
  State<LocalizationDropDown> createState() => _LocalizationDropDownState();
}

class _LocalizationDropDownState extends State<LocalizationDropDown>
    with SingleTickerProviderStateMixin {
  final localizationBloc = getIt<LocalizationBloc>();

  @override
  Widget build(BuildContext context) {
    final supportedLocales = context.supportedLocales;
    final dropdownItems = Set<Locale>.from(supportedLocales).toList();

    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) => DropdownButton<Locale>(
        value: state.locale,
        onChanged: (value) async {
          if (value != null) {
            await context.setLocale(value);
            setState(() {});
            context
                .read<LocalizationBloc>()
                .add(LocalizationEvent.changeLanguage(value));
          }
        },
        items: dropdownItems
            .map<DropdownMenuItem<Locale>>(
              (locale) => DropdownMenuItem<Locale>(
                value: locale,
                child:
                    Text(context.read<LocalizationBloc>().getLanguage(locale)),
              ),
            )
            .toList(),
      ),
    ); // return BlocBuilder<LocalizationBloc, LocalizationState>(
    //
  }

// Widget _buildLanguageDropdown(BuildContext context) {
//   final supportedLocales = context.supportedLocales;
//
//   final dropdownItems = Set<Locale>.from(supportedLocales).toList();
//
//   return BlocBuilder<LocalizationBloc, LocalizationState>(
//     builder: (context, state) => DropdownButton<Locale>(
//         value: state.locale,
//         onChanged: (Locale? value) {
//           if (value != null) {
//             BlocProvider.of<LocalizationBloc>(context).add(ChangeLanguage(value));
//           }
//         },
//         items: dropdownItems
//             .map<DropdownMenuItem<Locale>>(
//               (locale) => DropdownMenuItem<Locale>(
//             value: locale,
//             child: Text(locale.languageCode.toUpperCase()),
//           ),
//         )
//             .toList(),
//       ),
//   );
// }
}

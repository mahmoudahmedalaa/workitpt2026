import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:workitpt/core/utils/validator.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/keys/app_keys.dart';
import '../../../../../core/export.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../profile/data/models/profile_model.dart';

enum LocationPrefs { home, gym, outdoor, online }

// ignore: must_be_immutable
class LocationMultiDropdown extends StatefulWidget {
  Gym homeLocation;
  Gym gymLocation;
  Gym outdoorLocation;
  final void Function(LocationResult) onHomeSelect;
  final void Function(LocationResult) onGymSelect;
  final void Function(LocationResult) onOutdoorSelect;
  final TextEditingController onlineController;
  LocationMultiDropdown(
      {super.key,
      required this.homeLocation,
      required this.gymLocation,
      required this.outdoorLocation,
      required this.onHomeSelect,
      required this.onGymSelect,
      required this.onOutdoorSelect,
      required this.onlineController});

  @override
  State<LocationMultiDropdown> createState() => _LocationMultiDropdownState();
}

class _LocationMultiDropdownState extends State<LocationMultiDropdown> {
  List<LocationPrefs> selectedItems = [];

  LatLng? selectedLatLng = const LatLng(27.67386, 85.348685);
  final homeController = TextEditingController();
  final gymController = TextEditingController();
  final outdoorController = TextEditingController();

  Future<LocationResult?> getLocation() async =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlacePicker(
                AppKeys.apiKey,
                displayLocation: selectedLatLng,
                latitude: selectedLatLng!.latitude,
                longitude: selectedLatLng!.longitude,
              )));

  Widget generateTextField(LocationPrefs prefs) {
    switch (prefs) {
      case LocationPrefs.home:
        return AppTextField(
          controller: homeController,
          labelText: 'Home Location',
          readOnly: true,
          hintText: 'Select home Location in Map',
          onTap: () async {
            final value = (await getLocation())!;
            homeController.text = value.formattedAddress!;
            widget.onHomeSelect(value);
          },
          prefixIcon: Assets.icons.buliding.path,
          textColor: colorPrimary,
          textInputType: TextInputType.text,
        );

      case LocationPrefs.gym:
        return AppTextField(
          controller: gymController,
          labelText: 'Gym Location',
          onTap: () async {
            final value = (await getLocation())!;
            gymController.text = value.formattedAddress!;
            widget.onGymSelect(value);
          },
          hintText: 'Select Gym location in Map',
          prefixIcon: Assets.icons.location.path,
          textColor: colorPrimary,
          textInputType: TextInputType.text,
        );

      case LocationPrefs.outdoor:
        return AppTextField(
          controller: outdoorController,
          labelText: 'Outdoor Location',
          onTap: () async {
            final value = (await getLocation())!;
            outdoorController.text = value.formattedAddress!;
            widget.onOutdoorSelect(value);
          },
          hintText: 'Select outdoor location in Map',
          prefixIcon: Assets.icons.buliding.path,
          textColor: colorPrimary,
          textInputType: TextInputType.text,
        );
      case LocationPrefs.online:
        return AppTextField(
            controller: widget.onlineController,
            labelText: 'Online',
            hintText: 'Online links',
            // prefixIcon: Assets.icons.buliding.path,
            textColor: colorPrimary,
            validator: validateUrl,
            textInputType: TextInputType.text);
    }
  }

  void setInitialValues() {
    if (widget.homeLocation.name != null &&
        widget.homeLocation.name!.isNotEmpty) {
      selectedItems.add(LocationPrefs.home);
      setState(() {
        homeController.text = widget.homeLocation.name!;
      });
    }
    if (widget.gymLocation.name != null &&
        widget.gymLocation.name!.isNotEmpty) {
      selectedItems.add(LocationPrefs.gym);
      setState(() {
        gymController.text = widget.gymLocation.name!;
      });
    }
    if (widget.outdoorLocation.name != null &&
        widget.outdoorLocation.name!.isNotEmpty) {
      selectedItems.add(LocationPrefs.outdoor);
      setState(() {
        outdoorController.text = widget.outdoorLocation.name!;
      });
    }
    if (widget.onlineController.text.isNotEmpty) {
      selectedItems.add(LocationPrefs.online);
      setState(() {});
    }
    print(selectedItems);
  }

  void clearControllers(LocationPrefs item) {
    switch (item) {
      case LocationPrefs.home:
        homeController.text = '';
        break;
      case LocationPrefs.gym:
        gymController.text = '';
        break;
      case LocationPrefs.outdoor:
        outdoorController.text = '';
        break;
      case LocationPrefs.online:
        widget.onlineController.text = '';
        break;
    }
  }

  @override
  void initState() {
    setInitialValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          MultiSelectDialogField<LocationPrefs>(
            confirmText: const Text(
              'Ok',
              style: TextStyle(color: darkText),
            ),
            cancelText: const Text(
              'Cancel',
              style: TextStyle(color: darkText),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            selectedColor: colorPrimary,
            selectedItemsTextStyle: const TextStyle(color: Colors.white),
            buttonIcon: const Icon(Icons.keyboard_arrow_down_rounded),
            buttonText: Text(
              'Location Preferences',
              style: AppTextStyle.bodyMDRegular.copyWith(color: darkText),
            ),
            checkColor: colorPrimary,
            title: const Text('Location Preferences'),
            items: LocationPrefs.values
                .map((e) => MultiSelectItem(e, e.name))
                .toList(),
            listType: MultiSelectListType.CHIP,
            chipDisplay: MultiSelectChipDisplay(
              icon: const Icon(
                Icons.cancel_outlined,
                color: colorPrimary,
              ),
              chipColor: const Color(0xfff8f6ff),
              textStyle: const TextStyle(color: colorPrimary),
              onTap: (item) {
                setState(() {
                  selectedItems.remove(item);
                });
                clearControllers(item);
              },
            ),
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(
                  color: darkText,
                ),
              ),
            ),
            initialValue: selectedItems,
            onConfirm: (values) {
              setState(() {
                selectedItems = values;
              });
            },
            // onSaved: (values){
            //    setState(() {
            //     selectedItems = values;
            //   });
            // },
            onSelectionChanged: (values) {
              setState(() {
                selectedItems = values;
              });
            },
          ).padding(bottom: selectedItems.isNotEmpty ? 8 : 20),
          Column(
            // physics: const NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            children: [
              ...List.generate(
                selectedItems.length,
                (index) => generateTextField(selectedItems[index]),
              )
            ],
          )
        ],
      );
}

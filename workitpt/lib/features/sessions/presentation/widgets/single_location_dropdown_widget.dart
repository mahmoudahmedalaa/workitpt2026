import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:workitpt/core/utils/validator.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/keys/app_keys.dart';
import '../../../../../core/export.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/extension/cap_extension.dart';
import '../../../../core/widgets/app_drop_down.dart';

enum LocationPrefs { home, gym, outdoor, online }

class SingleLocationDropdownWidget extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController onlineController;
  final void Function(LocationResult) onLocationSelect;
  const SingleLocationDropdownWidget({
    super.key,
    required this.controller,
    required this.onLocationSelect,
    required this.onlineController,
  });

  @override
  State<SingleLocationDropdownWidget> createState() =>
      _SingleLocationDropdownWidgetState();
}

class _SingleLocationDropdownWidgetState
    extends State<SingleLocationDropdownWidget> {
  LocationPrefs? selectedItem;

  LatLng? selectedLatLng = const LatLng(27.67386, 85.348685);
  final homeController = TextEditingController();
  final gymController = TextEditingController();
  final outdoorController = TextEditingController();

  Future<LocationResult?> getLocation() async => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            AppKeys.apiKey,
            displayLocation: selectedLatLng,
            latitude: selectedLatLng!.latitude,
            longitude: selectedLatLng!.longitude,
          ),
        ),
      );

  // void clearControllers(LocationPrefs item) {
  //   switch (item) {
  //     case LocationPrefs.home:
  //       homeController.text = '';
  //       break;
  //     case LocationPrefs.gym:
  //       gymController.text = '';
  //       break;
  //     case LocationPrefs.outdoor:
  //       outdoorController.text = '';
  //       break;
  //     case LocationPrefs.online:
  //       break;
  //   }
  // }

  // void setControllers() {
  //   setState(() {
  //     homeController.text = widget.trainerLocation.home?.name ?? '';
  //     gymController.text = widget.trainerLocation.gym?.name ?? '';
  //     outdoorController.text = widget.trainerLocation.outdoor?.name ?? '';
  //     widget.onlineController.text = widget.trainerLocation.online ?? '';
  //   });
  // }

  @override
  void initState() {
    // setControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          AppDropDown(
            items: const ['Home', 'Gym', 'Outdoor', 'Online'],
            controller: widget.controller,
            prefixIcon: Assets.icons.location.path,
            contentPadding: allPadding8,
            value: selectedItem?.name.capitalize(),
            hintText: 'Select your Location',
            onChanged: (val) {
              if (val == 'Home') {
                setState(() {
                  selectedItem = LocationPrefs.home;
                  widget.controller.text = val!;
                });
              } else if (val == 'Gym') {
                setState(() {
                  selectedItem = LocationPrefs.gym;
                  widget.controller.text = val!;
                });
              } else if (val == 'Outdoor') {
                setState(() {
                  selectedItem = LocationPrefs.outdoor;
                  widget.controller.text = val!;
                });
              } else if (val == 'Online') {
                setState(() {
                  selectedItem = LocationPrefs.online;
                  widget.controller.text = val!;
                });
              }
            },
          ),
          Visibility(
            visible: selectedItem == LocationPrefs.home,
            child: AppTextField(
              controller: homeController,
              labelText: 'Home Location',
              readOnly: true,
              hintText: 'Select home Location in Map',
              onTap: () async {
                final value = (await getLocation())!;
                homeController.text = value.formattedAddress!;
                widget.onLocationSelect(value);
              },
              prefixIcon: Assets.icons.buliding.path,
              textColor: colorPrimary,
              textInputType: TextInputType.text,
            ),
          ),
          Visibility(
            visible: selectedItem == LocationPrefs.gym,
            child: AppTextField(
              controller: gymController,
              labelText: 'Gym Location',
              onTap: () async {
                final value = (await getLocation())!;
                gymController.text = value.formattedAddress!;
                widget.onLocationSelect(value);
              },
              hintText: 'Select Gym location in Map',
              prefixIcon: Assets.icons.location.path,
              textColor: colorPrimary,
              textInputType: TextInputType.text,
            ),
          ),
          Visibility(
            visible: selectedItem == LocationPrefs.outdoor,
            child: AppTextField(
              controller: outdoorController,
              labelText: 'Outdoor Location',
              onTap: () async {
                final value = (await getLocation())!;
                outdoorController.text = value.formattedAddress!;
                widget.onLocationSelect(value);
              },
              hintText: 'Select outdoor location in Map',
              prefixIcon: Assets.icons.buliding.path,
              textColor: colorPrimary,
              textInputType: TextInputType.text,
            ),
          ),
          Visibility(
            visible: selectedItem == LocationPrefs.online,
            child: AppTextField(
              controller: widget.onlineController,
              labelText: 'Online',
              hintText: 'Online links',
              // prefixIcon: Assets.icons.buliding.path,
              textColor: colorPrimary,
              validator: validateUrl,
              textInputType: TextInputType.text,
            ),
          ),
        ],
      );
}

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/extension/cap_extension.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/models/file_upload_model.dart';
import '../../data/models/profile_model.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/emergency_widget.dart';
import '../widgets/fitness_goal_widget.dart';
import '../widgets/personal_info_widget.dart';
import '../widgets/profile_picture_widget.dart';
import '../widgets/trainer_personal_widget.dart';
import '../widgets/trainer_preference_widget.dart';
import '../widgets/trainer_qualification.dart';

@RoutePage()
class EditProfileView extends StatefulWidget {
  final ProfileModel model;

  const EditProfileView({super.key, required this.model});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  String? image;

  List<String> items = [
    'Personal Information',
    'Emergency Contact',
    'Fitness Goal / Preferences'
  ];

  //formKeys
  final personalInfoKey = GlobalKey<FormState>();
  final emergencyKey = GlobalKey<FormState>();
  final fitnessInfoKey = GlobalKey<FormState>();
  final trainerPreferenceKey = GlobalKey<FormState>();
  final trainerQualificationKey = GlobalKey<FormState>();

  //personalInfoControllers
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  void setPersonalInfoControllers() {
    dobController.text = widget.model.customerInfo?.dob != null
        ? widget.model.customerInfo!.dob.toString()
        : '';
    if (widget.model.customerInfo != null &&
        widget.model.customerInfo!.gender!.isNotEmpty) {
      genderController.text = widget.model.customerInfo!.gender!;
    }
    countryController.text = widget.model.customerInfo?.country ?? '';
    countryCodeController.text = widget.model.customerInfo?.countryCode ?? '';
    stateController.text = widget.model.customerInfo?.state ?? '';
    phoneController.text = widget.model.customerInfo?.contactNumber ?? '';
    weightController.text = widget.model.customerInfo?.weight ?? '';
    heightController.text = widget.model.customerInfo?.height ?? '';
    occupationController.text = widget.model.customerInfo?.occupation ?? '';
  }

  void setTrainerPersonalInfoControllers() {
    dobController.text = widget.model.trainerInfo?.dob != null
        ? widget.model.trainerInfo!.dob.toString()
        : '';
    countryController.text = widget.model.trainerInfo?.country ?? '';
    countryCodeController.text = widget.model.trainerInfo?.countryCode ?? '';
    stateController.text = widget.model.trainerInfo?.state ?? '';
    phoneController.text = widget.model.trainerInfo?.contactNumber ?? '';
    genderController.text = widget.model.trainerInfo?.gender ?? '';
    images = widget.model.trainerInfo?.images ?? [];
  }

  //emergencyControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController ePhoneController = TextEditingController();
  TextEditingController eCountryCodeController = TextEditingController();
  TextEditingController eCountryController = TextEditingController();
  TextEditingController relationController = TextEditingController();

  void setEmergencyControllers() {
    nameController.text =
        widget.model.customerInfo?.emergencyContact?[0].name ?? '';
    eCountryController.text =
        widget.model.customerInfo?.emergencyContact?[0].countryName ?? '';
    ePhoneController.text =
        widget.model.customerInfo?.emergencyContact?[0].phone ?? '';
    relationController.text =
        widget.model.customerInfo?.emergencyContact?[0].relation ?? '';
    eCountryCodeController.text =
        widget.model.customerInfo?.emergencyContact?[0].countryCode ?? '';
  }

  void setTrainerEmergencyControllers() {
    nameController.text =
        widget.model.trainerInfo?.emergencyContact?[0].name ?? '';
    eCountryController.text =
        widget.model.trainerInfo?.emergencyContact?[0].countryName ?? '';
    ePhoneController.text =
        widget.model.trainerInfo?.emergencyContact?[0].phone ?? '';
    relationController.text =
        widget.model.trainerInfo?.emergencyContact?[0].relation ?? '';
    eCountryCodeController.text =
        widget.model.trainerInfo?.emergencyContact?[0].countryCode ?? '';
  }

  List<String> fitnessGoalList = [];
  TextEditingController workoutLocationController = TextEditingController();
  TextEditingController fitnessGoalController = TextEditingController();
  Gym homeLocation = Gym();
  Gym gymLocation = Gym();
  Gym outdoorLocation = Gym();
  TextEditingController medicalConditionController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  List<String>? images;

  void setFitnessInfoControllers() {
    medicalConditionController.text =
        widget.model.customerInfo?.medicalCondition ?? '';
    aboutController.text = widget.model.customerInfo?.introduction ?? '';
    fitnessGoalList = widget.model.customerInfo?.fitnessInterest ?? [];
    fitnessGoalController.text = widget.model.customerInfo?.fitnessGoal ?? '';
    homeLocation = Gym(
      name: widget.model.customerInfo?.location?.home?.name ?? '',
      lat: widget.model.customerInfo?.location?.home?.lat,
      lng: widget.model.customerInfo?.location?.home?.lng,
    );

    gymLocation = Gym(
      name: widget.model.customerInfo?.location?.gym?.name ?? '',
      lat: widget.model.customerInfo?.location?.gym?.lat,
      lng: widget.model.customerInfo?.location?.gym?.lng,
    );

    outdoorLocation = Gym(
      name: widget.model.customerInfo?.location?.outdoor?.name ?? '',
      lat: widget.model.customerInfo?.location?.outdoor?.lat,
      lng: widget.model.customerInfo?.location?.outdoor?.lng,
    );
    onlineController.text = widget.model.customerInfo?.location?.online ?? '';
  }

  //trainerPreferenceInfo
  List<String> trainerSpecialization = [];
  TextEditingController trainerGymNameController = TextEditingController();
  TextEditingController trainerGymLocationController = TextEditingController();
  TextEditingController trainerMedicalConditionController =
      TextEditingController();
  TextEditingController trainerAboutController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController onlineController = TextEditingController();

  void setTrainerFitnessInfo() {
    trainerSpecialization = widget.model.trainerInfo?.specialization ?? [];
    homeLocation = Gym(
      name: widget.model.trainerInfo?.location?.home?.name ?? '',
      lat: widget.model.trainerInfo?.location?.home?.lat,
      lng: widget.model.trainerInfo?.location?.home?.lng,
    );

    gymLocation = Gym(
      name: widget.model.trainerInfo?.location?.gym?.name ?? '',
      lat: widget.model.trainerInfo?.location?.gym?.lat,
      lng: widget.model.trainerInfo?.location?.gym?.lng,
    );

    outdoorLocation = Gym(
      name: widget.model.trainerInfo?.location?.outdoor?.name ?? '',
      lat: widget.model.trainerInfo?.location?.outdoor?.lat,
      lng: widget.model.trainerInfo?.location?.outdoor?.lng,
    );
    onlineController.text = widget.model.trainerInfo?.location?.online ?? '';
    trainerMedicalConditionController.text =
        widget.model.trainerInfo?.medicalCondition ?? '';
    trainerAboutController.text = widget.model.trainerInfo?.introduction ?? '';
    experienceController.text = widget.model.trainerInfo?.experience ?? '';
    certificationList = widget.model.trainerInfo?.certification ?? [];
  }

  List<File> fileList = [];
  List<String> certificationList = [];

  late List<Widget> views = [
    PersonalInfoWidget(
      occupationController: occupationController,
      phoneController: phoneController,
      dobController: dobController,
      genderController: genderController,
      countryCodeController: countryCodeController,
      countryController: countryController,
      heightController: heightController,
      weightController: weightController,
      stateController: stateController,
      formKey: personalInfoKey,
    ),
    EmergencyWidget(
      formKey: emergencyKey,
      countryCodeController: eCountryCodeController,
      countryController: eCountryController,
      nameController: nameController,
      relationController: relationController,
      phoneController: ePhoneController,
    ),
    FitnessGoalWidget(
      aboutController: aboutController,
      fitnessGoalController: fitnessGoalController,
      fitnessInterestController: fitnessGoalList,
      formKey: fitnessInfoKey,
      gymLocation: gymLocation,
      homeLocation: homeLocation,
      medicalConditionController: medicalConditionController,
      outdoorLocation: outdoorLocation,
      workoutLocationController: workoutLocationController,
      onGymSelect: onGymselect,
      onHomeSelect: onHomeselect,
      onOutdoorSelect: onOutdoorselect,
      onlineController: onlineController,
      onConfirm: (items) {
        setState(() {
          fitnessGoalList = items;
        });
      },
      onRemove: (val) {
        setState(() {
          fitnessGoalList.remove(val);
        });
      },
    ),
  ];

  List<String> trainerItems = [
    'Personal Information',
    'Emergency Contact',
    'Preferences',
    'Qualification'
  ];

  late List<Widget> trainerViews = [
    TrainerPersonalWidget(
      phoneController: phoneController,
      dobController: dobController,
      genderController: genderController,
      countryCodeController: countryCodeController,
      countryController: countryController,
      stateController: stateController,
      formKey: personalInfoKey,
    ),
    EmergencyWidget(
      formKey: emergencyKey,
      countryCodeController: eCountryCodeController,
      countryController: eCountryController,
      nameController: nameController,
      relationController: relationController,
      phoneController: ePhoneController,
    ),
    TrainerPreference(
      formKey: trainerPreferenceKey,
      aboutController: trainerAboutController,
      medicalConditionController: trainerMedicalConditionController,
      specializationList: trainerSpecialization,
      experienceController: experienceController,
      homeLocation: homeLocation,
      outdoorLocation: outdoorLocation,
      onGymSelect: onGymselect,
      onHomeSelect: onHomeselect,
      onOutdoorSelect: onOutdoorselect,
      gymLocation: gymLocation,
      onlineController: onlineController,
      onConfirm: (items) {
        setState(() {
          trainerSpecialization = items;
        });
      },
      onRemove: (val) {
        setState(() {
          trainerSpecialization.remove(val);
        });
      },
    ),
    QualificationWidget(
      fileList: fileList,
      certificationList: certificationList,
    ),
  ];

  late String role;

  void onHomeselect(LocationResult result) {
    setState(() {
      homeLocation = Gym(
        name: result.formattedAddress,
        lat: result.latLng?.latitude,
        lng: result.latLng?.longitude,
      );
    });
  }

  void onGymselect(LocationResult result) {
    setState(() {
      gymLocation = Gym(
        name: result.formattedAddress,
        lat: result.latLng?.latitude,
        lng: result.latLng?.longitude,
      );
    });
  }

  void onOutdoorselect(LocationResult result) {
    setState(() {
      outdoorLocation = Gym(
        name: result.formattedAddress,
        lat: result.latLng?.latitude,
        lng: result.latLng?.longitude,
      );
    });
  }

  void updateProfile() {
    ProfileModel profileModel;
    if (role == 'TRAINER') {
      final trainerInfoModel = TrainerInfo(
        dob: dobController.text.isNotEmpty
            ? DateTime.parse(dobController.text)
            : null,
        gender: genderController.text,
        emergencyContact: [
          EmergencyContact(
            name: nameController.text,
            phone: ePhoneController.text,
            countryCode: eCountryCodeController.text,
            relation: relationController.text.isNotEmpty
                ? relationController.text.capitalize()
                : '',
            countryName: eCountryController.text,
          )
        ],
        contactNumber: phoneController.text,
        country: countryController.text,
        countryCode: countryCodeController.text,
        state: stateController.text,
        location: Location(
          home: homeLocation,
          gym: gymLocation,
          outdoor: outdoorLocation,
          online: onlineController.text,
        ),
        specialization: trainerSpecialization,
        experience: experienceController.text,
        certification: certificationList,
        introduction: trainerAboutController.text,
        medicalCondition: trainerMedicalConditionController.text,
        images: images,
      );
      profileModel = ProfileModel(
        avatar: image,
        trainerInfo: trainerInfoModel,
        profileCompleted: true,
      );
    } else {
      final customerModel = CustomerInfo(
        dob: dobController.text.isNotEmpty
            ? DateTime.parse(dobController.text)
            : null,
        gender: genderController.text,
        emergencyContact: [
          EmergencyContact(
            name: nameController.text.isNotEmpty ? nameController.text : null,
            phone:
                ePhoneController.text.isNotEmpty ? ePhoneController.text : null,
            countryCode: eCountryCodeController.text,
            relation: relationController.text.isNotEmpty
                ? relationController.text.capitalize()
                : null,
            countryName: eCountryController.text,
          )
        ],
        contactNumber: phoneController.text,
        country: countryController.text,
        countryCode: countryCodeController.text,
        state: stateController.text,
        introduction: aboutController.text,
        workoutLocation: workoutLocationController.text,
        location: Location(
          home: homeLocation,
          gym: gymLocation,
          outdoor: outdoorLocation,
          online:
              onlineController.text.isNotEmpty ? onlineController.text : null,
        ),
        height: heightController.text,
        weight: weightController.text,
        occupation: occupationController.text,
        fitnessInterest: fitnessGoalList,
        fitnessGoal: fitnessGoalController.text,
        medicalCondition: medicalConditionController.text,
      );
      profileModel = ProfileModel(
        customerInfo: customerModel,
        avatar: image,
        profileCompleted: true,
      );
    }

    profileBloc.add(ProfileEvent.updateProfile(profileModel));
  }

  Gym extractLocation(LocationResult result) => Gym(
        name: result.formattedAddress,
        lat: result.latLng != null ? result.latLng!.latitude : null,
        lng: result.latLng != null ? result.latLng!.longitude : null,
      );

  ProfileBloc profileBloc;

  _EditProfileViewState() : profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    image = widget.model.avatar;
    role = widget.model.role ?? 'USER';
    if (role == 'USER') {
      setPersonalInfoControllers();
      setEmergencyControllers();
      setFitnessInfoControllers();
    } else {
      setTrainerPersonalInfoControllers();
      setTrainerEmergencyControllers();
      setTrainerFitnessInfo();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<ProfileBloc>(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () => EasyLoading.show(dismissOnTap: true),
              onUploadImageSuccess: (model) {
                EasyLoading.dismiss();
                setState(() {
                  image = model.path?[0];
                });
                updateProfile();
              },
              onUpdateProfileSuccess: (model) {
                EasyLoading.showSuccess('Profile Updated Successfully.');
                EasyLoading.dismiss();
                context.router.pop(model);
              },
              onUploadMultipleImageSuccess: (model) {
                EasyLoading.dismiss();
                setState(() {
                  certificationList.addAll(model.path!);
                });
                if (widget.model.avatar != image) {
                  profileBloc.add(ProfileEvent.uploadImage(
                      FileUploadModel(files: [image!])));
                } else {
                  updateProfile();
                }
              },
            );
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Edit Profile'),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: Column(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      verticalMargin12,
                      ProfilePicWidget(
                        imagePath: widget.model.avatar ?? '',
                        setImage: (path) {
                          setState(() {
                            image = path;
                          });
                        },
                      ),
                      verticalMargin12,
                      ...List.generate(
                        role == 'TRAINER' ? trainerItems.length : items.length,
                        (index) => Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            title: Text(
                              role == 'TRAINER'
                                  ? trainerItems[index]
                                  : items[index],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            children: <Widget>[
                              if (role == 'TRAINER')
                                trainerViews[index]
                              else
                                views[index],
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                    ],
                  ).width(100.w),
                ).expanded(),
                verticalMargin12,
                AppButton(
                  buttonText: 'Update Profile',
                  onPressed: () async {
                    if (role == 'TRAINER' && fileList.isNotEmpty) {
                      profileBloc.add(
                        ProfileEvent.uploadMultipleImage(
                          FileUploadModel(
                            files: fileList.map((e) => e.path).toList(),
                          ),
                        ),
                      );
                    } else {
                      if (widget.model.avatar != image && image != '') {
                        profileBloc.add(ProfileEvent.uploadImage(
                            FileUploadModel(files: [image!])));
                      } else {
                        updateProfile();
                      }
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 12,
                ),
              ],
            ),
          ),
        ),
      );
}

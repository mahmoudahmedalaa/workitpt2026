import 'dart:io';

import 'package:intl/intl.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../profile/data/models/profile_model.dart';
import '../widget/trainer_additional_info_page.dart';
import '../widget/trainer_emergency_info_widget.dart';
import '../widget/trainer_fitness_info_widget.dart';
import '../widget/trainer_qualification_page.dart';

@RoutePage()
class SignupTrainerView extends StatefulWidget {
  const SignupTrainerView({super.key});

  @override
  SignupTrainerViewState createState() => SignupTrainerViewState();
}

class SignupTrainerViewState extends State<SignupTrainerView> {
  late PageController pageController;
  int index = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  final formKey1 = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final genderController = TextEditingController();
  final countryCodeController = TextEditingController();
  final countryController = TextEditingController();
  final cityController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey2 = GlobalKey<FormState>();
  final ePhoneController = TextEditingController();
  final relationController = TextEditingController();
  final eCountryController = TextEditingController();
  final eCountryCodeController = TextEditingController();
  final nameController = TextEditingController();

  final formKey3 = GlobalKey<FormState>();
  List<String> specializationController = [];
  final medicalConditionController = TextEditingController();
  final aboutController = TextEditingController();
  final experienceController = TextEditingController();

  final onlineController = TextEditingController();

  List<File> fileList = [];
  List<String> certificationList = [];

  Gym homeLocation = Gym();
  Gym gymLocation = Gym();
  Gym outdoorLocation = Gym();

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

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top + 12,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: pageController, // PageController
                count: 4,
                effect: ExpandingDotsEffect(
                  expansionFactor: 1.001,
                  dotWidth: (100.w - 60) / 4,
                  paintStyle: PaintingStyle.fill,
                  dotColor: shadowColor,
                  activeDotColor: colorPrimary,
                  dotHeight: 4,
                ), // your preferred effect
                onDotClicked: (index) {},
              ),
            ),
            verticalMargin40,
            verticalMargin12,
            Padding(
              padding: horizontalPadding24,
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (page) {
                  setState(() {
                    index = page;
                  });
                },
                children: [
                  TrainerAdditionalInfoWidget(
                    formKey: formKey1,
                    dobController: dateController,
                    genderController: genderController,
                    countryCodeController: countryCodeController,
                    countryController: countryController,
                    phoneController: phoneController,
                    cityController: cityController,
                  ),
                  TrainerEmergencyInfoWidget(
                      formkey: formKey2,
                      relationController: relationController,
                      countryCodeController: eCountryCodeController,
                      countryController: eCountryController,
                      phoneController: ePhoneController,
                      nameController: nameController),
                  TrainerFitnessInfoWidget(
                    formKey: formKey3,
                    specializationController: specializationController,
                    homeLocation: homeLocation,
                    outdoorLocation: outdoorLocation,
                    onGymSelect: onGymselect,
                    onHomeSelect: onHomeselect,
                    onOutdoorSelect: onOutdoorselect,
                    gymLocation: gymLocation,
                    onlineController: onlineController,
                    medicalConditionController: medicalConditionController,
                    aboutController: aboutController,
                    experienceController: experienceController,
                    onConfirm: (items) {
                      setState(() {
                        specializationController = items;
                      });
                    },
                    onRemove: (p0) {
                      setState(() {
                        specializationController.remove(p0);
                      });
                    },
                  ),
                  TrainerQualificationWidget(
                    fileList: fileList,
                    certificationList: certificationList,
                  ),
                ],
              ),
            ).expanded(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: AppButton(
                    onPressed: () {
                      if (pageController.page! > 0) {
                        pageController.animateToPage(
                            pageController.page!.toInt() - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      } else {
                        context.router.pop();
                      }
                    },
                    textColor: buttonTextColor,
                    buttonText: 'Back',
                    prefixWidget: const Icon(Icons.arrow_back),
                    backgroundColor: buttonBG,
                    suffixWidget: const SizedBox(),
                  )),
                  Expanded(
                    child: AppButton(
                      onPressed: () {
                        if (index == 0 && formKey1.currentState!.validate()) {
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else if (index == 1 &&
                            formKey2.currentState!.validate()) {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else if (index == 2 &&
                            formKey3.currentState!.validate()) {
                          pageController.animateToPage(3,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else if (index == 3 && fileList.isNotEmpty) {
                          context.router.push(
                            TermsRoute(
                              fileList: fileList,
                              profileModel: ProfileModel(
                                profileCompleted: true,
                                trainerInfo: TrainerInfo(
                                  location: Location(
                                    home: homeLocation,
                                    gym: gymLocation,
                                    outdoor: outdoorLocation,
                                    online: onlineController.text,
                                  ),
                                  emergencyContact: [
                                    EmergencyContact(
                                      name: nameController.text,
                                      relation: relationController.text,
                                      countryCode: eCountryCodeController.text,
                                      phone: ePhoneController.text,
                                      countryName: eCountryController.text,
                                    ),
                                  ],
                                  contactNumber: phoneController.text,
                                  countryCode: countryCodeController.text,
                                  country: countryController.text,
                                  dob: DateFormat('yyyy-MM-dd hh:mm:ss')
                                      .parse(dateController.text),
                                  experience: experienceController.text,
                                  state: cityController.text,
                                  certification: certificationList,
                                  specialization: specializationController,
                                  medicalCondition:
                                      medicalConditionController.text,
                                  introduction: aboutController.text,
                                  gender: genderController.text,
                                ),
                              ),
                            ),
                          );
                        } else if (index == 3 && fileList.isEmpty) {
                          EasyLoading.showInfo(
                              'Please select your certificate');
                        } else {
                          EasyLoading.showInfo(
                              'Please fill necessary information');
                        }
                      },
                      buttonText: index >= (4 - 1) ? 'Submit' : 'Next',
                      suffixWidget: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      buttonWidth: ButtonWidth.small,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

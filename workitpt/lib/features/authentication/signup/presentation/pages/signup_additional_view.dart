import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../profile/data/models/profile_model.dart';
import '../../../../profile/presentation/bloc/profile_bloc.dart';
import '../widget/additional_info_widget.dart';
import '../widget/emergency_info_widget.dart';
import '../widget/fitness_info_widget.dart';

@RoutePage()
class SignupAdditionalView extends StatefulWidget {
  const SignupAdditionalView({super.key});

  @override
  SignupAdditionalViewState createState() => SignupAdditionalViewState();
}

class SignupAdditionalViewState extends State<SignupAdditionalView> {
  late PageController pageController;
  bool userSelected = true;
  int index = 0;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  final formKey1 = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final countryController = TextEditingController();
  final genderController = TextEditingController();
  final cityController = TextEditingController();
  final countryCodeController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final occupationController = TextEditingController();

  final formKey2 = GlobalKey<FormState>();
  final ePhoneController = TextEditingController();
  final eCountryCodeController = TextEditingController();
  final eCountryController = TextEditingController();
  final relationController = TextEditingController();
  final nameController = TextEditingController();

  final formKey3 = GlobalKey<FormState>();
  final aboutController = TextEditingController();
  final medicalConditionController = TextEditingController();
  Gym homeLocation = Gym();
  Gym gymLocation = Gym();
  Gym outdoorLocation = Gym();
  final workoutLocationController = TextEditingController();
  List<String> fitnessGoalList = [];
  final fitnessGoalController = TextEditingController();
  final onlineController = TextEditingController();

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
  void dispose() {
    occupationController.dispose();
    phoneController.dispose();
    countryCodeController.dispose();
    countryController.dispose();
    heightController.dispose();
    weightController.dispose();
    ePhoneController.dispose();
    nameController.dispose();
    aboutController.dispose();
    medicalConditionController.dispose();
    workoutLocationController.dispose();
    super.dispose();
  }

  ProfileBloc profileBloc;

  SignupAdditionalViewState() : profileBloc = getIt<ProfileBloc>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => profileBloc,
          child: BlocListener<ProfileBloc, ProfileState>(
            listener: (context, state) {
              state.whenOrNull(onLoading: () {
                EasyLoading.show(dismissOnTap: true);
              }, onUpdateProfileSuccess: (user) {
                context.router.popAndPush(AllDoneRoute(role: user.role!));
                EasyLoading.showSuccess('All done successfully');
              }, onFailure: (message) {
                EasyLoading.showError(message!);
              });
            },
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 12,
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: pageController, // PageController
                    count: 3,
                    effect: ExpandingDotsEffect(
                        expansionFactor: 1.001,
                        dotWidth: (100.w - 60) / 3,
                        paintStyle: PaintingStyle.fill,
                        dotColor: lightPrimary,
                        activeDotColor: colorPrimary,
                        dotHeight: 4), // your preferred effect
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
                      AdditionalInfoWidget(
                        occupationController: occupationController,
                        phoneController: phoneController,
                        dateController: dateController,
                        genderController: genderController,
                        countryCodeController: countryCodeController,
                        countryController: countryController,
                        formkey: formKey1,
                        heightController: heightController,
                        weightController: weightController,
                        cityController: cityController,
                      ),
                      EmergencyInfoWidget(
                        formkey: formKey2,
                        countryCodeController: eCountryCodeController,
                        countryController: eCountryController,
                        phoneController: ePhoneController,
                        relationController: relationController,
                        nameController: nameController,
                      ),
                      FitnessInfoWidget(
                        formkey: formKey3,
                        aboutController: aboutController,
                        homeLocation: homeLocation,
                        outdoorLocation: outdoorLocation,
                        onGymSelect: onGymselect,
                        onHomeSelect: onHomeselect,
                        onOutdoorSelect: onOutdoorselect,
                        medicalConditionController: medicalConditionController,
                        gymLocation: gymLocation,
                        workoutLocationController: workoutLocationController,
                        loseWeightController: fitnessGoalList,
                        fitnessGoalController: fitnessGoalController,
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
                            if (index == 0) {
                              if (formKey1.currentState!.validate()) {
                                print(
                                    '${cityController.text},${countryController.text},${dateController.text}, ${genderController.text}, ${phoneController.text}, ${occupationController.text}, ${countryController.text}, ${weightController.text},  ${heightController.text}, ');
                                pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              } else {
                                EasyLoading.showInfo(
                                    'Please fill necessary additional information');
                              }
                            } else if (index == 1) {
                              if (formKey2.currentState!.validate()) {
                                print(
                                    '${nameController.text},${ePhoneController.text},${relationController.text},');

                                pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              } else {
                                EasyLoading.showInfo(
                                    'Please fill necessary emergency information');
                              }
                            } else if (index == 2 &&
                                formKey3.currentState!.validate()) {
                              profileBloc.add(ProfileEvent.updateProfile(
                                ProfileModel(
                                  profileCompleted: true,
                                  customerInfo: CustomerInfo(
                                    dob: DateFormat('yyyy-MM-dd hh:mm:ss')
                                        .parse(dateController.text),
                                    gender: genderController.text,
                                    height: heightController.text,
                                    weight: weightController.text,
                                    contactNumber: phoneController.text,
                                    countryCode: countryCodeController.text,
                                    fitnessInterest: fitnessGoalList,
                                    fitnessGoal: fitnessGoalController.text,
                                    location: Location(
                                      home: homeLocation,
                                      gym: gymLocation,
                                      outdoor: outdoorLocation,
                                      online: onlineController.text,
                                    ),
                                    occupation: occupationController.text,
                                    emergencyContact: [
                                      EmergencyContact(
                                        name: nameController.text,
                                        phone: ePhoneController.text,
                                        relation: relationController.text,
                                        countryCode:
                                            eCountryCodeController.text,
                                      )
                                    ],
                                    country: countryController.text,
                                    state: cityController.text,
                                    introduction: aboutController.text,
                                    workoutLocation:
                                        workoutLocationController.text,
                                    medicalCondition:
                                        medicalConditionController.text,
                                  ),
                                ),
                              ));
                            } else {
                              EasyLoading.showInfo(
                                  'Please fill necessary Fitness Information');
                            }
                          },
                          buttonText: index >= 2 ? 'Submit' : 'Next',
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
          ),
        ),
      );

  Gym extractLocation(LocationResult result) => Gym(
        name: result.formattedAddress,
        lat: result.latLng?.latitude,
        lng: result.latLng?.longitude,
      );
}

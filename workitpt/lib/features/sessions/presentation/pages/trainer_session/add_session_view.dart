import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/app_image_picker.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_drop_down.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../../profile/data/models/file_upload_model.dart';
import '../../../../profile/data/models/profile_model.dart';
import '../../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../data/models/date_model.dart';
import '../../../data/models/session_model.dart';
import '../../bloc/session_bloc.dart';
import '../../widgets/date_time_picker.dart';
import '../../widgets/flexible_location_counter.dart';
import '../../widgets/image_item_widget.dart';
import '../../widgets/radio_selection_widget.dart';
import '../../widgets/recurring_datetime_picker.dart';
import '../../widgets/single_location_dropdown_widget.dart';
import 'trainer_session_detail_view.dart';

@RoutePage()
class AddSesssionView extends StatefulWidget {
  const AddSesssionView({super.key});

  @override
  State<AddSesssionView> createState() => _AddSesssionViewState();
}

class _AddSesssionViewState extends State<AddSesssionView> {
  final titleController = TextEditingController();
  final sessionController = TextEditingController();
  final priceController = TextEditingController();
  List<File?> pickedImageList = [];
  List<String> uploadedImageList = [];
  Gym location = Gym();

  final descriptionController = TextEditingController();
  final expectController = TextEditingController();
  final benefitController = TextEditingController();
  final bringController = TextEditingController();
  final maxAttendeeController = TextEditingController();

  final locationController = TextEditingController();
  final onlineController = TextEditingController();

  bool isFlexibleLocation = false;
  int locationRange = 1;

  String sessionType = '1-on-1';
  String sessionDifficulty = 'Beginner';
  String sessionOccurance = '';

  final workoutType = const [
    'Weightlifting',
    'Cardiovascular Conditioning',
    'Strength and Conditioning',
    'Postnatal Fitness',
    'Pre-natal Fitness',
    'Senior Fitness',
    'Rehabilitation and Injury Prevention',
    'Flexibility and Stretching',
    'Mindfulness and Meditation',
    'Yoga',
    'Pilates',
    'CrossFit',
    'Functional Training',
    'High-Intensity Interval Training (HIIT)',
    'Kickboxing',
    'Boxing',
    'Jiu jitsu',
    'Judo',
    'Running and Endurance Training',
    'Cycling (Indoor or Outdoor)',
    'Dance Fitness (e.g., Zumba, Hip Hop, Ballet)',
    'Swimming',
    'Soccer',
    'Basketball',
    'Volleyball',
    'Tennis',
    'Bodyweight Training',
    'Nutritionist',
  ];

  void onLocationselect(LocationResult result) {
    setState(() {
      location = Gym(
        name: result.formattedAddress,
        lat: result.latLng?.latitude,
        lng: result.latLng?.longitude,
      );
    });
  }

  final _formKey = GlobalKey<FormState>();

  final SessionBloc sessionBloc = getIt<SessionBloc>();
  final ProfileBloc profileBloc = getIt<ProfileBloc>();

  List<DateTime> calculateDaysInterval(DateTime startDate, DateTime endDate) {
    final days = <DateTime>[];
    for (var i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    return days;
  }

  List<DayOfWeek> getDaysForRecurring(DateTime startDate, DateTime endDate) {
    final recurringList = <DayOfWeek>[];
    final total = endDate.difference(startDate).inDays;
    for (var i = 0; i <= total; i++) {
      final date = startDate.add(Duration(days: i));
      final day = DateFormat('EEEE').format(date);
      if (selectedDays.contains(day)) {
        recurringList.add(
          DayOfWeek(
            day: day,
            dateFrom: DateFormat('yyyy-MM-dd').format(date),
            dateTo: DateFormat('yyyy-MM-dd').format(date),
          ),
        );
      }
    }
    return recurringList;
  }

  String getSessionType() {
    if (sessionType == 'Group') {
      return 'group';
    } else {
      return sessionType;
    }
  }

  void addSession() {
    final model = SessionModel(
      sessionTitle: titleController.text,
      session: sessionController.text,
      sessionType: getSessionType(),
      difficultyLevel: sessionDifficulty,
      price: int.tryParse(priceController.text),
      selectType: sessionOccurance,
      flexibleLocation: isFlexibleLocation,
      occurrence: occuranceValue,
      images: uploadedImageList,
      timeFrom: firstTime?.format(context),
      timeTo: lastTime?.format(context),
      dayOfWeek: sessionOccurance == 'one_time'
          ? [
              DayOfWeek(
                day: singleDate != null
                    ? DateFormat('EEEE').format(singleDate!)
                    : '',
                dateFrom: singleDate != null
                    ? DateFormat('yyyy-MM-dd').format(singleDate!)
                    : '',
                dateTo: singleDate != null
                    ? DateFormat('yyyy-MM-dd').format(singleDate!)
                    : '',
              ),
            ]
          : startDate != null && endDate != null
              ? getDaysForRecurring(startDate!, endDate!)
              : [],
      description: descriptionController.text,
      expect: expectController.text,
      bring: bringController.text,
      benefits: benefitController.text,
      location: locationController.text,
      coordicates: locationController.text != 'Online'
          ? Coordinates(
              lat: location.lat,
              lng: location.lng,
            )
          : null,
      onlineUrl:
          locationController.text == 'Online' ? onlineController.text : null,
      numOfAttendees: int.tryParse(maxAttendeeController.text),
      locationRange: isFlexibleLocation ? locationRange : null,
      location_on_map:
          locationController.text != 'Online' ? location.name : null,
    );
    sessionBloc.add(SessionEvent.addSession(model));
  }

  void fileCheck() {
    if (pickedImageList.isNotEmpty) {
      profileBloc.add(
        ProfileEvent.uploadMultipleImage(
          FileUploadModel(
            files: pickedImageList.map((e) => e!.path).toList(),
          ),
        ),
      );
    } else {
      addSession();
    }
  }

  bool _checkValidation() {
    return _formKey.currentState!.validate() &&
        sessionOccurance.isNotEmpty &&
        locationController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SessionBloc>(
            create: (context) => sessionBloc,
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => profileBloc,
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<SessionBloc, SessionState>(
              listener: (context, state) {
                state.whenOrNull(
                  onLoading: EasyLoading.show,
                  onAddSessionSuccess: (model) {
                    EasyLoading.showSuccess('Session added successfully');
                    context.router.popAndPush(
                      AllDoneRoute(
                          desc:
                              'Congratulations! Your new session has been added and ready!',
                          role: 'TRAINER'),
                    );
                  },
                  onFailure: (message) {
                    EasyLoading.showError(message!);
                  },
                );
              },
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                state.whenOrNull(
                  onLoading: EasyLoading.show,
                  onUploadMultipleImageSuccess: (model) {
                    setState(() {
                      uploadedImageList = model.path!;
                    });
                    addSession();
                  },
                  onFailure: (msg) {
                    EasyLoading.showError(msg!);
                  },
                );
              },
            ),
          ],
          child: BaseView(
            appBarColor: Colors.white,
            color: Colors.white,
            titleText: 'Add Session',
            elevation: 0,
            padding: horizontalPadding24,
            body: Column(
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextField(
                          controller: titleController,
                          hintText: 'Enter session name',
                          validator: (value) =>
                              validateNotEmpty(value, 'Session Name'),
                          labelText: 'Session Title',
                        ),
                        AppDropDown(
                          items: workoutType,
                          labelText: 'Workout Type',
                          controller: sessionController,
                          validator: (value) => value == null
                              ? 'Please select your workout type'
                              : null,
                          hintText: 'Select your workout type',
                          menuMaxHeight: 400,
                          selectedTextStyle: AppTextStyle.bodySMRegular,
                        ),
                        RadioSelectionWidget(
                          title: 'Difficulty Level',
                          items: const ['Beginner', 'Intermediate', 'Advanced'],
                          groupValue: sessionDifficulty,
                          onChanged: (val) {
                            setState(() {
                              sessionDifficulty = val!;
                            });
                          },
                        ),
                        AppTextField(
                          controller: priceController,
                          hintText: 'Enter Price',
                          labelText: 'Price (USD)',
                          validator: (value) =>
                              validateNotEmpty(value, 'Price'),
                          textInputType: TextInputType.number,
                        ),
                        RadioSelectionWidget(
                          title: 'Session Type',
                          items: const ['1-on-1', 'Group'],
                          groupValue: sessionType,
                          onChanged: (val) {
                            setState(() {
                              sessionType = val!;
                            });
                          },
                        ),
                        Visibility(
                          visible: sessionType == 'Group',
                          child: AppTextField(
                            controller: maxAttendeeController,
                            labelText: 'Enter maximum num of attendees',
                            textInputType: TextInputType.number,
                            validator: (value) {
                              if (sessionType == 'Group') {
                                if (value != null && value.isEmpty) {
                                  return 'Number of attendees must not be empty';
                                }
                              } else {
                                return null;
                              }
                              return null;
                            },
                          ),
                        ),
                        RadioSelectionWidget(
                          title: 'Select',
                          items: const ['one_time', 'recurring'],
                          groupValue: sessionOccurance,
                          onChanged: (value) {
                            setState(() {
                              sessionOccurance = value!;
                            });
                            if (sessionOccurance == 'one_time') {
                              onOneTimeTap();
                            } else if (sessionOccurance == 'recurring') {
                              onRecurringTap();
                            }
                          },
                        ),
                        if (sessionOccurance == 'one_time')
                          oneTimescheduleDate(),
                        if (sessionOccurance == 'recurring')
                          recurringScheduleDate(),
                        uploadImage(),
                        verticalMargin12,
                        SingleLocationDropdownWidget(
                          onlineController: onlineController,
                          controller: locationController,
                          onLocationSelect: onLocationselect,
                        ),
                        Row(
                          children: [
                            CupertinoCheckbox(
                              activeColor: colorPrimary,
                              value: isFlexibleLocation,
                              onChanged: (val) {
                                setState(() {
                                  isFlexibleLocation = val!;
                                });
                              },
                            ).width(24),
                            horizontalMargin4,
                            Text(
                              'Flexible Location',
                              style: AppTextStyle.tinySMRegular,
                            ),
                          ],
                        ),
                        Text(
                          'Check this box if you are open to adjusting the location based on \ncustomer preference',
                          style: AppTextStyle.tinySMRegular.copyWith(
                            color: darkText,
                            letterSpacing: 0.16,
                          ),
                        ),
                        Visibility(
                          visible: isFlexibleLocation,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Kilometer Range(Km)',
                                style: AppTextStyle.bodySMRegular.copyWith(
                                  color: darkText,
                                  letterSpacing: 0.20,
                                ),
                              ),
                              horizontalMargin8,
                              FlexibleLocationCounter(
                                locationRange: locationRange,
                                onSubtractTap: () {
                                  if (locationRange > 1) {
                                    setState(() {
                                      locationRange -= 1;
                                    });
                                  }
                                },
                                onAddTap: () {
                                  if (locationRange < 15) {
                                    setState(() {
                                      locationRange += 1;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        verticalMargin12,
                        SessionDescriptionWidget(
                          benefitController: benefitController,
                          descriptionController: descriptionController,
                          expectController: expectController,
                          bringController: bringController,
                          canEdit: true,
                        ),
                      ],
                    ),
                  ),
                ).expanded(),
                AppButton(
                  onPressed: () {
                    if (_checkValidation()) {
                      if (sessionOccurance == 'one_time') {
                        if (singleDate != null &&
                            firstTime != null &&
                            lastTime != null) {
                          fileCheck();
                        } else {
                          EasyLoading.showInfo(
                              'Please fill schedule date properly');
                        }
                      } else if (sessionOccurance == 'recurring') {
                        if (startDate != null &&
                            endDate != null &&
                            firstTime != null &&
                            lastTime != null &&
                            selectedDays.isNotEmpty) {
                          fileCheck();
                        } else {
                          EasyLoading.showInfo(
                              'Please fill schedule date properly');
                        }
                      }
                    } else {
                      EasyLoading.showInfo('Please fill required information!');
                    }
                  },
                  buttonText: 'Add Session',
                  suffixWidget: const SizedBox(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom + 12,
                )
              ],
            ),
          ),
        ),
      );

  Widget scheduling(String title, String value) => Row(
        children: [
          Text(
            title,
            style: AppTextStyle.bodySMSemiBold.copyWith(color: blackText),
          ),
          Text(
            value,
            style: AppTextStyle.bodySMSemiBold.copyWith(color: darkText),
          ),
        ],
      );

  Widget readMoreText(String title, String content) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalMargin20,
          Text(
            title,
            style: AppTextStyle.bodySMSemiBold.copyWith(color: darkText),
          ),
          verticalMargin8,
          ReadMoreText(
            content,
            trimLines: 2,
            trimMode: TrimMode.Line,
            lessStyle:
                AppTextStyle.bodySMSemiBold.copyWith(color: colorPrimary),
            style: AppTextStyle.bodySMRegular.copyWith(color: blackText),
            trimCollapsedText: 'Read more',
            trimExpandedText: ' Show less',
            moreStyle:
                AppTextStyle.bodySMSemiBold.copyWith(color: colorPrimary),
          ),
        ],
      );

  DateTime? singleDate;
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? firstTime;
  TimeOfDay? lastTime;
  List<String> selectedDays = [];
  String occuranceValue = 'Weekly';
  DateModel dateModel = DateModel();

  Future<void> onOneTimeTap() async {
    final result = await showDialog<DateModel>(
        context: context,
        builder: (context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              contentPadding: allPadding12,
              content: DateTimePicker(
                firstTime: firstTime ?? TimeOfDay.now(),
                lastTime: lastTime ??
                    TimeOfDay.fromDateTime(
                        DateTime.now().add(const Duration(hours: 2))),
                singleDate: singleDate ?? DateTime.now(),
              ).width(100.w),
              insetPadding: allPadding16,
            ));
    if (result != null) {
      setState(() {
        dateModel = result;
        singleDate = dateModel.firstDate!;
        firstTime = dateModel.firstTime!;
        lastTime = dateModel.lastTime!;
      });
    }
  }

  Future<void> onRecurringTap() async {
    final result = await showDialog<DateModel>(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        content: RecurringDateTimePicker(
          startdate: startDate ?? DateTime.now(),
          enddate: endDate ?? DateTime.now().add(const Duration(hours: 24)),
          firstTime: firstTime ?? TimeOfDay.now(),
          lastTime: lastTime ??
              TimeOfDay.fromDateTime(
                  DateTime.now().add(const Duration(hours: 2))),
          occuranceValue: occuranceValue,
          selectedDays: selectedDays,
        ).width(100.w),
        contentPadding: allPadding12,
        insetPadding: allPadding16,
      ),
    );
    if (result != null) {
      setState(() {
        dateModel = result;
        startDate = dateModel.firstDate!;
        endDate = dateModel.lastDate!;
        firstTime = dateModel.firstTime!;
        lastTime = dateModel.lastTime!;
        occuranceValue = dateModel.occuranceValue!;
        selectedDays = dateModel.selectedDays!;
      });
    }
  }

  Widget oneTimescheduleDate() => InkWell(
        onTap: onOneTimeTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule Date',
              style: AppTextStyle.tinySMRegular.copyWith(color: darkText),
            ),
            verticalMargin12,
            scheduling(
                'Date: ',
                singleDate != null
                    ? DateFormat.yMMMd().format(singleDate!)
                    : ''),
            verticalMargin12,
            scheduling(
                'Time: ',
                firstTime != null && lastTime != null
                    ? '${firstTime!.format(context)} to ${lastTime!.format(context)}'
                    : ''),
            verticalMargin12,
            scheduling(
                'Day: ',
                singleDate != null
                    ? DateFormat('EEEE').format(singleDate!)
                    : ''),
            verticalMargin20,
          ],
        ),
      );

  Widget recurringScheduleDate() => InkWell(
        onTap: onRecurringTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Schedule Date',
              style: AppTextStyle.tinySMRegular.copyWith(color: darkText),
            ),
            verticalMargin12,
            scheduling('Occurrence: ', occuranceValue),
            verticalMargin12,
            scheduling(
                'Date: ',
                startDate != null && endDate != null
                    ? '${DateFormat.yMMMd().format(startDate!)} to ${DateFormat.yMMMd().format(endDate!)}'
                    : ''),
            verticalMargin12,
            scheduling(
                'Time: ',
                firstTime != null && lastTime != null
                    ? '${firstTime?.format(context)} to ${lastTime?.format(context)}'
                    : ''),
            verticalMargin12,
            scheduling(
                'Repeats on: ',
                selectedDays
                    .toString()
                    .replaceAll('[', '')
                    .replaceAll(']', '')),
            verticalMargin20,
          ],
        ),
      );

  Widget uploadImage() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload Image',
            style: AppTextStyle.tinySMRegular.copyWith(color: darkText),
          ),
          verticalMargin8,
          Row(
            children: [
              Image.asset(
                Assets.images.addImage.path,
                height: 16,
                width: 16,
              ),
              horizontalMargin8,
              SizedBox(
                height: 42,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: pickedImageList.length,
                        itemBuilder: (context, index) => ImageItemWidget(
                          image: pickedImageList[index],
                          onPressed: () {
                            pickedImageList.removeAt(index);
                            setState(() {});
                          },
                        ),
                      ),
                      Container(
                        height: 42,
                        width: 42,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: lightPrimary),
                        child: InkWell(
                          onTap: () async {
                            final list = await AppImagePicker()
                                .showAppImagePicker(context: context);
                            pickedImageList.addAll(list);
                            if (mounted) {
                              setState(() {});
                            }
                          },
                          child: const Icon(
                            Icons.add,
                            size: 24,
                            color: colorPrimary,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      );
}

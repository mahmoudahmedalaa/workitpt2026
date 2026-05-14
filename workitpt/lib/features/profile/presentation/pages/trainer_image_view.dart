import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/core/utils/dialog_utils.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/utils/app_image_picker.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/base_view.dart';
import '../../data/models/file_upload_model.dart';
import '../../data/models/profile_model.dart';
import '../bloc/profile_bloc.dart';

@RoutePage()
class TrainerImageView extends StatefulWidget {
  final ProfileModel profileModel;
  final List<String> images;
  const TrainerImageView(
      {super.key, required this.images, required this.profileModel});

  @override
  State<TrainerImageView> createState() => _TrainerImageViewState();
}

class _TrainerImageViewState extends State<TrainerImageView> {
  List<File>? fileList = [];
  List<String> imageList = [];

  ProfileBloc profileBloc = getIt<ProfileBloc>();

  Future<void> onImageSelect() async {
    final image = await AppImagePicker().appImagePick(context: context);
    if (image != null) {
      setState(() {
        fileList!.add(image);
        imageList.add(image.path);
      });
    }
  }

  void setImageList() {
    if (widget.images.isNotEmpty) {
      setState(() {
        imageList = widget.images.map(concatImageUrl).toList();
      });
    }
  }

  void updateProfile() {
    profileBloc.add(
      ProfileEvent.updateProfile(
        ProfileModel(
          trainerInfo: TrainerInfo(
            gender: widget.profileModel.trainerInfo?.gender,
            location: widget.profileModel.trainerInfo?.location,
            emergencyContact: widget.profileModel.trainerInfo?.emergencyContact,
            contactNumber: widget.profileModel.trainerInfo?.contactNumber,
            countryCode: widget.profileModel.trainerInfo?.countryCode,
            country: widget.profileModel.trainerInfo?.country,
            dob: widget.profileModel.trainerInfo?.dob,
            experience: widget.profileModel.trainerInfo?.experience,
            state: widget.profileModel.trainerInfo?.state,
            certification: widget.profileModel.trainerInfo?.certification,
            specialization: widget.profileModel.trainerInfo?.specialization,
            medicalCondition: widget.profileModel.trainerInfo?.medicalCondition,
            introduction: widget.profileModel.trainerInfo?.introduction,
            images: imageList,
          ),
        ),
      ),
    );
  }

  void updateTrainerImages() {
    if (fileList!.isNotEmpty) {
      profileBloc.add(
        ProfileEvent.uploadMultipleImage(
          FileUploadModel(
            files: fileList!.map((e) => e.path).toList(),
          ),
        ),
      );
    } else {
      updateProfile();
    }
  }

  int removeCounter = 0;

  @override
  void initState() {
    setImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider<ProfileBloc>(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onUpdateProfileSuccess: (model) {
                EasyLoading.showSuccess(removeCounter > 0
                    ? 'Image Removed Successfully'
                    : 'Image Uploaded Successfully.');
                removeCounter = 0;
                EasyLoading.dismiss();
                context.router.pop(model);
              },
              onUploadMultipleImageSuccess: (model) {
                print(model);
                setState(() {
                  imageList
                    ..removeWhere((element) => !element.contains('https'))
                    ..addAll(model.path!.map(concatImageUrl));
                });
                updateProfile();
              },
            );
          },
          child: BaseView(
            titleText: 'Trainer Images',
            appBarColor: Colors.white,
            elevation: 0,
            onBackCallback: () async {
              if (removeCounter > 0) {
                return (await showAlertDialog(
                  context: context,
                  message: 'All the saved data would be lost. Are you sure?',
                  okBtnHandler: () {
                    context.router.pop(true);
                  },
                  cancelBtnHandler: () {
                    context.router.pop(false);
                  },
                ));
              }

              return true;
            },
            body: Column(
              children: <Widget>[
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: imageList.length >= 12
                      ? imageList.length
                      : imageList.length + 1,
                  itemBuilder: (context, index) => imageList.isEmpty
                      ? const AddImageWidget().gestures(onTap: onImageSelect)
                      : index == imageList.length
                          ? const AddImageWidget()
                              .gestures(onTap: onImageSelect)
                          : Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                if (imageList[index].contains('https'))
                                  Image.network(
                                    imageList[index],
                                    fit: BoxFit.cover,
                                  )
                                else
                                  Image.file(
                                    fileList!.firstWhere((element) =>
                                        element.path == imageList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    color: colorPrimary,
                                  ).gestures(onTap: () {
                                    setState(() {
                                      if (imageList[index].contains('https')) {
                                        removeCounter++;
                                      }
                                      fileList!.removeWhere((element) =>
                                          element.path == imageList[index]);
                                      imageList.removeAt(index);
                                    });
                                  }),
                                )
                              ],
                            ),
                ).expanded(),
                AppButton(
                  buttonText:
                      removeCounter > 0 ? 'Remove Images' : 'Upload Images',
                  suffixWidget: const SizedBox(),
                  onPressed: updateTrainerImages,
                ),
                SizedBox(
                  height: MediaQuery.of(context).padding.bottom,
                )
              ],
            ),
          ),
        ),
      );
}

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        color: const Color(0xfffef1e8),
        child: Image.asset(
          Assets.icons.add.path,
          color: colorPrimary,
        ),
      );
}

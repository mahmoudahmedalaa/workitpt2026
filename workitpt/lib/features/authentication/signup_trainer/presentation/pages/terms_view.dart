import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../../profile/data/models/file_upload_model.dart';
import '../../../../profile/data/models/profile_model.dart';
import '../../../../profile/presentation/bloc/profile_bloc.dart';

@RoutePage()
class TermsView extends StatefulWidget {
  final ProfileModel profileModel;
  final List<File?> fileList;
  const TermsView(
      {super.key, required this.profileModel, required this.fileList});

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  // ScrollController controller = ScrollController();
  final WebViewController controller = WebViewController();
  ProfileBloc profileBloc = getIt<ProfileBloc>();
  List<String> certificationList = [];

  @override
  Widget build(BuildContext context) => BaseView(
        hideAppBar: true,
        padding: EdgeInsets.zero,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // SizedBox(
            //   height: MediaQuery.of(context).padding.top + 16,
            // ),
            // Text(
            //   'Terms and Conditions',
            //   style: AppTextStyle.titleMDMedium,
            // ),
            // Text(
            //   'Last Revised: December 16, 2013',
            //   style: AppTextStyle.bodySMRegular.copyWith(
            //     color: darkText,
            //     height: 1.80,
            //     letterSpacing: 0.24,
            //   ),
            // ),
            // verticalMargin32,
            // RawScrollbar(
            //   controller: controller,
            //   thickness: 5,
            //   thumbColor: colorPrimary,
            //   trackColor: colorAccent,
            //   // trackBorderColor: Colors.red,
            //   trackRadius: const Radius.circular(8),
            //   radius: const Radius.circular(8),
            //   padding: EdgeInsets.zero,
            //   child: ListView(
            //     physics: const AlwaysScrollableScrollPhysics(),
            //     padding: const EdgeInsets.only(right: 10),
            //     controller: controller,
            //     children: [
            //       Text(
            //         'Welcome to www.lorem-ipsum.info. This site is provided as a service to our visitors and may be used for informational purposes only. Because the Terms and Conditions contain legal obligations, please read them carefully',
            //         textAlign: TextAlign.justify,
            //         style: AppTextStyle.bodyMDRegular.copyWith(
            //           color: const Color(0xFF6A6A6A),
            //           fontWeight: FontWeight.w400,
            //           height: 1.80,
            //           letterSpacing: 0.32,
            //         ),
            //       ),
            //       verticalMargin16,
            //       Text(
            //         '1. YOUR AGREEMENT \nBy using this Site, you agree to be bound by, and to comply with, these Terms and Conditions. If you do not agree to these Terms and Conditions, please do not use this site.',
            //         textAlign: TextAlign.justify,
            //         style: AppTextStyle.bodyMDRegular.copyWith(
            //           color: const Color(0xFF6A6A6A),
            //           fontWeight: FontWeight.w400,
            //           height: 1.80,
            //           letterSpacing: 0.32,
            //         ),
            //       ),
            //       verticalMargin16,
            //       Text(
            //         'PLEASE NOTE: We reserve the right, at our sole discretion, to change, modify or otherwise alter these Terms and Conditions at any time. Unless otherwise indicated, amendments will',
            //         textAlign: TextAlign.justify,
            //         style: AppTextStyle.bodyMDRegular.copyWith(
            //           color: const Color(0xFF6A6A6A),
            //           fontWeight: FontWeight.w400,
            //           height: 1.80,
            //           letterSpacing: 0.32,
            //         ),
            //       ),
            //       verticalMargin16,
            //       Text(
            //         'PLEASE NOTE: We reserve the right, at our sole discretion, to change, modify or otherwise alter these Terms and Conditions at any time. Unless otherwise indicated, amendments will',
            //         textAlign: TextAlign.justify,
            //         style: AppTextStyle.bodyMDRegular.copyWith(
            //           color: const Color(0xFF6A6A6A),
            //           fontWeight: FontWeight.w400,
            //           height: 1.80,
            //           letterSpacing: 0.32,
            //         ),
            //       ),
            //       verticalMargin16,
            //       Text(
            //         'PLEASE NOTE: We reserve the right, at our sole discretion, to change, modify or otherwise alter these Terms and Conditions at any time. Unless otherwise indicated, amendments will',
            //         textAlign: TextAlign.justify,
            //         style: AppTextStyle.bodyMDRegular.copyWith(
            //           color: const Color(0xFF6A6A6A),
            //           fontWeight: FontWeight.w400,
            //           height: 1.80,
            //           letterSpacing: 0.32,
            //         ),
            //       ),
            //     ],
            //   ),
            // ).expanded(),
            WebViewWidget(
              controller: controller
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..loadRequest(
                  Uri.parse(
                      'https://workitpt.goswivt.com/terms-and-conditions'),
                ),
            ).padding(vertical: 16).expanded(),
            BlocProvider(
              create: (context) => profileBloc,
              child: BlocListener<ProfileBloc, ProfileState>(
                listener: (context, state) {
                  state.whenOrNull(
                    onLoading: () {
                      EasyLoading.show(dismissOnTap: true);
                    },
                    onUpdateProfileSuccess: (user) {
                      context.router.popAndPush(
                        AllDoneRoute(
                          role: user.role!,
                          desc:
                              'Congratulations! The account has been submitted for approval and we will reach out to you within hours.',
                        ),
                      );
                      EasyLoading.showSuccess('All done successfully');
                    },
                    onFailure: (message) {
                      EasyLoading.showError(message!);
                    },
                    onUploadMultipleImageSuccess: (model) {
                      EasyLoading.dismiss();
                      setState(() {
                        certificationList = model.path!;
                      });
                      print(certificationList);
                      final newModel = ProfileModel(
                        profileCompleted: true,
                        trainerInfo: TrainerInfo(
                          gender: widget.profileModel.trainerInfo?.gender,
                          location: widget.profileModel.trainerInfo?.location,
                          emergencyContact:
                              widget.profileModel.trainerInfo?.emergencyContact,
                          contactNumber:
                              widget.profileModel.trainerInfo?.contactNumber,
                          countryCode:
                              widget.profileModel.trainerInfo?.countryCode,
                          country: widget.profileModel.trainerInfo?.country,
                          dob: widget.profileModel.trainerInfo?.dob,
                          experience:
                              widget.profileModel.trainerInfo?.experience,
                          state: widget.profileModel.trainerInfo?.state,
                          certification: certificationList,
                          specialization:
                              widget.profileModel.trainerInfo?.specialization,
                          medicalCondition:
                              widget.profileModel.trainerInfo?.medicalCondition,
                          introduction:
                              widget.profileModel.trainerInfo?.introduction,
                        ),
                      );
                      profileBloc.add(ProfileEvent.updateProfile(
                        newModel,
                      ));
                    },
                  );
                },
                child: Row(
                  children: <Widget>[
                    AppButton(
                      buttonText: 'Decline',
                      textColor: blackText,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      backgroundColor: colorLightGrey,
                      suffixWidget: const Icon(
                        Icons.disabled_by_default_outlined,
                        color: blackText,
                      ),
                    ).expanded(flex: 1),
                    horizontalMargin24,
                    AppButton(
                      buttonText: 'Accept',
                      onPressed: () {
                        if (widget.fileList.isEmpty) {
                          profileBloc.add(ProfileEvent.updateProfile(
                            widget.profileModel,
                          ));
                        } else {
                          profileBloc.add(
                            ProfileEvent.uploadMultipleImage(
                              FileUploadModel(
                                files: widget.fileList
                                    .map((e) => e!.path)
                                    .toList(),
                              ),
                            ),
                          );
                        }
                      },
                      suffixWidget: const Icon(
                        Icons.check_box_outlined,
                        color: Colors.white,
                      ),
                    ).expanded(flex: 1),
                  ],
                ).padding(bottom: MediaQuery.of(context).padding.bottom),
              ),
            ),
          ],
        ),
      );
}

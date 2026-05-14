import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/typography.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/concat_image_url.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../../data/models/profile_model.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/account_tile.dart';

class AccountItem {
  final String prefixIcon;
  final String title;
  final bool isTrainer;

  AccountItem({
    required this.prefixIcon,
    required this.title,
    this.isTrainer = false,
  });
}

@RoutePage()
class ProfileView extends StatefulWidget {
  final ValueNotifier<bool> isTrainerApproved;

  const ProfileView({super.key, required this.isTrainerApproved});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late List<AccountItem> items = [
    AccountItem(prefixIcon: Assets.icons.userEdit.path, title: 'Edit Profile'),
    AccountItem(
        prefixIcon: Assets.icons.password.path, title: 'Change Password'),
    AccountItem(prefixIcon: Assets.icons.deviceMessage.path, title: 'Help'),
    AccountItem(
      prefixIcon: Assets.icons.trash.path,
      title: 'Delete this Account',
    ),
  ];

  ProfileModel? profileModel;
  ProfileBloc profileBloc;
  String? role;

  Future<void> logout() async {
    Navigator.pop(context);
    await EasyLoading.show();
    await getIt<ISessionManager>().clearSession().then(
          (value) => EasyLoading.showSuccess('Logged out successfully'),
        );
    await context.router.pushAndPopUntil(LoginRoute(), predicate: (_) => false);
  }

  Future<void> getUserRole() async {
    final userModel = await getIt<ISessionManager>().getCurrentUser();
    setState(() {
      role = userModel!.role;
    });
  }

  String getMessage() {
    switch (profileModel!.trainerInfo?.verificationStatus) {
      case 'INACTIVE':
        return profileModel?.trainerInfo?.blockerDetails ?? '';
      case 'BANNED':
        return profileModel?.trainerInfo?.blockerDetails ?? '';
      case 'PENDING':
        return 'Pending approval from admin';
      default:
        return 'Please add necessary information and submit for approval.';
    }
  }

  bool isPending() =>
      profileModel!.role == 'TRAINER' &&
      profileModel!.trainerInfo?.verificationStatus == 'PENDING';

  bool isActive() =>
      profileModel!.role == 'TRAINER' &&
      profileModel!.trainerInfo?.verificationStatus == 'ACTIVE';

  Color getColor() {
    final status = profileModel!.profileCompleted!
        ? profileModel!.trainerInfo!.verificationStatus
        : 'INACTIVE';
    switch (status) {
      case 'INACTIVE':
        return Color(0xffff5b71);
      case 'BANNED':
        return Color(0xffff5b71);
      case 'PENDING':
        return Color(0xffffc746);
      default:
        return Color(0xffff5b71);
    }
  }

  Future<void> _pullRefresh() async {
    profileBloc.add(const ProfileEvent.getProfile());
  }

  _ProfileViewState() : profileBloc = getIt<ProfileBloc>();

  List<String> imageList = [];

  @override
  void initState() {
    getUserRole();
    profileBloc.add(const ProfileEvent.getProfile());
    super.initState();
  }

  void setImageList() {
    if (role == 'TRAINER') {
      if (profileModel?.trainerInfo?.images != null) {
        setState(() {
          imageList =
              profileModel!.trainerInfo!.images!.map(concatImageUrl).toList();
        });
      }
    }
  }

  onAddImage() async {
    await context.router
        .push(
      TrainerImageRoute(
        images: profileModel?.trainerInfo?.images ?? [],
        profileModel: profileModel!,
      ),
    )
        .then((value) {
      if (value != null) {
        setState(() {
          profileModel = value as ProfileModel;
          setImageList();
        });
      }
    });
    ;
  }

  @override
  Widget build(BuildContext context) => BlocProvider<ProfileBloc>(
        create: (context) => profileBloc,
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () {
                EasyLoading.show(dismissOnTap: true);
              },
              onGetProfileSuccess: (model) {
                EasyLoading.dismiss();
                setState(() {
                  profileModel = model;
                  if (model.role == 'TRAINER') {
                    widget.isTrainerApproved.value =
                        model.trainerInfo?.verificationStatus == 'ACTIVE';
                    setImageList();
                  } else {
                    widget.isTrainerApproved.value = true;
                  }
                });
              },
              onDeleteAccountSuccess: (msg) async {
                EasyLoading.showSuccess(msg);
                await getIt<ISessionManager>().clearSession().then(
                      (value) => EasyLoading.showSuccess(
                          'Account deleted successfully'),
                    );
                await context.router
                    .pushAndPopUntil(LoginRoute(), predicate: (_) => false);
              },
              onFailure: (message) {
                EasyLoading.showError(message!);
              },
            );
          },
          builder: (context, state) => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: const Text('My Account'),
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            body: RefreshIndicator.adaptive(
              onRefresh: _pullRefresh,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    if (profileModel?.role == 'TRAINER')
                      Visibility(
                        visible:
                            profileModel?.trainerInfo?.verificationStatus !=
                                'ACTIVE',
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Status: ',
                                  children: [
                                    TextSpan(
                                      text:
                                          '${profileModel?.trainerInfo?.verificationStatus ?? 'INACTIVE'}',
                                      style: AppTextStyle.bodyMDBold.copyWith(
                                        color: getColor(),
                                      ),
                                    ),
                                  ],
                                ),
                                style: AppTextStyle.bodyMDBold,
                              ),
                              verticalMargin4,
                              Text(
                                getMessage(),
                                style: AppTextStyle.bodySMRegular.copyWith(
                                  color: getColor(),
                                ),
                              ),
                            ],
                          ).padding(all: 16).width(100.w),
                        ),
                      ),
                    if (profileModel?.role == 'TRAINER' &&
                        profileModel?.trainerInfo?.verificationStatus !=
                            'ACTIVE')
                      verticalMargin24
                    else
                      const SizedBox.shrink(),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: profileModel?.avatar != null
                            ? CachedNetworkImageProvider(
                                concatImageUrl(profileModel!.avatar!),
                              )
                            : null,
                      ),
                      title: Text(
                        profileModel?.firstName ?? '',
                        style: AppTextStyle.headlineSMSemiBold.copyWith(
                          color: const Color(0xFF1A1A1A),
                          height: 0.06,
                        ),
                      ).padding(bottom: 10),
                      subtitle: SizedBox(
                        height: 20,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              profileModel?.email ?? '',
                              style: AppTextStyle.bodySMRegular.copyWith(
                                color: darkText,
                                letterSpacing: 0.24,
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              width: 6,
                              color: darkText,
                            ),
                            Text(
                              profileModel?.role == 'TRAINER'
                                  ? profileModel?.trainerInfo?.contactNumber ??
                                      ''
                                  : profileModel?.customerInfo?.contactNumber ??
                                      '',
                              style: AppTextStyle.bodySMRegular.copyWith(
                                color: darkText,
                                letterSpacing: 0.24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                    verticalMargin16,
                    if (profileModel?.role == 'TRAINER' &&
                        profileModel?.trainerInfo?.verificationStatus ==
                            'ACTIVE')
                      InkWell(
                        onTap: onAddImage,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Images',
                              style: AppTextStyle.subHeadLgSemiBold,
                            ),
                            if (imageList.length != 0)
                              Row(
                                children: [
                                  Text(
                                    'View All',
                                    style: AppTextStyle.subHeadSMRegular
                                        .copyWith(color: colorPrimary),
                                  ),
                                  horizontalMargin4,
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: colorPrimary,
                                    size: 16,
                                  )
                                ],
                              )
                          ],
                        ),
                      ),
                    if (profileModel?.role == 'TRAINER' &&
                        profileModel?.trainerInfo?.verificationStatus ==
                            'ACTIVE')
                      verticalMargin12,
                    if (profileModel?.role == 'TRAINER' &&
                        profileModel?.trainerInfo?.verificationStatus ==
                            'ACTIVE')
                      imageList.length != 0
                          ? GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                              ),
                              itemCount:
                                  imageList.length > 6 ? 6 : imageList.length,
                              itemBuilder: (context, index) =>
                                  CachedNetworkImage(
                                imageUrl: imageList[index],
                                fit: BoxFit.cover,
                              ),
                            )
                          : Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    margin: allPadding12,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 24),
                                    decoration: BoxDecoration(
                                        color: buttonBG,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      'No Images Added, \nTo add images click on the button.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.bodySMRegular
                                          .copyWith(color: darkText),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: colorPrimary,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Add Featured Images',
                                    style: AppTextStyle.bodySMRegular
                                        .copyWith(color: colorPrimary),
                                  ),
                                ).gestures(onTap: onAddImage),
                              ],
                            ),
                    if (profileModel?.role == 'TRAINER' &&
                        profileModel?.trainerInfo?.verificationStatus ==
                            'ACTIVE')
                      verticalMargin12,
                    if (profileModel?.role == 'TRAINER' &&
                        profileModel?.trainerInfo?.verificationStatus ==
                            'ACTIVE')
                      Divider(
                        height: 10,
                        thickness: 0.5,
                      ),
                    verticalMargin12,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) =>
                          role == 'USER' && items[index].isTrainer
                              ? const SizedBox()
                              : AccountTile(
                                  item: items[index],
                                  onTap: () async {
                                    switch (index) {
                                      case 0:
                                        if (!isPending())
                                          await context.router
                                              .push(EditProfileRoute(
                                            model: profileModel!,
                                          ))
                                              .then((value) {
                                            if (value != null) {
                                              setState(() {
                                                profileModel =
                                                    value as ProfileModel;
                                              });
                                            }
                                          });
                                        break;
                                      case 1:
                                        await context.router
                                            .push(const ChangePasswordRoute());
                                        break;
                                      case 2:
                                        await context.router
                                            .push(const ProfileHelpRoute());
                                        break;
                                      case 3:
                                        showAlertDialog(
                                          context: context,
                                          message:
                                              'This account will be deleted permanently. Are you sure?',
                                          okBtnHandler: () {
                                            profileBloc.add(
                                                ProfileEvent.deleteAccount());
                                          },
                                        );
                                        break;
                                    }
                                  },
                                ),
                    ),
                    AccountTile(
                      item: AccountItem(
                        prefixIcon: Assets.icons.logout.path,
                        title: 'Logout',
                      ),
                      onTap: () {
                        showAlertDialog(
                          context: context,
                          message: 'Are you sure you want to logout?',
                          okBtnHandler: logout,
                          icon: Assets.icons.logout.path,
                        );
                      },
                    ),
                  ],
                ).padding(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ),
      );
}

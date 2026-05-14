import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/export.dart';
import '../../../../core/injection/injection.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/base_view.dart';
import '../../../authentication/session/i_session_manager.dart';
import '../../data/models/change_password_model.dart';
import '../bloc/profile_bloc.dart';

@RoutePage()
class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();

  final confirmPasswordController = TextEditingController();

  final newPasswordController = TextEditingController();

  final oldPasswordController = TextEditingController();

  ProfileBloc profileBloc;

  _ChangePasswordViewState() : profileBloc = getIt<ProfileBloc>();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => profileBloc,
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: EasyLoading.show,
              onChangePasswordSuccess: (model) {
                EasyLoading.showSuccess('Password changed successfully');
                getIt<ISessionManager>().clearSession();
                context.router
                    .pushAndPopUntil(LoginRoute(), predicate: (_) => false);
              },
            );
          },
          child: BaseView(
            titleText: 'Change password',
            appBarColor: Colors.white,
            color: Colors.white,
            elevation: 0,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            body: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        const SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Text(
                            'Your new password must be different from the pervious used password',
                            style: TextStyle(
                              color: darkText,
                              fontSize: 12,
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              height: 1.80,
                              letterSpacing: 0.24,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        AppTextField(
                          prefixIcon: Assets.icons.password.path,
                          obscureText: true,
                          controller: oldPasswordController,
                          labelText: 'Old Password',
                          textColor: colorPrimary,
                          textInputType: TextInputType.visiblePassword,
                          validator: validatePassword,
                        ),
                        AppTextField(
                          prefixIcon: Assets.icons.password.path,
                          obscureText: true,
                          controller: newPasswordController,
                          labelText: 'New Password',
                          textColor: colorPrimary,
                          textInputType: TextInputType.visiblePassword,
                          validator: validatePassword,
                        ),
                        AppTextField(
                          prefixIcon: Assets.icons.password.path,
                          obscureText: true,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null) {
                              return 'Please enter password';
                            } else if (value.isEmpty) {
                              return 'Please enter password';
                            } else if (value.length < 8) {
                              return 'Password must be 8 characters long';
                            } else if (value != newPasswordController.text) {
                              return "Password doesn't match";
                            } else {
                              return null;
                            }
                          },
                          labelText: 'Confirm Password',
                          textColor: colorPrimary,
                        ),
                      ],
                    ),
                  ).expanded(),
                  AppButton(
                    buttonText: 'Change Password',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        profileBloc.add(
                          ProfileEvent.changePassword(
                            ChangePasswordModel(
                              newPassword: newPasswordController.text,
                              oldPassword: oldPasswordController.text,
                            ),
                          ),
                        );
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
        ),
      );
}

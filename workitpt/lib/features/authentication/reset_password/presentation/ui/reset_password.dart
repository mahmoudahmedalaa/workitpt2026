import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/spacing_utils.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/base_view.dart';
import '../../../forgot_password/presentation/bloc/forgot_password_bloc.dart';

@RoutePage()
class ResetPasswordView extends StatefulWidget {
  final String token;
  const ResetPasswordView({super.key, required this.token});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  _ResetPasswordViewState() : forgotPasswordBloc = getIt<ForgotPasswordBloc>();
  final ForgotPasswordBloc forgotPasswordBloc;
  final confirmPasswordController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: forgotPasswordBloc,
        listener: (context, state) {
          state.whenOrNull(initial: () {
            print(widget.token);
          }, onLoading: () {
            EasyLoading.show(dismissOnTap: true);
          }, onChangePasswordSuccess: (response) {
            EasyLoading.showSuccess('Success');
            context.router.replaceAll([LoginRoute()]);
          }, onFailure: (response) {
            EasyLoading.showError(response);
          });
        },
        child: BaseView(
          hideAppBar: true,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(space: 100),
              const Text(
                'Reset Password',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 24,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  height: 1.20,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(
                width: double.infinity,
                height: 40,
                child: Text(
                  'Enter your email for the verification process, we will send  OTP code to your email',
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
                validator: validatePassword,
                controller: passwordController,
                labelText: 'Enter Password',
                textColor: colorPrimary,
                textInputType: TextInputType.visiblePassword,
              ),
              AppTextField(
                prefixIcon: Assets.icons.password.path,
                obscureText: true,
                controller: confirmPasswordController,
                validator: (val) {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    return 'Password does not match';
                  } else {
                    return validatePassword(val);
                  }
                },
                labelText: 'Confirm Password',
                textColor: colorPrimary,
              ),
              AppButton(
                buttonText: 'Continue',
                onPressed: () {
                  forgotPasswordBloc.add(ForgotPasswordEvent.changePassword(
                      token: widget.token,
                      newPassword: passwordController.text));
                  // context.router.push(const OTPVerificationRoute());
                },
              )
            ],
          ),
        ),
      );
}

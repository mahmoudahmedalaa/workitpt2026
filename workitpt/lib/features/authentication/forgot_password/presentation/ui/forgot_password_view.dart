import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/base_view.dart';
import '../bloc/forgot_password_bloc.dart';

@RoutePage()
class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  _ForgotPasswordViewState() : forgotPasswordBloc = getIt<ForgotPasswordBloc>();
  final TextEditingController emailController = TextEditingController();
  final ForgotPasswordBloc forgotPasswordBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => forgotPasswordBloc,
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () {
                EasyLoading.show();
              },
              onSuccess: (response) {
                EasyLoading.showSuccess('Success');
                context.router.push(OTPVerificationRoute(
                    keyData: response.keyData!, email: emailController.text));
              },
              onFailure: (message) {
                EasyLoading.showError(message);
              },
            );
          },
          child: BaseView(
            hideAppBar: false,
            appBarColor: Colors.white,
            color: Colors.white,
            elevation: 0,
            titleText: '',
            body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: blackText,
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
                    controller: emailController,
                    labelText: 'Enter Email Address',
                    validator: validateEmail,
                    prefixIcon: Assets.icons.email.path,
                    textColor: colorPrimary,
                    textInputType: TextInputType.emailAddress,
                  ),
                  AppButton(
                    buttonText: 'Continue',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        forgotPasswordBloc.add(
                          ForgotPasswordEvent.requestPassword(
                            email: emailController.text,
                          ),
                        );
                      } else {
                        EasyLoading.showInfo(
                          'Please enter correct email address.',
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

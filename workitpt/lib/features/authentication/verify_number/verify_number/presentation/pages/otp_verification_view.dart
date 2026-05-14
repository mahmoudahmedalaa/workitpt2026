import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../../../config/typography.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/export.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../forgot_password/presentation/bloc/forgot_password_bloc.dart';

@RoutePage()
class OTPVerificationView extends StatefulWidget {
  const OTPVerificationView({super.key, this.email, required this.keyData});
  final String? email;
  final String keyData;

  @override
  State<OTPVerificationView> createState() => _OTPVerificationViewState();
}

class _OTPVerificationViewState extends State<OTPVerificationView> {
  _OTPVerificationViewState()
      : forgotPasswordBloc = getIt<ForgotPasswordBloc>();
  final ForgotPasswordBloc forgotPasswordBloc;
  late StreamController<ErrorAnimationType> errorController;
  final TextEditingController tokenController = TextEditingController();

  final CountdownController _timerController =
      new CountdownController(autoStart: true);

  String _getTimerText(int time) {
    return '${(time ~/ 60).toString().padLeft(2, '0')}: ${(time % 60).toString().padLeft(2, '0')}';
  }

  late String key;

  @override
  void initState() {
    key = widget.keyData;
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        bloc: forgotPasswordBloc,
        listener: (context, state) {
          state.whenOrNull(
            onLoading: () {
              EasyLoading.show();
            },
            onTokenSuccess: (state) {
              EasyLoading.showSuccess('Success');
              context.router.push(ResetPasswordRoute(token: state.token!));
            },
            onSuccess: (response) {
              _timerController.restart();
              setState(() {
                key = response.keyData!;
              });
              EasyLoading.showSuccess('OTP sent on mail successfully');
            },
            onFailure: (message) {
              EasyLoading.showError(message);
            },
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'OTP Verification',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 24,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                    height: 1.20,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    'Enter the OTP code that you received on your email:${secureEmailFormatter(email: widget.email!)} ',
                    style: const TextStyle(
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
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  animationType: AnimationType.fade,
                  errorTextSpace: 0,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    selectedColor: colorPrimary,
                    fieldHeight: 55,
                    fieldWidth: 40,
                    inactiveFillColor: Colors.white,
                    activeColor: colorPrimary,
                    inactiveColor: darkText,
                    selectedFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    errorBorderColor: Colors.red,
                  ),
                  cursorColor: colorPrimary,
                  animationDuration: const Duration(milliseconds: 300),
                  textStyle: const TextStyle(
                    color: colorPrimary,
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: tokenController,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    debugPrint('Completed');
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    debugPrint('Allowing to paste $text');
                    return true;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Text(
                      'Didn’t get a code? ',
                      style: TextStyle(
                        color: darkText,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: 1.80,
                        letterSpacing: 0.24,
                      ),
                    ),
                    const Text(
                      'Resend',
                      style: TextStyle(
                        color: colorPrimary,
                        fontSize: 12,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        height: 1.80,
                        letterSpacing: 0.24,
                      ),
                    ).gestures(
                      onTap: () {
                        forgotPasswordBloc.add(
                          ForgotPasswordEvent.requestPassword(
                            email: widget.email!,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    Countdown(
                      controller: _timerController,
                      seconds: (5 * 60),
                      build: (_, double time) => Text(
                        _getTimerText(time.toInt()),
                        style: AppTextStyle.bodySMRegular
                            .copyWith(color: darkText),
                      ),
                      interval: Duration(seconds: 1),
                      onFinished: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('Timer is done!'),
                        //   ),
                        // );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                AppButton(
                  buttonText: 'Submit',
                  onPressed: () {
                    forgotPasswordBloc.add(ForgotPasswordEvent.requestToken(
                        code: tokenController.text, key: key));
                  },
                )
              ],
            ).padding(top: 72, horizontal: 24, bottom: 24),
          ),
        ),
      );
}

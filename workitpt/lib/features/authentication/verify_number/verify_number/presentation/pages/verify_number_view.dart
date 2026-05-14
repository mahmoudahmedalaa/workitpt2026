import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:workitpt/features/authentication/login/data/models/user_model.dart';
import 'package:workitpt/features/authentication/session/i_session_manager.dart';

import '../../../../../../config/typography.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/export.dart';
import '../../../../../../core/injection/injection.dart';
import '../../../../../../core/routes/app_router.dart';
import '../../../../../../core/utils/app_utils.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../bloc/verify_number_bloc.dart';

@RoutePage()
class VerifyNumberView extends StatefulWidget {
  final String mail;
  final String role;
  const VerifyNumberView({
    super.key,
    required this.role,
    required this.mail,
  });

  @override
  VerifyNumberViewState createState() => VerifyNumberViewState();
}

class VerifyNumberViewState extends State<VerifyNumberView> {
  late StreamController<ErrorAnimationType> errorController;
  final TextEditingController tokenController = TextEditingController();

  final CountdownController _timerController =
      new CountdownController(autoStart: true);

  String _getTimerText(int time) {
    return '${(time ~/ 60).toString().padLeft(2, '0')}: ${(time % 60).toString().padLeft(2, '0')}';
  }

  _updateUser() async {
    var user = await getIt<ISessionManager>().getCurrentUser();
    if (user != null) {
      final newUser = UserModel(
        role: user.role,
        id: user.id,
        name: user.name,
        email: user.email,
        status: 'ACTIVE',
        userSecret: user.userSecret,
        accessToken: user.accessToken,
        authProvider: user.authProvider,
      );

      await getIt<ISessionManager>().saveCurrentUser(user: newUser);
    }
  }

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  VerifyNumberBloc verifyBloc = getIt<VerifyNumberBloc>();
  String otpKey = '';

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<VerifyNumberBloc>(
        create: (context) => verifyBloc..add(const VerifyNumberEvent.getOTP()),
        child: BlocListener<VerifyNumberBloc, VerifyNumberState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () {
                EasyLoading.show();
              },
              onGetOTPSuccess: (model) {
                otpKey = model.key!;
                _timerController.restart();
                EasyLoading.showSuccess('OTP sent on mail successfully');
              },
              onFailure: (message) {
                EasyLoading.showError(message!);
              },
              onVerifyOTPSuccess: () {
                EasyLoading.dismiss();
                _updateUser();
                context.router.popAndPush(OTPVerifiedRoute(role: widget.role));
              },
            );
          },
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'OTP Verification',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        height: 1.20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    'Enter the OTP code that you received on your email:${widget.mail != '' ? secureEmailFormatter(email: widget.mail) : ''}  ',
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
                    fontSize: 24,
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
                        verifyBloc.add(const VerifyNumberEvent.getOTP());
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
                    verifyBloc.add(
                      VerifyNumberEvent.verifyOTP(
                        otpKey,
                        tokenController.text,
                      ),
                    );
                  },
                )
              ],
            ).padding(top: 72, horizontal: 24, bottom: 24),
          ),
        ),
      ));
}

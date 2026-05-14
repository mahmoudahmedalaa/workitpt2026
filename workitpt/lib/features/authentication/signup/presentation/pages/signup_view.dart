import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/typography.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/spacing.dart';
import '../../../../../core/export.dart';
import '../../../../../core/injection/injection.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/utils/spacing_utils.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../bloc/user_signup_bloc.dart';

@RoutePage()
class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  SignupViewState createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  UserSignupBloc signBloc = getIt<UserSignupBloc>();
  final _formKey = GlobalKey<FormState>();

  bool isTrainer = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  bool userSelected = true;
  bool acceptPolicy = false;
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => signBloc,
        child: BlocListener<UserSignupBloc, UserSignupState>(
          listener: (context, state) {
            state.whenOrNull(
              onLoading: () {
                EasyLoading.show(dismissOnTap: true);
              },
              onSuccess: (user) {
                EasyLoading.showInfo('Please check OTP in your gmail...');
                context.pushRoute(VerifyNumberRoute(
                    role: userSelected ? 'USER' : 'TRAINER',
                    mail: emailController.text));
                EasyLoading.dismiss();
              },
              onFailure: (message) {
                EasyLoading.showToast(message,
                    toastPosition: EasyLoadingToastPosition.bottom);
              },
            );
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: horizontalPadding24,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Getting Started',
                        style: AppTextStyle.titleMDSemiBold,
                      ),
                      verticalSpacing(space: 8),
                      Text('Create an account to continue!',
                          style: AppTextStyle.bodySMRegular
                              .copyWith(color: darkText)),
                      verticalMargin40,
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: shadeContainerColor,
                            borderRadius: BorderRadius.circular(500)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 32,
                                decoration: userSelected
                                    ? BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: colorPrimary),
                                        borderRadius: BorderRadius.circular(50),
                                      )
                                    : const BoxDecoration(),
                                child: Center(
                                    child: Text(
                                  'User',
                                  style: AppTextStyle.bodySMSemiBold.copyWith(
                                      color: userSelected
                                          ? colorPrimary
                                          : blackText),
                                )),
                              ).gestures(
                                onTap: () {
                                  setState(() {
                                    userSelected = true;
                                    isTrainer = false;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 32,
                                decoration: userSelected
                                    ? const BoxDecoration()
                                    : BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: colorPrimary),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                child: Center(
                                    child: Text(
                                  'Trainer',
                                  style: AppTextStyle.bodySMSemiBold.copyWith(
                                      color: userSelected
                                          ? blackText
                                          : colorPrimary),
                                )),
                              ).gestures(
                                onTap: () {
                                  setState(() {
                                    isTrainer = true;
                                    userSelected = false;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalMargin24,
                      AppTextField(
                        controller: nameController,
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        validator: (value) => validateNotEmpty(
                          value,
                          'Full Name',
                        ),
                        prefixIcon: Assets.icons.profile.path,
                        textColor: colorPrimary,
                        textInputType: TextInputType.name,
                      ),
                      AppTextField(
                        controller: emailController,
                        labelText: 'Email Address',
                        hintText: 'Enter your email address',
                        prefixIcon: Assets.icons.email.path,
                        validator: validateEmail,
                        textColor: colorPrimary,
                        textInputType: TextInputType.emailAddress,
                      ),
                      AppTextField(
                        prefixIcon: Assets.icons.password.path,
                        obscureText: true,
                        controller: passwordController,
                        labelText: 'Enter Password',
                        validator: validatePassword,
                        hintText: 'Enter your password',
                        textColor: colorPrimary,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      AppTextField(
                        prefixIcon: Assets.icons.password.path,
                        obscureText: true,
                        controller: confirmPasswordController,
                        hintText: 'Enter your password same as above',
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter password';
                          } else if (value.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 8) {
                            return 'Password must be 8 characters long';
                          } else if (value != passwordController.text) {
                            return "Password doesn't match";
                          } else {
                            return null;
                          }
                        },
                        labelText: 'Confirm Password',
                        textColor: colorPrimary,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      if (isTrainer)
                        const SizedBox.shrink()
                      else
                        Row(
                          children: [
                            CupertinoCheckbox(
                              activeColor: colorPrimary,
                              value: acceptPolicy,
                              onChanged: (value) {
                                setState(() {
                                  acceptPolicy = value!;
                                });
                              },
                            ),
                            RichText(
                              text: TextSpan(
                                style: AppTextStyle.bodySMRegular,
                                children: <TextSpan>[
                                  const TextSpan(text: 'Accept '),
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: AppTextStyle.bodySMRegular
                                        .copyWith(color: colorPrimary),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.router.push(
                                          TermsWebRoute(
                                            url:
                                                'https://workitpt.goswivt.com/terms-and-conditions',
                                          ),
                                        );
                                      },
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: AppTextStyle.bodySMRegular
                                        .copyWith(color: colorPrimary),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.router.push(
                                          TermsWebRoute(
                                            url:
                                                'https://workitpt.goswivt.com/privacy-policy',
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      AppButton(
                        buttonWidth: ButtonWidth.large,
                        buttonText: 'Sign Up',
                        backgroundColor: userSelected
                            ? (acceptPolicy ? null : Colors.grey)
                            : null,
                        onPressed: userSelected
                            ? (acceptPolicy
                                ? () {
                                    if (_formKey.currentState!.validate()) {
                                      List<String> nameList =
                                          nameController.text.split(' ');
                                      signBloc.add(UserSignupEvent.signUp(
                                        firstName: nameList[0],
                                        lastName: nameList.length > 1
                                            ? nameList[1]
                                            : '',
                                        email: emailController.text,
                                        password: passwordController.text,
                                        role: userSelected ? 'USER' : 'TRAINER',
                                      ));
                                    }
                                  }
                                : null)
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  List<String> nameList =
                                      nameController.text.split(' ');
                                  signBloc.add(UserSignupEvent.signUp(
                                      firstName: nameList[0],
                                      lastName: nameList.length > 1
                                          ? nameList[1]
                                          : '',
                                      email: emailController.text,
                                      password: passwordController.text,
                                      role: userSelected ? 'USER' : 'TRAINER'));
                                }
                              },
                      ),
                      // Center(
                      //   child: Stack(
                      //     alignment: Alignment.center,
                      //     children: [
                      //       const Divider(
                      //         thickness: 1, // Customize divider thickness
                      //         color: Colors.grey, // Customize divider color
                      //       ),
                      //       Container(
                      //         color: Colors.white,
                      //         padding: allPadding8,
                      //         child: const Text(
                      //           'Or', // Your text here
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Text(
                      //   'Sign Up with',
                      //   textAlign: TextAlign.center,
                      //   style: AppTextStyle.titleSMBold,
                      // ).center().padding(all: 10),
                      // Center(
                      //   child: Row(
                      //     mainAxisSize: MainAxisSize.min,
                      //     children: [
                      //       SvgIconButton(
                      //         svgPath: 'assets/icons/fb_icon.svg',
                      //         onPressed: () {},
                      //       ),
                      //       horizontalMargin16,
                      //       SvgIconButton(
                      //         svgPath: 'assets/icons/google_icon.svg',
                      //         onPressed: () {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          context.router.replace(LoginRoute());
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Already have an account?',
                              style: AppTextStyle.bodyMDRegular.copyWith(
                                color: darkText,
                              ),
                            ),
                            Text(
                              ' Login',
                              style: AppTextStyle.bodyMDRegular
                                  .copyWith(color: colorPrimary),
                            ),
                          ],
                        ),
                      ),
                      verticalMargin24
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

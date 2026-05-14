import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workitpt/config/typography.dart';
import 'package:workitpt/core/export.dart';
import 'package:workitpt/core/injection/injection.dart';
import 'package:workitpt/core/utils/validator.dart';
import 'package:workitpt/core/widgets/app_button.dart';
import 'package:workitpt/core/widgets/app_text_field.dart';
import 'package:workitpt/core/widgets/base_view.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../data/models/contact_us_model.dart';
import '../bloc/profile_bloc.dart';

@RoutePage()
class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final profileBloc = getIt<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.whenOrNull(
            onLoading: EasyLoading.show,
            onContactUsSuccess: (msg) {
              EasyLoading.showSuccess(
                  'Your message has been sent successfully');
              context.router.pop();
            },
            onFailure: (message) => EasyLoading.showError(message!),
          );
        },
        child: BaseView(
          titleText: 'Contact Us',
          appBarColor: Colors.white,
          color: Colors.white,
          elevation: 0,
          body: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      'For you queries please fill the following form and our team will reach out to you shortly',
                      style:
                          AppTextStyle.bodyMDRegular.copyWith(color: darkText),
                    ),
                    verticalMargin24,
                    AppTextField(
                      controller: nameController,
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      prefixIcon: Assets.icons.profile.path,
                      validator: (value) =>
                          validateNotEmpty(value, 'Full Name'),
                    ),
                    AppTextField(
                      controller: emailController,
                      labelText: 'Email',
                      hintText: 'Enter your email address',
                      prefixIcon: Assets.icons.email.path,
                      validator: validateEmail,
                    ),
                    AppTextField(
                      controller: messageController,
                      labelText: 'Your Message',
                      hintText: 'Enter you message here',
                      maxLine: 4,
                      validator: (value) => validateNotEmpty(value, 'Message'),
                    ),
                  ],
                ),
              ).scrollable().expanded(),
              verticalMargin24,
              AppButton(
                buttonText: 'Submit',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    profileBloc.add(
                      ProfileEvent.contactUs(
                        ContactUsModel(
                          name: nameController.text,
                          email: emailController.text,
                          message: messageController.text,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

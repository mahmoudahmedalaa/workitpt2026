import 'package:workitpt/core/constants/app_colors.dart';
import 'package:workitpt/core/constants/spacing.dart';
import 'package:workitpt/core/routes/app_router.dart';

import '../../../../config/typography.dart';
import '../../../../core/export.dart';
import '../../../../core/widgets/base_view.dart';

@RoutePage()
class ProfileHelpView extends StatefulWidget {
  const ProfileHelpView({super.key});

  @override
  State<ProfileHelpView> createState() => _ProfileHelpViewState();
}

class _ProfileHelpViewState extends State<ProfileHelpView> {
  List<String> _helpItems = [
    'About Us',
    'Terms & Conditions',
    'Privacy Policy',
    'Frequently Asked Questions',
    'Contact Us',
  ];

  @override
  Widget build(BuildContext context) => BaseView(
        color: Colors.white,
        titleText: 'Help',
        appBarColor: Colors.white,
        elevation: 0,
        padding: allPadding24,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                itemCount: _helpItems.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => const Divider(
                  height: 10,
                  thickness: 0.2,
                ).padding(bottom: 10),
                itemBuilder: (context, index) => ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    _helpItems[index],
                    style: AppTextStyle.bodyMDRegular.copyWith(
                      color: darkText,
                      letterSpacing: 0.24,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_outlined,
                  ),
                  onTap: () {
                    switch (index) {
                      case 0:
                        context.router.push(
                          TermsWebRoute(
                            url: 'https://workitpt.goswivt.com/about',
                          ),
                        );
                        break;
                      case 1:
                        context.router.push(
                          TermsWebRoute(
                            url:
                                'https://workitpt.goswivt.com/terms-and-conditions',
                          ),
                        );
                        break;
                      case 2:
                        context.router.push(
                          TermsWebRoute(
                            url: 'https://workitpt.goswivt.com/privacypolicy',
                          ),
                        );
                        break;
                      case 3:
                        context.router.push(
                          TermsWebRoute(
                            url: 'https://workitpt.goswivt.com/faq',
                          ),
                        );
                        break;
                      case 4:
                        context.router.push(ContactRoute());
                        break;
                    }
                  },
                ),
              ),
              const Divider(
                height: 10,
                thickness: 0.2,
              ),
            ],
          ),
        ),
      );
}

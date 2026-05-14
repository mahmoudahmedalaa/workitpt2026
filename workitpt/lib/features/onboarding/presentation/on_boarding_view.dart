import '../../../core/export.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/widgets/app_button.dart';
import 'intro_slider_widget.dart';

@RoutePage()
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  OnBoardingViewState createState() => OnBoardingViewState();
}

class OnBoardingViewState extends State<OnBoardingView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
              ),
              child: const Text('Skip').gestures(onTap: () {
                context.router.replace(LoginRoute());
              }),
            ).alignment(Alignment.centerRight),
            PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (page) {
                setState(() {
                  index = page;
                });
              },
              children: [
                IntroSliderWidget(
                  title: 'Unlock Your Fitness Potential',
                  image: Assets.images.onboard1.path,
                  pageController: _pageController,
                  subTitle:
                      'Discover tailored workouts that align with your goals and preferences. With our intuitive platform, you can easily filter through a variety of sessions near you, selecting the ones that match your preferred workout type, location, intensity, and more. Your fitness journey starts here.',
                  index: 0,
                ),
                IntroSliderWidget(
                  title: 'Empowering Your Fitness Journey',
                  image: Assets.images.onboard2.path,
                  pageController: _pageController,
                  subTitle:
                      'Take control of your workouts, whether you prefer the gym, home, an outdoor setting or online. Our diverse range of sessions, led by expert trainers, are designed to fit your schedule and accommodate your busy lifestyle. Get ready to redefine what\'s possible for your fitness, wherever you are.',
                  index: 1,
                ),
                IntroSliderWidget(
                  title: 'Unleash Your Fitness Potential',
                  image: Assets.images.onboard3.path,
                  pageController: _pageController,
                  subTitle:
                      'Explore limitless workout possibilities. Filter sessions based on location, price, difficulty, and more. Elevate your fitness journey like never before.',
                  index: 2,
                ),
              ],
            ).expanded(),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 15),
              child: AppButton(
                buttonText: 'Next',
                onPressed: () {
                  if (index < 2) {
                    _pageController.animateToPage(index + 1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    context.router.replace(LoginRoute());
                  }
                },
              ),
            ),
          ],
        ),
      );
}

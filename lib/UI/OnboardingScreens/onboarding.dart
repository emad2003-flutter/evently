import 'package:evently/UI/Auth/Login%20Page/login_page.dart';
import 'package:evently/UI/Widgets/custom_on_boarding.dart';
import 'package:evently/Utils/app_assets.dart';
import 'package:evently/Utils/app_colors.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  static const String routeName = '/onboarding';
  //keep track of the Next page
  bool isLastPage = false;
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    // get device width and height
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // design width and height
    var designWidth = 393;
    var designHeight = 841;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * width / designWidth),
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  widget.isLastPage = (index == 2);
                });
              },
              children: [
                CustomOnBoarding(
                  title: AppLocalizations.of(context)!.on_boardin_title2,
                  description: AppLocalizations.of(
                    context,
                  )!.on_bording_pragraph_2,
                  imagePath: AppAssets.onBording2,
                ),
                CustomOnBoarding(
                  title: AppLocalizations.of(context)!.on_boardin_title3,
                  description: AppLocalizations.of(
                    context,
                  )!.on_bording_pragraph_3,
                  imagePath: AppAssets.onBording3,
                ),
                CustomOnBoarding(
                  title: AppLocalizations.of(context)!.on_boardin_title4,
                  description: AppLocalizations.of(
                    context,
                  )!.on_bording_pragraph_4,
                  imagePath: AppAssets.onBording4,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Image.asset(AppAssets.backIC),
                    ),
                    Expanded(
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.primaryLight,
                            dotColor: AppColors.blackColor,
                            dotHeight: 8,
                            dotWidth: 8,
                            expansionFactor: 2.5,
                            spacing: 8,
                          ),
                        ),
                      ),
                    ),
                    widget.isLastPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                              // Navigate to the next screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: Image.asset(AppAssets.nextIC),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Image.asset(AppAssets.nextIC),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

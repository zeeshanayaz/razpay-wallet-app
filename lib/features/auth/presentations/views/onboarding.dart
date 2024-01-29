import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/constant.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/shared_pref.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _tabController = TabController(length: 3, vsync: this);
      _tabController!.addListener(_handleTabSelection);
    });
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      // backgroundColor: isDark ? darkbgColor : bgColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  onboardItem(
                    image: 'crypto',
                    isDark: isDark,
                    title: 'The Most Trusted & Secure Crypto Wallet',
                    subTitle:
                        'Track more than 100+ crypto coins unders our user-frendly, safe and secure platform',
                  ),
                  onboardItem(
                    image: 'crypto',
                    isDark: isDark,
                    title: 'The Most Trusted & Secure Crypto Wallet',
                    subTitle:
                        'Track more than 100+ crypto coins unders our user-frendly, safe and secure platform',
                  ),
                  onboardItem(
                    image: 'crypto',
                    isDark: isDark,
                    title: 'The Most Trusted & Secure Crypto Wallet',
                    subTitle:
                        'Track more than 100+ crypto coins unders our user-frendly, safe and secure platform',
                  ),
                ],
              ),
            ),
            const SizedBoxH30(),
            Column(
              children: [
                Center(
                  child: TabPageSelector(
                    controller: _tabController,
                    borderStyle: BorderStyle.none,
                    color: isDark ? grey.withOpacity(.2) : grey,
                    selectedColor: primary,
                  ),
                ),
                const SizedBoxH15(),
                _currentIndex != 2
                    ? CustomButton(
                        onPressed: () {
                          _tabController!.animateTo(_currentIndex + 1);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Next',
                              style: textStyle16.copyWith(
                                color: white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBoxW10(),
                            const Icon(
                              Icons.arrow_forward,
                              color: white,
                            ),
                          ],
                        ),
                      )
                    : CustomButton(
                        onPressed: () async {
                          await SharedPref.setBool(kFirstTime, false);
                          Get.toNamed(AppRoutes.login);
                        },
                        text: 'Let\'s Get Started',
                      ),
                const SizedBoxH10(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget onboardItem({
    required String image,
    required bool isDark,
    required String title,
    required String subTitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      await SharedPref.setBool(kFirstTime, false);
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Text(
                      'Skip',
                      style: textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  'assets/images/$image.png',
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textStyle18.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBoxH20(),
                Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: textStyle14.copyWith(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

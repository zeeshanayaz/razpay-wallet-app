// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/divider.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/features/profile/presentations/widgets/addbottonsheet.dart';
import 'package:razpay/features/profile/presentations/widgets/profile_link.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper.dart';
import '../../controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBoxW15(),
        leadingWidth: 15,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Center(
                  child: Column(
                    children: [
                      profileController.profileData.value.avatar == null
                          ? CircleAvatar(
                              radius: 40.0,
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                              backgroundColor: Colors.transparent,
                            )
                          : CircleAvatar(
                              radius: 40.0,
                              backgroundImage: NetworkImage(
                                  profileController.profileData.value.avatar ??
                                      ''),
                              backgroundColor: Colors.transparent,
                            ),
                      SizedBoxH10(),
                      Text(
                        '${profileController.profileData.value.firstName ?? ''} ${profileController.profileData.value.lastName ?? ''}',
                        style: textStyle18.copyWith(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBoxH20(),
              // Container(
              //   decoration: BoxDecoration(
              //     color: primary,
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         backgroundColor: white.withOpacity(.1),
              //         child: SvgPicture.asset('assets/icons/crown.svg'),
              //       ),
              //       SizedBoxW15(),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             'Invite Friends',
              //             style: textStyle14.copyWith(
              //                 fontWeight: FontWeight.w700, color: white),
              //           ),
              //           SizedBoxH10(),
              //           Text(
              //             'Invite your friends and get rewarded',
              //             style: textStyle12.copyWith(
              //                 fontWeight: FontWeight.w400, color: white),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              // SizedBoxH20(),
              // Text(
              //   'General',
              //   style: textStyle14.copyWith(fontWeight: FontWeight.w400),
              // ),
              // const SizedBoxH10(),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.myAccount);
                },
                child: ProfileLinkTile(
                  iconData: IconlyBold.profile,
                  text: 'My Account',
                  icon: true,
                ),
              ),
              LineDivider(
                isDark: isDark,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.changePassword);
                },
                child: ProfileLinkTile(
                  iconData: IconlyBold.password,
                  text: 'Change password',
                  icon: true,
                ),
              ),
              LineDivider(
                isDark: isDark,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.createPin,
                    arguments: {
                      'type': 'update',
                    },);
                },
                child: ProfileLinkTile(
                  iconData: IconlyBold.password,
                  text: 'Change pin',
                  icon: true,
                  iswitchValue: false,
                ),
              ),
              LineDivider(
                isDark: isDark,
              ),
              InkWell(
                onTap: () async {
                  BaseHelper.launchBrowser('https://razpaywallet.com/contact/');
                },
                child: ProfileLinkTile(
                  iconData: IconlyBold.info_square,
                  text: 'Help and support',
                  icon: true,
                ),
              ),
              LineDivider(
                isDark: isDark,
              ),
              InkWell(
                onTap: () async {
                  BaseHelper.launchBrowser('https://razpaywallet.com/policy/');
                },
                child: ProfileLinkTile(
                  iconData: IconlyBold.paper,
                  text: 'Legal, Privacy & Policy',
                  icon: true,
                ),
              ),
              LineDivider(
                isDark: isDark,
              ),
              InkWell(
                onTap: () async {
                  BaseHelper.launchBrowser('https://razpaywallet.com/support');
                },
                child: ProfileLinkTile(
                  iconData: IconlyBold.chat,
                  text: 'Livechat support',
                  icon: true,
                ),
              ),
              LineDivider(
                isDark: isDark,
              ),
              ProfileLinkTile(
                iconData: Icons.light_mode,
                text: 'Dark mode',
                icon: false,
              ),
              LineDivider(
                isDark: isDark,
              ),
              InkWell(
                onTap: () => profileController.logout(),
                child: ProfileLinkTile(
                  iconData: IconlyBold.logout,
                  text: 'Sign out',
                  icon: true,
                ),
              ),
              SizedBoxH20(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        showDragHandle: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return AddModalButtonSheet();
                        },
                      );
                    },
                    child: Text(
                      'Delete Account',
                      style: textStyle18.copyWith(
                          fontSize: 20,
                          color: red,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

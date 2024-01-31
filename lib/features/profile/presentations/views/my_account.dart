// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/features/profile/presentations/widgets/colcon.dart';

import '../../controller/profile_controller.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                ],
              ),
              SizedBoxH40(),
              Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Text(
                      'We get your personal information from the verification process. If you want to make changes, please contact support',
                      style: textStyle12.copyWith(color: white),
                    ),
                  ],
                ),
              ),
              SizedBoxH40(),
              Container2(
                  avatar: 'assets/icons/white.svg',
                  text: 'First Name',
                  text2: profileController.profileData.value.firstName ?? ''),
              const SizedBoxH20(),
              Container2(
                  avatar: 'assets/icons/white.svg',
                  text: 'Last Name',
                  text2: profileController.profileData.value.lastName ?? ''),
              const SizedBoxH20(),
              Container2(
                  avatar: 'assets/icons/pin.svg',
                  text: 'Email Address',
                  text2: profileController.profileData.value.email ?? ''),
              const SizedBoxH20(),
              Container2(
                  avatar: 'assets/icons/house.svg',
                  text: 'Email Address',
                  text2: profileController.profileData.value.country ?? '')
            ],
          ),
        ),
      ),
    );
  }
}

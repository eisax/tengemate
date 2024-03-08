import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/util/images.dart';
import 'package:tengemate/view/screens/profile/widget/clickable_profile_widget.dart';
import 'package:tengemate/view/widgets/dialog_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.paddingSizeDefault,
          ),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Theme.of(context)
                                .dividerColor
                                .withOpacity(0.25)))),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "Profile",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: Get.width,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: Get.width,
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingSizeExtraSmall),
                          child: Column(
                            children: [
                              ClickableProfileWidget(
                                icon: Images.profile,
                                title: "My profile",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.notifications,
                                title: "Notifications",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.location,
                                title: "My address",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.help,
                                title: "Help & Support",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.security,
                                title: "Account & Security",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.appearance,
                                title: "App Appearance",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.data,
                                title: "Third Party Integrations",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.analysis,
                                title: "Data & Analysis",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.subscribe,
                                title: "Subscription",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                icon: Images.discover,
                                title: "Discovery Preferences",
                                onClick: () {},
                              ),
                              ClickableProfileWidget(
                                isLogout: true,
                                icon: Images.logout,
                                title: "Logout",
                                onClick: () {
                                  _showConfirmationDialog(
                                    context,
                                    'Are you sure you want to delete this item?',
                                    () async {
                                      DialogHelper.showGeneralDialog(
                                        context,
                                        child: Container(),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
    BuildContext context,
    String message,
    Function onConfirm,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.transparent,
          content:
              SingleChildScrollView(child: _DialogWidget(context, onConfirm)),
        );
      },
    );
  }

  Widget _DialogWidget(BuildContext context, Function onConfirm) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
          color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Are you sure you want to logout?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: Dimensions.paddingSizeExtraLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: Theme.of(context).primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(Dimensions.radiusDefault),
                        ),
                      ),
                      shadowColor:Colors.transparent,
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "No",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: Dimensions.paddingSizeSmall,
              ),
              SizedBox(
                width: Dimensions.paddingSizeSmall,
              ),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.normal),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radiusDefault),
                        ),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () async {
                      onConfirm();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Yes",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

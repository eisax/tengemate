import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tengemate/controller/auth_controller.dart';
import 'package:tengemate/helper/route_helper.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/view/widgets/dialog_helper.dart';
import 'package:tengemate/view/widgets/loading_widget.dart';
import 'package:tengemate/view/widgets/textinput_widget.dart';
import 'package:tengemate/view/widgets/toaster_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController useremail = TextEditingController();
  TextEditingController userpass = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    useremail.dispose();
    userpass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.1,
                padding: EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimensions.defaultSpacing,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeDefault),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Sign in to your\nAccount",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                  color: Colors.black,
                                  fontSize: Dimensions.fontSizeHeaders,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: Dimensions.defaultSpacing,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Dimensions.fontSizeDefault,
                                          fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                    height: Dimensions.defaultSpacing),
                                CustomTextField(
                                  borderRadius: Dimensions.radiusDefault,
                                  hintText: 'example@tengemate.com',
                                  controller: useremail,
                                  fillColor: Colors.transparent,
                                  inputType: TextInputType.emailAddress,
                                  // errorText: "Please enter your email",
                                  borderColor: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.defaultSpacing,
                            ),
                            const SizedBox(
                              height: Dimensions.defaultSpacing,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(
                                          color: Colors.black,
                                          fontSize: Dimensions.fontSizeDefault,
                                          fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                    height: Dimensions.defaultSpacing),
                                CustomTextField(
                                  borderRadius: Dimensions.radiusDefault,
                                  hintText: 'Password', controller: userpass,
                                  fillColor: Colors.transparent,
                                  isPassword: true,
                                  inputType: TextInputType.phone,
                                  // errorText: "Please enter your email",
                                  borderColor: Colors.black.withOpacity(0.5),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: Dimensions.defaultSpacing,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
              Center(
                child: SizedBox(
                  width: Get.width * 0.95,
                  height: 50,
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
                      shadowColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () async {
                      Get.toNamed(RouteHelper.dashboard);
                      if (useremail.text.isEmpty) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser enter your email')
                            .show(context);
                      } else if (userpass.text.isEmpty) {
                        Toaster(
                                type: ToasterType.error,
                                message: 'Pleaser enter your password')
                            .show(context);
                      } else {
                        DialogHelper.showGeneralDialog(
                          context,
                          child: LoadingWidget(),
                        );
                        authController
                            .login(context,
                                email: useremail.text, password: userpass.text)
                            .then((res) => {
                                  if (res)
                                    {
                                      Toaster(
                                              type: ToasterType.success,
                                              message:
                                                  'User Authenticated Successfuly')
                                          .show(context)
                                    }
                                  else
                                    {
                                      Toaster(
                                              type: ToasterType.error,
                                              message:
                                                  'Wrong email or password')
                                          .show(context)
                                    }
                                });
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Sign In',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: Colors.black,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontSize: Dimensions.fontSizeDefault,
                                fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteHelper.register);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
              const SizedBox(
                height: Dimensions.defaultSpacing,
              ),
            ],
          ),
        ),
    
      );
    });
  }
}

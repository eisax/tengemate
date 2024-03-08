import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/util/images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isByLocation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              //header
              Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi, Kudah Ndhlovu",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Harare",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.radiusDefault),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .shadowColor
                                      .withOpacity(0.25),
                                  spreadRadius: 5,
                                  blurRadius: 50,
                                  offset: Offset(0, 0),
                                ),
                              ]),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                Images.search,
                                width: 24,
                                height: 25,
                                color: Theme.of(context).dividerColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.defaultSpacing,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radiusDefault),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.25),
                                spreadRadius: 5,
                                blurRadius: 50,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                Images.options,
                                width: 24,
                                height: 25,
                                color: Theme.of(context).dividerColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //switch buttons

              Container(
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          animationDuration: Duration(milliseconds: 500),
                          elevation: 0,
                          backgroundColor: !isByLocation
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).highlightColor,
                          textStyle: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(Dimensions.radiusExtraLarge),
                              bottomLeft:
                                  Radius.circular(Dimensions.radiusExtraLarge),
                            ),
                          ),
                          shadowColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          setState(() {
                            isByLocation = false;
                          });
                        },
                        child: Text(
                          "For you",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: !isByLocation
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          animationDuration: Duration(milliseconds: 300),
                          elevation: 0,
                          backgroundColor: isByLocation
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).highlightColor,
                          textStyle: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(Dimensions.radiusExtraLarge),
                              bottomRight:
                                  Radius.circular(Dimensions.radiusExtraLarge),
                            ),
                          ),
                          shadowColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          setState(() {
                            isByLocation = true;
                          });
                        },
                        child: Text(
                          "Near by",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: isByLocation
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //switch section
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(Dimensions.paddingSizeSmall),
                  padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/users/user1.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radiusExtraLarge,
                      ),
                      color: Theme.of(context).hintColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: Get.width * 0.25,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusExtraLarge)),
                            ),
                            Container(
                              width: Get.width * 0.25,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusExtraLarge)),
                            ),
                            Container(
                              width: Get.width * 0.25,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radiusExtraLarge)),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //distance
                          Container(
                            width: Get.width * 0.25,
                            padding: EdgeInsets.all(
                                Dimensions.paddingSizeExtraSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radiusDefault),
                                color: Colors.white.withOpacity(0.5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  Images.sendtilt,
                                  width: 18,
                                  height: 18,
                                  color: Colors.white,
                                ),
                                Text(
                                  "2.5 Km",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeExtraSmall,
                          ),
                          //user name
                          Text(
                            "Zara Larson, 18",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeExtraSmall,
                          ),
                          //user name
                          Text(
                            "Harare, Zimbabwe",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: Dimensions.paddingSizeExtraSmall,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              Dimensions.radiusDefault),
                                        ),
                                      ),
                                      shadowColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () async {},
                                    child: Icon(Icons.close,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.defaultSpacing,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              Dimensions.radiusDefault),
                                        ),
                                      ),
                                      shadowColor:
                                          Theme.of(context).primaryColor,
                                    ),
                                    onPressed: () async {},
                                    child: Icon(Icons.favorite,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

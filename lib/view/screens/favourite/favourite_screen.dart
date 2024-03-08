import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tengemate/data/model/response/user_model.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/util/images.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isLinkes = false;
  final List<User> users = [
    User(
        name: 'John Mavicl',
        distance: 3,
        image: "assets/images/users/user1.jpg",),
    User(name: 'Slay Joe', distance: 5, image: "assets/images/users/user2.jpg",),
    User(
        name: 'Martin Chika',
        distance: 6,
        image: "assets/images/users/user3.jpg"),
    User(
        name: 'Evelyn Ray',
        distance: 8,
        image: "assets/images/users/user4.jpg"),
    User(
        name: 'Christopher Makel',
        distance: 22,
        image: "assets/images/users/user5.jpg"),
    User(
        name: 'Sasha Martins',
        distance: 9,
        image: "assets/images/users/user6.jpg"),
    User(
        name: 'Pinkie Masiiwa',
        distance: 1,
        image: "assets/images/users/user7.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              //app bar
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          "Matches",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Images.search,
                          width: 24,
                          height: 25,
                          color: Theme.of(context).dividerColor,
                        ),
                        SizedBox(
                          width: Dimensions.paddingSizeSmall,
                        ),
                        SvgPicture.asset(
                          Images.options,
                          width: 24,
                          height: 25,
                          color: Theme.of(context).dividerColor,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          animationDuration: Duration(milliseconds: 500),
                          elevation: 0,
                          backgroundColor: !isLinkes
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).highlightColor,
                          textStyle: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(Dimensions.radiusDefault),
                              bottomLeft:
                                  Radius.circular(Dimensions.radiusDefault),
                            ),
                          ),
                          shadowColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          setState(() {
                            isLinkes = false;
                          });
                        },
                        child: Text(
                          "Likes(33)",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color:
                                      !isLinkes ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          animationDuration: Duration(milliseconds: 300),
                          elevation: 0,
                          backgroundColor: isLinkes
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).highlightColor,
                          textStyle: const TextStyle(
                              color: Colors.white, fontStyle: FontStyle.normal),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(Dimensions.radiusDefault),
                              bottomRight:
                                  Radius.circular(Dimensions.radiusDefault),
                            ),
                          ),
                          shadowColor: Theme.of(context).primaryColor,
                        ),
                        onPressed: () async {
                          setState(() {
                            isLinkes = true;
                          });
                        },
                        child: Text(
                          "Super Likes(8)",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                  color: isLinkes ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GridTile(
                        child: UserTile(user: users[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final User user;

  UserTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(user.image), fit: BoxFit.cover),
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radiusLarge)),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(
              Dimensions.paddingSizeDefault,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radiusLarge,
              ),
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.transparent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${user.name} (18)",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),

                //user name
                Text(
                  "Harare, Zimbabwe",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

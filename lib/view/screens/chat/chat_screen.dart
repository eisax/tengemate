import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tengemate/data/model/response/chat_model.dart';
import 'package:tengemate/util/dimensiona.dart';
import 'package:tengemate/util/images.dart';
import 'package:tengemate/view/widgets/bouncing_scroll_physics.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> chats = [
    Chat(
        sender: 'Alice',
        message: 'Hi, how are you?',
        timestamp: DateTime.now(),
        icon: "assets/images/users/user1.jpg",
        isOnline: false),
    Chat(
        sender: 'Magrieta',
        message: 'na, I did not',
        timestamp: DateTime.now(),
        icon: "assets/images/users/user2.jpg",
        isOnline: false),
    Chat(
      sender: 'Manroe',
      message: 'okay, its fine',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user3.jpg",
    ),
    Chat(
      sender: 'Jloe',
      message: 'we shouln\'t',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user4.jpg",
    ),
    Chat(
      sender: 'Ajax',
      message: 'really, I never guessed do lol',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user5.jpg",
    ),
    Chat(
      sender: 'Pewrishmit',
      message: 'no, I dont think we should go around teling people about this',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user6.jpg",
    ),
    Chat(
      sender: 'Rev',
      message: 'f**ck you dude, I dont care',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user7.jpg",
    ),
    Chat(
        sender: 'Big O Star',
        message: 'How are you?',
        timestamp: DateTime.now(),
        icon: "assets/images/users/user8.jpg",
        isOnline: false),
    Chat(
      sender: 'Jasmine',
      message: 'hey, how are you?',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user9.jpg",
    ),
    Chat(
      sender: 'Emeliana',
      message: 'ok',
      timestamp: DateTime.now(),
      icon: "assets/images/users/user10.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimensions.paddingSizeDefault),
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            //app bar
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              width: Get.width,
              decoration: BoxDecoration(),
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
                        "Chats",
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
                        Images.menuvertical,
                        width: 24,
                        height: 18,
                        color: Theme.of(context).dividerColor,
                      ),
                    ],
                  )
                ],
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Now Active",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),

                  //user name
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 8,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: Dimensions.paddingSizeDefault),
              child: ScrollConfiguration(
                behavior: BouncingScrollBehavior(),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: chats.map((chat) {
                      return chat.isOnline
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeSmall),
                              child: ProfileWidget(
                                  image: chat.icon, isOnline: chat.isOnline),
                            )
                          : Container();
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
              width: Get.width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                    color: Theme.of(context).dividerColor.withOpacity(0.25),
                  ),
                ),
              ),
            ),

            //body
            Expanded(
              child: Container(
                width: Get.width,
                padding: EdgeInsets.all(Dimensions.paddingSizeDefault),
                child: ScrollConfiguration(
                  behavior: BouncingScrollBehavior(),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: chats.map((chat) {
                        return ChatWidget(chat: chat);
                      }).toList(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class ChatWidget extends StatelessWidget {
  final Chat chat;
  const ChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileWidget(image: chat.icon, isOnline: chat.isOnline),
          SizedBox(
            width: Dimensions.defaultSpacing,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      chat.sender,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeExtraSmall,
                    ),
                    Text(
                      chat.message.length > 15
                          ? chat.message.substring(0, 16) + "..."
                          : chat.message,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      chat.timestamp.hour.toString() +
                          ":" +
                          chat.timestamp.minute.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: Dimensions.paddingSizeExtraSmall,
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        "3",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  final String? image;
  final bool isOnline;
  const ProfileWidget({super.key, this.image, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).highlightColor.withOpacity(0.1),
          backgroundImage: AssetImage(
            image ?? Images.profiledefault,
          ),
        ),
        Positioned(
            child: Container(
          width: 50,
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              isOnline
                  ? Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                              Dimensions.radiusExtraLarge)),
                      child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Theme.of(context).primaryColor),
                    )
                  : Container()
            ],
          ),
        ))
      ],
    );
  }
}

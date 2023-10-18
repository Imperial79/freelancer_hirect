import 'package:flutter/material.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/components.dart';
import 'package:freelancer_app/utils/sdp.dart';

class ChatUI extends StatefulWidget {
  const ChatUI({super.key});

  @override
  State<ChatUI> createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(context),
            height20,
            // Expanded(
            //   child: GridView.builder(
            //     shrinkWrap: true,
            //     itemCount: 6,
            //     padding: EdgeInsets.symmetric(horizontal: 15),
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10,
            //       crossAxisSpacing: 10,
            //     ),
            //     itemBuilder: (context, index) {
            //       return categoryTile(index);
            //     },
            //   ),
            // ),

            Expanded(
              child: ListView.builder(
                itemCount: 15,
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) {
                  return chatTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chatTile() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                  ),
                  width10,
                  Flexible(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Avishek Verma',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: sdp(context, 15),
                                ),
                              ),
                              height5,
                              Text(
                                'So, is the deal on !?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade400,
                                  fontSize: sdp(context, 10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '12:00',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // height10,
          height5,
          Divider(
            color: primaryColor.withOpacity(0.6),
            indent: 100,
            endIndent: 100,
          ),
        ],
      ),
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chat',
            style: kTitleStyle(context),
          ),
          Text(
            'Recent chats with clients are shown here',
            style: TextStyle(fontSize: sdp(context, 12)),
          ),
        ],
      ),
    );
  }

  Widget categoryTile(int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: index % 3 == 0
                ? primaryColor.withOpacity(0.7)
                : index % 2 == 0
                    ? kPillButtonColor.withOpacity(0.7)
                    : primaryColorAccent.withOpacity(0.7),
          ),
          color: index % 3 == 0
              ? primaryColor.withOpacity(0.2)
              : index % 2 == 0
                  ? kPillButtonColor.withOpacity(0.2)
                  : primaryColorAccent.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/ui-design.png',
              height: sdp(context, 100),
            ),
            Text("UI Design"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/screens/loginUI.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/components.dart';
import 'package:freelancer_app/utils/sdp.dart';

class WelcomeUI extends StatefulWidget {
  const WelcomeUI({super.key});

  @override
  State<WelcomeUI> createState() => _WelcomeUIState();
}

class _WelcomeUIState extends State<WelcomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/project-management.svg',
                height: sdp(context, 200),
              ),
              Text(
                'Free-lancer',
                style: kTitleStyle(context, fontSize: sdp(context, 40)),
              ),
              Text(
                'Find Projects that fullfills your resume',
                style: kTitleStyle(context),
              ),
              height20,
              ElevatedButton(
                onPressed: () {},
                child: Text('Get Started'),
              ),
              height20,
              Row(
                children: [
                  Text(
                    'Already a user?',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  width10,
                  TextButton(
                    onPressed: () {
                      NavPush(context, LoginUI());
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kPillButtonColor,
                      ),
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

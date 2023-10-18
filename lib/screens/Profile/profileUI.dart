import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/screens/Profile/editProfileUI.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/components.dart';
import 'package:freelancer_app/utils/sdp.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(context),
              height20,
              subHeader('PROJECTS'),
              height10,
              settingsButton(
                iconPath: 'assets/icons/task-completed.svg',
                label: 'Completed Projects',
                subtitle: 'View your recent completed projects',
              ),
              settingsButton(
                iconPath: 'assets/icons/pending.svg',
                label: 'Pending Projects',
                subtitle: 'View your pending projects',
              ),
              height10,
              subHeader('SYSTEM'),
              height10,
              settingsButton(
                iconPath: 'assets/icons/logout.svg',
                label: 'Log-Out',
                subtitle: 'View your pending projects',
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container subHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      color: kScaffoldColorDarker,
      child: Text(
        title,
        style: TextStyle(
          color: primaryColorAccent,
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Padding header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: kTitleStyle(
              context,
              fontSize: sdp(context, 25),
            ),
          ),
          height20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 50,
              ),
              width20,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        NavPush(context, EditProfileUI());
                      },
                      child: Text(
                        'Edit profile',
                        style: TextStyle(
                          color: kPillButtonColor,
                          fontSize: sdp(context, 12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    height10,
                    Text(
                      'Vivek Verma',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: sdp(context, 20),
                      ),
                    ),
                    Text(
                      'I am an Android Developer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sdp(context, 10),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget settingsButton({
    required String label,
    required String subtitle,
    required String iconPath,
    bool isLogout = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: SvgPicture.asset(
                  iconPath,
                  height: sdp(context, 15),
                  colorFilter: ColorFilter.mode(
                    isLogout ? Colors.red : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              width20,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize:
                            isLogout ? sdp(context, 15) : sdp(context, 13),
                        color:
                            isLogout ? Colors.red.shade200 : kPillButtonColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    isLogout
                        ? SizedBox.shrink()
                        : Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: sdp(context, 10),
                            ),
                            textAlign: TextAlign.center,
                          ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: sdp(context, 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

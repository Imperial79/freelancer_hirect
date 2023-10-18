import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/components.dart';

import '../../utils/sdp.dart';

class EditProfileUI extends StatefulWidget {
  const EditProfileUI({super.key});

  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/back-arrow.svg',
                  colorFilter: kSvgColorWhite,
                ),
              ),
              height20,
              Text(
                'Edit Profile',
                style: kTitleStyle(context),
              ),
              height20,
              kTextField(
                context,
                label: 'Name',
                hintText: 'Enter Name',
                keyboardType: TextInputType.text,
              ),
              height20,
              kTextField(
                context,
                label: 'Github Link',
                hintText: '(Optional)',
                keyboardType: TextInputType.text,
              ),
              height20,
              kTextField(
                context,
                label: 'Linkedin Link',
                hintText: '(Optional)',
                keyboardType: TextInputType.text,
              ),
              height20,
              kTextField(
                context,
                label: 'Bio',
                hintText: 'Write an effective bio to attarct more clients ...',
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Update'),
          ),
        ),
      ),
    );
  }
}

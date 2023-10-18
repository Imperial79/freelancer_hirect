import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/screens/proposalUI.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/sdp.dart';

TextStyle kTitleStyle(
  BuildContext context, {
  Color? color,
  FontWeight? fontWeight,
  double? fontSize,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: fontSize ?? sdp(context, 20),
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

TextStyle kSubtitleStyle(
  BuildContext context, {
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: sdp(context, 14),
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

get height5 => SizedBox(height: 5);
get height10 => SizedBox(height: 10);
get height20 => SizedBox(height: 20);
get width5 => SizedBox(width: 5);
get width10 => SizedBox(width: 10);
get width20 => SizedBox(width: 20);

// ignore: non_constant_identifier_names
NavPush(BuildContext context, screen) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => screen));
}

// ignore: non_constant_identifier_names
NavPushReplacement(BuildContext context, screen) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

class Pill {
  static Widget label({
    Widget? icon,
    String? label,
    Color? pillColor,
    Color? labelColor,
  }) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: pillColor ?? kPillButtonColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Padding(padding: EdgeInsets.only(right: 6), child: icon)
                : SizedBox.shrink(),
            Text(
              label ?? 'text',
              style: TextStyle(
                color: labelColor ?? Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget outlinedLabel(
      {Widget? icon, String? label, Color? borderColor}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: borderColor ?? Colors.grey.shade600,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon != null
                ? Padding(padding: EdgeInsets.only(right: 6), child: icon)
                : SizedBox.shrink(),
            Text(
              label ?? 'text',
              style: TextStyle(
                color: Colors.grey.shade100,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget productViewModalSheet() {
  return StatefulBuilder(
    builder: (context, setState) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: kPillButtonColor,
                  elevation: 0,
                  shape: StadiumBorder(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/icons/location.svg'),
                        width5,
                        Text(
                          'India',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                height10,
                Text(
                  'Revamp our E-Commerce Website with a Fresh & Clean UI Design',
                  style: TextStyle(
                    fontSize: sdp(context, 15),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                height10,
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'Posted 23 minutes ago',
                        style: TextStyle(
                          fontSize: sdp(context, 10),
                        ),
                      ),
                    ),
                    bulletSeperator(color: Colors.white),
                    Flexible(
                      child: Text(
                        'Payment Verified',
                        style: TextStyle(
                          fontSize: sdp(context, 10),
                        ),
                      ),
                    ),
                    width5,
                    Icon(
                      Icons.verified,
                      color: kPillButtonColor,
                      size: sdp(context, 10),
                    ),
                  ],
                ),
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    statsCard(
                      context,
                      label: 'Fixed-Price',
                      content: 'INR 20,000',
                      textColor: Colors.white,
                    ),
                    width5,
                    statsCard(
                      context,
                      label: 'Duration',
                      content: '14 Days',
                      textColor: Colors.white,
                    ),
                    width5,
                    statsCard(
                      context,
                      label: 'Proposal',
                      content: '10 - 50',
                      textColor: Colors.white,
                    ),
                  ],
                ),
                height20,
                Text(
                  'Job Description',
                  style: kSubtitleStyle(context, color: Colors.white),
                ),
                height10,
                Text(
                  'Our E-Commerce Website is in need of a revamp and we are looking for a talented UI designer to help us create a fresh UI',
                  style: TextStyle(
                    fontSize: sdp(context, 9),
                  ),
                ),
                height20,
                Text(
                  'Requirements',
                  style: kSubtitleStyle(context, color: Colors.white),
                ),
                height10,
                unorderedList(
                  'Proven Experience as a UI Designer, with a portfolio demonstarting your skills',
                ),
                unorderedList(
                  'Knowledge of design tools such as Figma, Adobe XD, or Sketch',
                ),
                unorderedList(
                  'Familarity with HTML, CSS and Javascript',
                ),
                unorderedList(
                  'Strong communication skills and ability to work with a team',
                ),
                height10,
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 10,
                  children: [
                    Pill.label(
                      label: 'UI Design',
                      labelColor: Colors.black,
                      pillColor: primaryColorAccent,
                    ),
                    Pill.label(
                      label: 'Graphic Design',
                      labelColor: Colors.black,
                      pillColor: primaryColorAccent,
                    ),
                    Pill.label(
                      label: 'Web Design',
                      labelColor: Colors.black,
                      pillColor: primaryColorAccent,
                    ),
                    Pill.label(
                      label: 'HTML',
                      labelColor: Colors.black,
                      pillColor: primaryColorAccent,
                    ),
                    Pill.label(
                      label: 'Adobe XD',
                      labelColor: Colors.black,
                      pillColor: primaryColorAccent,
                    ),
                    Pill.label(
                      label: 'HTML',
                      labelColor: Colors.black,
                      pillColor: primaryColorAccent,
                    ),
                  ],
                ),
                height20,
                Text(
                  'Attachment',
                  style: kSubtitleStyle(context, color: Colors.white),
                ),
                height10,
                attachmentCard(context),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  NavPush(context, ProposalUI());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: primaryColorAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 17),
                ),
                child: Text(
                  'Apply Now',
                  style: TextStyle(
                    color: kScaffoldColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

Container attachmentCard(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: primaryColor,
    ),
    child: Row(
      children: [
        Card(
          elevation: 0,
          color: kPillButtonColor,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: SvgPicture.asset(
              'assets/icons/attachment.svg',
              height: sdp(context, 15),
              colorFilter: ColorFilter.mode(
                kScaffoldColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        width10,
        Flexible(
          child: Text(
            'Design Brief.pdf',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.file_download_outlined,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget productCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
        context: context,
        backgroundColor: kScaffoldColor,
        isDismissible: true,
        constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height * 0.9),
        isScrollControlled: true,
        builder: (context) {
          return productViewModalSheet();
        },
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorScheme.fromSeed(seedColor: primaryColor).secondaryContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: kScaffoldColor,
            elevation: 0,
            shape: StadiumBorder(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    colorFilter: kSvgColorWhite,
                  ),
                  width5,
                  Text(
                    'India',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          height5,
          Text(
            'Revamp our E-Commerce Website with a Fresh & Clean UI Design',
            style: TextStyle(
                fontSize: sdp(context, 13),
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          height10,
          Row(
            children: [
              Flexible(
                child: Text(
                  'Posted 23 minutes ago',
                  style: TextStyle(
                    fontSize: sdp(context, 9),
                    color: Colors.black,
                  ),
                ),
              ),
              bulletSeperator(),
              Flexible(
                child: Text(
                  'Payment Verified',
                  style: TextStyle(
                    fontSize: sdp(context, 9),
                    color: Colors.black,
                  ),
                ),
              ),
              width5,
              Icon(
                Icons.verified,
                color: kScaffoldColor,
                size: sdp(context, 10),
              ),
            ],
          ),
          height10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              statsCard(context, label: 'Fixed-Price', content: 'INR 20,000'),
              width5,
              statsCard(context, label: 'Duration', content: '14 Days'),
              width5,
              statsCard(context, label: 'Proposal', content: '10 - 50'),
            ],
          ),
          height10,
          Text(
            'Our E-Commerce Website is in need of a revamp and we are looking for a talented UI designer to help us create a fresh UI',
            style: TextStyle(
              fontSize: sdp(context, 9),
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          height10,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Pill.label(
                  label: 'UI Design',
                  pillColor: primaryColor,
                ),
                Pill.label(
                  label: 'Graphic Design',
                  pillColor: primaryColor,
                ),
                Pill.label(
                  label: 'Web Design',
                  pillColor: primaryColor,
                ),
                Pill.label(
                  label: 'Figma Design',
                  pillColor: primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget statsCard(BuildContext context,
    {String? content, String? label, Color? textColor}) {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              content ?? '<content>',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: sdp(context, 11),
                color: textColor ?? Colors.black,
              ),
            ),
          ),
          height5,
          Text(
            label ?? '<label>',
            style: TextStyle(
              fontSize: sdp(context, 9),
              color: textColor ?? Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget unorderedList(String text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("• "),
        Expanded(
          child: Text(text),
        ),
      ],
    ),
  );
}

// ignore: non_constant_identifier_names
Widget kTextField(
  BuildContext context, {
  String? label,
  TextEditingController? controller,
  String? hintText,
  TextInputType? keyboardType,
  TextCapitalization textCapitalization = TextCapitalization.none,
  int maxLines = 1,
  int minLines = 1,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label!),
      height10,
      TextField(
        controller: controller,
        cursorColor: primaryColorAccent,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: sdp(context, 10),
          ),
        ),
      ),
    ],
  );
}

Text bulletSeperator({Color? color}) {
  return Text(
    ' • ',
    style: TextStyle(
      color: color ?? Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}

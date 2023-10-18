import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/utils/animated_indexed_stack.dart';
import 'package:freelancer_app/utils/components.dart';
import 'package:freelancer_app/utils/sdp.dart';

import '../utils/colors.dart';

class ProposalUI extends StatefulWidget {
  const ProposalUI({super.key});

  @override
  State<ProposalUI> createState() => _ProposalUIState();
}

class _ProposalUIState extends State<ProposalUI> {
  bool readLess = true;
  int selectedBidType = 0;
  int milestoneCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/back-arrow.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        title: Text(
          'Submit Proposal',
          style: TextStyle(
            fontSize: sdp(context, 13),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/saved.svg',
              height: sdp(context, 15),
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apply to',
              style: TextStyle(
                fontSize: sdp(context, 12),
                fontWeight: FontWeight.w600,
              ),
            ),
            height10,
            projectDetailsCard(context),
            height20,
            Text(
              'Project Bid',
              style: TextStyle(
                fontSize: sdp(context, 12),
                fontWeight: FontWeight.w600,
              ),
            ),
            height10,
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: primaryColorAccent),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      projectBidTypeBtn(label: 'By milestone', index: 0),
                      width10,
                      Container(
                        width: 1,
                        height: 10,
                        color: Colors.grey,
                      ),
                      width10,
                      projectBidTypeBtn(label: 'By project', index: 1),
                    ],
                  ),
                  height10,
                  selectedBidType == 0
                      ? Text(
                          'Divide the project into smaller parts, called milestones. You\'ll be paid for milestones as they are completed and approved.',
                          style: TextStyle(
                            fontSize: sdp(context, 8.7),
                            color: Colors.grey.shade300,
                          ),
                        )
                      : Text(
                          'Build the project at one go. You\'ll be paid full as the project is completed and approved.',
                          style: TextStyle(
                            fontSize: sdp(context, 8.7),
                            color: Colors.grey.shade300,
                          ),
                        ),
                ],
              ),
            ),
            height20,
            AnimatedIndexedStack(
              index: selectedBidType,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: milestoneCount,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return milestoneForm(context, index: index);
                      },
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          milestoneCount++;
                        });
                      },
                      child: Text(
                        '+ Add milestone',
                        style: TextStyle(
                          color: kPillButtonColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
                byProjectForm(context),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            NavPush(context, ProposalUI());
          },
          child: Text(
            'Send Proposal',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget milestoneForm(BuildContext context, {required int index}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Project Milestone ' + (index + 1).toString(),
                style: TextStyle(
                  fontSize: sdp(context, 12),
                  fontWeight: FontWeight.w600,
                ),
              ),
              index != 0
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          milestoneCount--;
                        });
                      },
                      icon: Icon(
                        Icons.close,
                        size: sdp(context, 14),
                        color: kPillButtonColor,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
          height10,
          kTextField(
            context,
            label: 'Description',
            hintText: '(Optional)',
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
          ),
          height10,
          Row(
            children: [
              Flexible(
                child: kTextField(
                  context,
                  label: 'Due Date',
                  hintText: '(Optional)',
                  keyboardType: TextInputType.text,
                ),
              ),
              width10,
              Flexible(
                child: kTextField(
                  context,
                  label: 'Amount',
                  hintText: '(Optional)',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget byProjectForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Proposal details',
            style: TextStyle(
              fontSize: sdp(context, 12),
              fontWeight: FontWeight.w600,
            ),
          ),
          height10,
          kTextField(
            context,
            label: 'Description',
            hintText: '(Optional)',
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
          ),
          height10,
          Row(
            children: [
              Flexible(
                child: kTextField(
                  context,
                  label: 'Due Date',
                  hintText: '(Optional)',
                  keyboardType: TextInputType.text,
                ),
              ),
              width10,
              Flexible(
                child: kTextField(
                  context,
                  label: 'Amount',
                  hintText: '(Optional)',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget projectDetailsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Revamp our E-Commerce Website with a Fresh & Clean UI Design',
              style: TextStyle(
                fontSize: sdp(context, 11),
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
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
            Text(
              'Our E-Commerce Website is in need of a revamp and we are looking for a talented UI designer to help us create a fresh UI',
              style: TextStyle(
                fontSize: sdp(context, 9),
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              maxLines: readLess ? 2 : 200,
              overflow: TextOverflow.ellipsis,
            ),
            height10,
            InkWell(
              onTap: () {
                setState(() {
                  readLess = !readLess;
                });
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    !readLess ? 'Hide Details' : 'Show Details',
                    style: TextStyle(
                      color: kScaffoldColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    !readLess
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: kScaffoldColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectBidTypeBtn({String? label, required int index}) {
    bool _isSelected = selectedBidType == index;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedBidType = index;
        });
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _isSelected ? kPillButtonColor : Colors.grey.shade400,
              ),
            ),
            child: CircleAvatar(
              radius: 8,
              backgroundColor:
                  _isSelected ? kPillButtonColor : Colors.transparent,
            ),
          ),
          width5,
          Text(
            label!,
            style: TextStyle(
              color: _isSelected ? kPillButtonColor : Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

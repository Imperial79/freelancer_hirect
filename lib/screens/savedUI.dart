import 'package:flutter/material.dart';
import 'package:freelancer_app/utils/components.dart';

import '../utils/sdp.dart';

class SavedUI extends StatefulWidget {
  const SavedUI({super.key});

  @override
  State<SavedUI> createState() => _SavedUIState();
}

class _SavedUIState extends State<SavedUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saved',
                style: kTitleStyle(context),
              ),
              Text(
                'Find your saved or bookmarked projects here',
                style: TextStyle(fontSize: sdp(context, 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

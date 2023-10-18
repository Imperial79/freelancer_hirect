import 'package:flutter/material.dart';
import 'package:freelancer_app/dashboardUI.dart';
import 'package:freelancer_app/utils/colors.dart';
import 'package:freelancer_app/utils/components.dart';
import 'package:freelancer_app/utils/sdp.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool isVisible = false;
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
                'Welcome Back',
                style: TextStyle(
                  fontSize: sdp(context, 17),
                ),
              ),
              Text(
                'Login',
                style: kTitleStyle(context),
              ),
              SizedBox(
                height: 50,
              ),
              kTextFieldThis(
                context,
                prefix: Text(
                  '+91',
                  style: TextStyle(
                    fontSize: sdp(context, 20),
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                hintText: 'Phone',
              ),
              height20,
              kTextFieldThis(
                context,
                prefix: Icon(Icons.password),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  icon: Icon(
                    !isVisible ? Icons.visibility_off : Icons.visibility,
                    color: primaryColorAccent,
                  ),
                ),
                hintText: 'Password',
                obscureText: isVisible,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () {
              NavPush(context, DashboardUI());
            },
            child: Text('Proceed'),
          ),
        ),
      ),
    );
  }

  Row kTextFieldThis(
    BuildContext context, {
    TextEditingController? controller,
    Widget? prefix,
    required String hintText,
    bool obscureText = false,
    Widget? suffix,
  }) {
    return Row(
      children: [
        prefix != null
            ? Padding(
                padding: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: primaryColorAccent,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(child: prefix),
                  ),
                ),
              )
            : SizedBox(),
        Flexible(
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            style: TextStyle(
                color: Colors.white,
                fontSize: sdp(context, 20),
                fontWeight: FontWeight.w600),
            cursorColor: Colors.white,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              suffix: suffix,
              hintText: hintText,
              hintStyle: TextStyle(
                color: primaryColorAccent,
                fontSize: sdp(context, 20),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

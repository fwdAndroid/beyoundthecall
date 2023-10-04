import 'package:beyoundthecall/screens/main_dashboard.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:beyoundthecall/utils/controllers.dart';
import 'package:beyoundthecall/widgets/buttons.dart';
import 'package:beyoundthecall/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome Back!",
              style: TextStyle(
                color: textColor,
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 14, right: 14),
            child: Text(
              "Email",
              style: TextStyle(color: textColor),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: TextFormInputField(
                controller: emailController,
                hintText: "abc@gmail.com",
                textInputType: TextInputType.emailAddress),
          ),
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 14, right: 14),
            child: Text(
              "Password",
              style: TextStyle(color: textColor),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: TextFormInputField(
                controller: passController,
                hintText: "********",
                textInputType: TextInputType.visiblePassword),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: WonsButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => MainScreen()));
              },
              text: "Login",
              height: 40,
              width: 327,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Flexible(child: Container()),
        ],
      ),
    );
  }
}

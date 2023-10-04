import 'package:beyoundthecall/provider/ciruclar_provider.dart';
import 'package:beyoundthecall/services/auth.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:beyoundthecall/utils/controllers.dart';
import 'package:beyoundthecall/widgets/buttons.dart';
import 'package:beyoundthecall/widgets/custom_dialog_widget.dart';
import 'package:beyoundthecall/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              "password",
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
                if (emailController.text.isEmpty &&
                    passController.text.isEmpty) {
                  Customdialog()
                      .showInSnackBar("Both Fields are Required", context);
                } else if (emailController.text.isEmpty) {
                  Customdialog()
                      .showInSnackBar("Email Field are Required", context);
                } else if (passController.text.isEmpty) {
                  Customdialog()
                      .showInSnackBar("passrword Field are Required", context);
                } else if (passController.text.length < 5) {
                  Customdialog()
                      .showInSnackBar("password minimum 5 charaters", context);
                } else if (emailController.text != 'admin@gmail.com' &&
                    passController.text != '123456') {
                  Customdialog()
                      .showInSnackBar("Email and password is wrong", context);
                } else if (emailController.text == 'admin@gmail.com' &&
                    passController.text == '123456') {
                  Customdialog.showDialogBox(context);

                  Provider.of<CircularProgressProvider>(context, listen: false)
                      .setValue(true);
                  Future.delayed(Duration(seconds: 0)).then((value) {
                    Database().login(
                        emailController.text, passController.text, context);
                  });
                } else if (emailController.text != 'admin@gmail.com') {
                  Customdialog().showInSnackBar("Email is wrong", context);
                } else if (passController != '123456') {
                  Customdialog().showInSnackBar("password is wrong", context);
                }
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

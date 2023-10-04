import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              "Joe Doe",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          ListTile(
            title: Text(
              "Customer Analytics",
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            subtitle: Text(
              "Take a review regarding your business",
              style: TextStyle(color: listColor, fontSize: 15),
            ),
            leading: Icon(
              Icons.document_scanner,
              color: textColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text(
              "Log Out",
              style: TextStyle(
                  color: logoutColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            leading: Icon(
              Icons.logout,
              color: logoutColor,
            ),
          ),
        ],
      ),
    );
  }
}

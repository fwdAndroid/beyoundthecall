import 'package:beyoundthecall/screens/customer_section/customer_report.dart';
import 'package:beyoundthecall/screens/customer_section/send_message.dart';
import 'package:beyoundthecall/screens/customerservice/customer_service.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomerSection extends StatefulWidget {
  const CustomerSection({super.key});

  @override
  State<CustomerSection> createState() => _CustomerSectionState();
}

class _CustomerSectionState extends State<CustomerSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: mainColor,
        title: Text(
          "Analytical Reports",
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => CustomerService()));
            },
            leading: Icon(
              Icons.edit_document,
              color: textColor,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: textColor,
            ),
            title: Text(
              "Sign In Sheet",
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => CustomerReport()));
            },
            leading: Icon(
              Icons.analytics,
              color: textColor,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: textColor,
            ),
            title: Text(
              "Customer Analytics Report",
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => SendMessage()));
            },
            leading: Icon(
              Icons.email,
              color: textColor,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: textColor,
            ),
            title: Text(
              "Message",
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}

import 'package:beyoundthecall/screens/customer_section/send_message.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  final time;
  final name;
  final email;
  final uuid;
  final lastVisit;
  int numberofvisits;
  Report(
      {super.key,
      required this.email,
      required this.name,
      required this.numberofvisits,
      required this.time,
      required this.lastVisit,
      required this.uuid});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        iconTheme: IconThemeData(color: textColor),
      ),
      backgroundColor: mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Customer Name",
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Customer Email",
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.email,
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Last Visit",
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.lastVisit ?? "No Visit Happen Yet",
              style: TextStyle(color: textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: textColor,
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => SendMessage()));
                },
                child: Text(
                  "Send Message",
                  style: TextStyle(color: textColor, fontSize: 22),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
    );
  }
}

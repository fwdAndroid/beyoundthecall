import 'package:beyoundthecall/screens/customer_section/report.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerReport extends StatefulWidget {
  const CustomerReport({super.key});

  @override
  State<CustomerReport> createState() => _CustomerReportState();
}

class _CustomerReportState extends State<CustomerReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        iconTheme: IconThemeData(color: textColor),
      ),
      backgroundColor: mainColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("customers").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No Customer Found yet",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return StreamBuilder<Object>(
                stream: FirebaseFirestore.instance
                    .collection("customers")
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          data['customerName'],
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        subtitle: Text(
                          _formatTimestamp(data['dateofjoin']),
                          style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: textColor),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => Report(
                                        lastVisit: data['lastVisit'],
                                        email: data['customerEmail'],
                                        uuid: data['uuid'],
                                        time: data['dateofjoin'],
                                        name: data['customerName'],
                                        numberofvisits:
                                            data['numberofvisits'])));
                          },
                          child: Text(
                            "Report",
                            style: TextStyle(color: mainColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: textColor,
                        ),
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }
}

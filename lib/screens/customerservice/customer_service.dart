import 'package:beyoundthecall/screens/customerservice/service_room.dart';
import 'package:beyoundthecall/screens/pages/sign_in_sheet.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomerService extends StatefulWidget {
  const CustomerService({super.key});

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignInSheet()));
              },
              child: Text(
                "Add Customer",
                style: TextStyle(color: textColor, fontSize: 10),
              ))
        ],
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Existing Customer List",
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Text(
            'Current Date: ${getCurrentDate()}',
            style: TextStyle(fontSize: 24, color: textColor),
          ),
          SizedBox(
            height: 500,
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("customers")
                  .snapshots(),
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
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
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
                              trailing: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => ServiceRoom(
                                              email: data['customerEmail'],
                                              uuid: data['uuid'],
                                              time: data['dateofjoin'],
                                              name: data['customerName'],
                                              numberofvisits:
                                                  data['numberofvisits'])));
                                },
                                child: Text(
                                  "Enter Room",
                                  style: TextStyle(color: textColor),
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
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }

  String getCurrentDate() {
    final now = DateTime.now();
    final formatter = DateFormat('MM/dd/yyyy'); // Change the format as needed
    return formatter.format(now);
  }
}

import 'package:beyoundthecall/screens/pages/sign_in_sheet.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => SignInSheet()));
              },
              child: Text(
                "Add New Customer",
                style: TextStyle(color: textColor),
              ))
        ],
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Existing Customer List",
          style: TextStyle(color: textColor),
        ),
      ),
      body: SizedBox(
        height: 500,
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection("customers").snapshots(),
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
                    return ListTile(
                      title: Text(
                        data['customerName'],
                        style: TextStyle(
                            color: fieldtextColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                      subtitle: Text(
                        "data['']",
                        style: TextStyle(
                            color: fieldtextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

import 'package:beyoundthecall/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomerGridWidgetHorizontal extends StatefulWidget {
  const CustomerGridWidgetHorizontal({super.key});

  @override
  State<CustomerGridWidgetHorizontal> createState() =>
      _CustomerGridWidgetHorizontalState();
}

class _CustomerGridWidgetHorizontalState
    extends State<CustomerGridWidgetHorizontal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
                  "No Customerh Found yet",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
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
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: buttonColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              height: 100,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data['customerName'],
                                        style: TextStyle(
                                            color: fieldtextColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "View Details",
                                          style: TextStyle(color: detailColor),
                                        ))
                                  ])));
                    },
                  );
                });
          }),
    );
  }
}

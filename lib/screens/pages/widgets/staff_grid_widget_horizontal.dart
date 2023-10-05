import 'package:beyoundthecall/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StaffGridWidgetHorizontal extends StatefulWidget {
  const StaffGridWidgetHorizontal({super.key});

  @override
  State<StaffGridWidgetHorizontal> createState() =>
      _StaffGridWidgetHorizontalState();
}

class _StaffGridWidgetHorizontalState extends State<StaffGridWidgetHorizontal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("staff").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "No Staff Member Found yet",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 2.3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return StreamBuilder<Object>(
                    stream: FirebaseFirestore.instance
                        .collection("staff")
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
                              height: 200,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.network(
                                        data['photoURL'],
                                        height: 100,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data['staffName'],
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

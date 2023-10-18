import 'package:beyoundthecall/screens/main_dashboard.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ServiceRoom extends StatefulWidget {
  final time;
  final name;
  final email;
  final uuid;
  int numberofvisits;
  ServiceRoom(
      {super.key,
      required this.email,
      required this.name,
      required this.time,
      required this.numberofvisits,
      required this.uuid});

  @override
  State<ServiceRoom> createState() => _ServiceRoomState();
}

class _ServiceRoomState extends State<ServiceRoom> {
  var uuid = Uuid().v4();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Service Room For ${widget.name}",
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              widget.name,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              _formatTimestamp(
                widget.time,
              ),
              style: TextStyle(color: textColor),
            ),
            trailing: TextButton(
                onPressed: () async {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: false, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('CHANGE CLIENT STATUS'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              'SERVICED',
                              style: TextStyle(color: serviceColor),
                            ),
                            onPressed: () async {
                              print(widget.uuid);

                              await FirebaseFirestore.instance
                                  .collection("todayappointmnet")
                                  .doc(uuid)
                                  .set({
                                "customerName": widget.name,
                                "customerEmail": widget.email,
                                "today": formattedDate,
                                "timeStamp": FieldValue.serverTimestamp(),
                                "uuid": uuid
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => MainScreen()));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "CLIENT IS SERVED SUCCESSFULLY",
                                style: TextStyle(color: textColor),
                              )));
                              //  await FirebaseFirestore.instance
                              //     .collection("customers")
                              //     .doc(widget.uuid)
                              //     .update({
                              //   "numberofvisits": widget.numberofvisits++
                              // });
                            },
                          ),
                          TextButton(
                            child: Text(
                              'WAITING',
                              style: TextStyle(color: logoutColor),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                "CLIENT IS ON WAIT",
                                style: TextStyle(color: textColor),
                              )));
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "Change Status",
                  style: TextStyle(color: iconColor),
                )),
          ),
          Divider(
            color: textColor,
          )
        ],
      ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(dateTime);
  }
}

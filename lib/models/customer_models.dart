import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel {
  // String uid;
  String customerName;
  String customerPhone;
  String customerEmail;
  String uuid;
  var dateofjoin;

  CustomerModel({
    required this.dateofjoin,
    required this.customerName,
    required this.customerPhone,
    required this.customerEmail,
    required this.uuid,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'dateofjoin': dateofjoin,
        'customerName': customerName,
        'customerPhone': customerPhone,
        'uuid': uuid,
        'customerEmail': customerEmail
      };

  ///
  static CustomerModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return CustomerModel(
      dateofjoin: snapshot['dateofjoin'],
      customerName: snapshot['customerName'],
      customerEmail: snapshot['customerEmail'],
      customerPhone: snapshot['customerPhone'],
      uuid: snapshot['uuid'],
    );
  }
}

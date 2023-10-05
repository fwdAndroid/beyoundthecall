import 'package:cloud_firestore/cloud_firestore.dart';

class StaffModel {
  // String uid;
  String staffName;
  String staffPhone;
  String staffEmail;
  String photoURL;
  String staffAddress;
  String uuid;

  StaffModel(
      {
      // required this.uid,
      required this.staffName,
      required this.staffPhone,
      required this.photoURL,
      required this.uuid,
      required this.staffAddress,
      required this.staffEmail});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'staffEmail': staffEmail,
        // 'uid': uid,
        'staffName': staffName,
        'staffPhone': staffPhone,
        'uuid': uuid,
        'staffAddress': staffAddress,
        'photoURL': photoURL
      };

  ///
  static StaffModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return StaffModel(
      staffEmail: snapshot['staffEmail'],
      // uid: snapshot['uid'],
      staffName: snapshot['staffName'],
      photoURL: snapshot['photoURL'],
      staffPhone: snapshot['staffPhone'],
      uuid: snapshot['uuid'],
      staffAddress: snapshot['staffAddress'],
    );
  }
}

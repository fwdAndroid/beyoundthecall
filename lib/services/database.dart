import 'dart:typed_data';

import 'package:beyoundthecall/models/customer_models.dart';
import 'package:beyoundthecall/models/staff_models.dart';
import 'package:beyoundthecall/services/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class DatabaseMethods {
  Future<String> createStaff(
      {required String name,
      required String email,
      required String phoneNumber,
      required String address,
      required Uint8List file}) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || name.isNotEmpty) {
        String photoURL = await StorageMethods()
            .uploadImageToStorage('ProfilePics', file, false);
        var uuid = Uuid().v4();
        //Add User to the database with modal
        StaffModel userModel = StaffModel(
            staffEmail: email,
            staffName: name,
            staffAddress: address,
            staffPhone: phoneNumber,
            uuid: uuid,
            // uid: FirebaseAuth.instance.currentUser!.uid,
            photoURL: photoURL);
        await FirebaseFirestore.instance
            .collection("staff")
            .doc(uuid)
            .set(userModel.toJson());
        res = 'sucess';
      }
    } catch (e) {
      if (e is FirebaseException) {
        print("Firebase Firestore Error: ${e.message}");
      } else {}
    }
    return res;
  }

  Future<String> createCustomer({
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty || name.isNotEmpty) {
        var uuid = Uuid().v4();
        //Add User to the database with modal
        CustomerModel userModel = CustomerModel(
          customerEmail: email,
          customerName: name,
          customerPhone: phoneNumber,
          uuid: uuid,
          uid: FirebaseAuth.instance.currentUser!.uid,
        );
        await FirebaseFirestore.instance
            .collection("customers")
            .doc(uuid)
            .set(userModel.toJson());
        res = 'sucess';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

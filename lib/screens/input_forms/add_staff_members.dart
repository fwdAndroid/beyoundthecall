import 'package:beyoundthecall/screens/main_dashboard.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:beyoundthecall/utils/controllers.dart';
import 'package:beyoundthecall/widgets/buttons.dart';
import 'package:beyoundthecall/widgets/text_form_field_input_field_widgets.dart';
import 'package:flutter/material.dart';

class AddStaffMembers extends StatefulWidget {
  const AddStaffMembers({super.key});

  @override
  State<AddStaffMembers> createState() => _AddStaffMembersState();
}

class _AddStaffMembersState extends State<AddStaffMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Add Staff Members",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: mainColor,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/add user icon.png",
              height: 200,
              width: 200,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.person),
                controller: staffMemebersNameController,
                hintText: "Staff Member Name",
                textInputType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.phone),
                controller: staffPhoneController,
                hintText: "Staff Phone Number",
                textInputType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.email),
                controller: staffEmailController,
                hintText: "Staff Email",
                textInputType: TextInputType.name,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 10),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.location_pin),
                controller: staffAddressController,
                hintText: "Staff Member Address",
                textInputType: TextInputType.name,
              ),
            ),
            Center(
              child: WonsButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (builder) => MainScreen()));
                },
                text: "Save",
                height: 40,
                width: 327,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

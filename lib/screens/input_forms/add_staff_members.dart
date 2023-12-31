import 'dart:typed_data';
import 'package:beyoundthecall/screens/main_dashboard.dart';
import 'package:beyoundthecall/services/database.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:beyoundthecall/utils/controllers.dart';
import 'package:beyoundthecall/utils/pick_image_utils.dart';
import 'package:beyoundthecall/widgets/buttons.dart';
import 'package:beyoundthecall/widgets/text_form_field_input_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStaffMembers extends StatefulWidget {
  const AddStaffMembers({super.key});

  @override
  State<AddStaffMembers> createState() => _AddStaffMembersState();
}

class _AddStaffMembersState extends State<AddStaffMembers> {
  Uint8List? image;
  bool _isLoading = false;

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
            image != null
                ? CircleAvatar(radius: 59, backgroundImage: MemoryImage(image!))
                : InkWell(
                    onTap: () => selectImage(),
                    child: Image.asset(
                      "assets/add user icon.png",
                      height: 200,
                      width: 200,
                    ),
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
                textInputType: TextInputType.number,
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
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : WonsButton(
                      onPressed: createStaffAccount,
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
  //Functions

  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      image = ui;
    });
  }

  createStaffAccount() async {
    setState(() {
      _isLoading = true;
    });
    if (staffEmailController.text.isEmpty ||
        staffMemebersNameController.text.isEmpty ||
        staffAddressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Name, Email and Address and Photo is Required")));
    }
    String rse = await DatabaseMethods().createStaff(
        name: staffMemebersNameController.text,
        email: staffEmailController.text,
        phoneNumber: staffPhoneController.text,
        address: staffAddressController.text,
        file: image!);

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(rse)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(rse)));
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => MainScreen()));
    }
  }
}

import 'package:beyoundthecall/services/database.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:beyoundthecall/utils/controllers.dart';
import 'package:beyoundthecall/widgets/buttons.dart';
import 'package:beyoundthecall/widgets/text_form_field_input_field_widgets.dart';
import 'package:flutter/material.dart';

class SignInSheet extends StatefulWidget {
  const SignInSheet({super.key});

  @override
  State<SignInSheet> createState() => _SignInSheetState();
}

class _SignInSheetState extends State<SignInSheet> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Add Customer",
          style: TextStyle(color: textColor),
        ),
        backgroundColor: mainColor,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.person),
                controller: customerNameController,
                hintText: "Customer Name",
                textInputType: TextInputType.name,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.phone),
                controller: customerPhoneController,
                hintText: "Customer Phone Number",
                textInputType: TextInputType.name,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 30),
              child: TextFormInputFormField(
                suIcon: Icon(Icons.email),
                controller: customermailController,
                hintText: "Customer Email (Optional)",
                textInputType: TextInputType.name,
              ),
            ),
            Center(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : WonsButton(
                      onPressed: createCustomer,
                      text: "Sign In",
                      height: 40,
                      width: 327,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  createCustomer() async {
    setState(() {
      _isLoading = true;
    });
    if (staffEmailController.text.isEmpty ||
        staffMemebersNameController.text.isEmpty ||
        staffAddressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Name, Email and Address and Photo is Required")));
    }
    String rse = await DatabaseMethods().createCustomer(
      name: customerNameController.text,
      email: customermailController.text,
      phoneNumber: customerPhoneController.text,
    );

    print(rse);
    setState(() {
      _isLoading = false;
    });
    if (rse != 'sucess') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(rse)));
    } else {}
  }
}

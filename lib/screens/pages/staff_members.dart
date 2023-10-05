import 'package:beyoundthecall/screens/input_forms/add_staff_members.dart';
import 'package:beyoundthecall/screens/pages/widgets/staff_grid_widget.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class StaffMembers extends StatefulWidget {
  const StaffMembers({super.key});

  @override
  State<StaffMembers> createState() => _StaffMembersState();
}

class _StaffMembersState extends State<StaffMembers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingbackColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => AddStaffMembers()));
        },
        child: Icon(
          Icons.add,
          color: iconColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            StaffGridWidget()
          ],
        ),
      ),
    );
  }
}

import 'package:beyoundthecall/screens/pages/widgets/customer_grid_widget.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          "Customers",
          style: TextStyle(color: textColor),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomerGridWidget()
          ],
        ),
      ),
    );
  }
}

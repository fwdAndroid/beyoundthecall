import 'package:beyoundthecall/screens/pages/widgets/customer_grid_widget_horizontal.dart';
import 'package:beyoundthecall/screens/pages/widgets/staff_grid_widget_horizontal.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(color: textColor),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Staff Members",
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 12,
                            color: textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StaffGridWidgetHorizontal(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customers",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (builder) => EventNearByYourFrame()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 12,
                            color: textColor,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomerGridWidgetHorizontal()
          ],
        ),
      ),
    );
  }
}

import 'package:beyoundthecall/screens/pages/account.dart';
import 'package:beyoundthecall/screens/pages/customers.dart';
import 'package:beyoundthecall/screens/pages/home_page.dart';
import 'package:beyoundthecall/screens/pages/sign_in_sheet.dart';
import 'package:beyoundthecall/screens/pages/staff_members.dart';
import 'package:beyoundthecall/utils/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(), // Replace with your screen widgets
    StaffMembers(),
    SignInSheet(),
    Customers(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0
                  ? 'assets/home_dark.png'
                  : 'assets/home_white.png',
              height: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1
                  ? 'assets/staff_dark.png'
                  : 'assets/staff_white.png',
              height: 25,
            ),
            label: 'Staff Member',
          ),
          BottomNavigationBarItem(
            label: "Sign In Sheet",
            icon: Image.asset(
              _currentIndex == 2
                  ? 'assets/signin_dark.png'
                  : 'assets/signin_white.png',
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "Customers",
            icon: Image.asset(
              _currentIndex == 3
                  ? 'assets/customer_dark.png'
                  : 'assets/customer_white.png',
              height: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: "Account",
            icon: Image.asset(
              _currentIndex == 4
                  ? 'assets/profile_dark.png'
                  : 'assets/profile_white.png',
              height: 25,
            ),
          ),
        ],
        unselectedLabelStyle:
            TextStyle(color: textColor.withOpacity(.8), fontSize: 10),
        selectedLabelStyle: TextStyle(color: textColor, fontSize: 10),
        backgroundColor: mainColor, // Set your desired background color here
        selectedItemColor: textColor, // Set the color for selected item
        unselectedItemColor:
            textColor.withOpacity(.8), // Set the color for unselected items
      ),
    );
  }
}

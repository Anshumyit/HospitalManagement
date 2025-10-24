import 'package:flutter/material.dart';
import 'package:hospitalmanagment/screen/billing.dart';
import 'package:hospitalmanagment/screen/home.dart';
import 'package:hospitalmanagment/screen/leave_request.dart';
import 'package:provider/provider.dart';

import '../view_model_controller/bottomNavigator.dart';



class Bottombutton extends StatelessWidget {
  Bottombutton({super.key});


  final List<Widget> screens = [
    HomeScreen(),
    LeaveRequest(),
    Billing(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<bottomNavigtor>(
      builder: (context, value, child) {
        return Scaffold(
          body: screens[value.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: value.currentindex,
            onTap: value.selectedIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.holiday_village_outlined), label: "Leave"),
              BottomNavigationBarItem(icon: Icon(Icons.attach_money_outlined), label: "Billing"),
            ],
          ),
        );
      },
    );

  }
}

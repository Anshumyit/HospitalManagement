import 'package:flutter/cupertino.dart';

class bottomNavigtor with ChangeNotifier{
  int currentindex=0;

  void selectedIndex(int index){
    currentindex=index;
    notifyListeners();

  }

  String DropdownValue="Doctor";

  List<String> items=[
    "Doctor",
    "Nurses"
  ];

}
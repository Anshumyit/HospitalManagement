import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model_controller/bottomNavigator.dart';

class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  @override
  Widget build(BuildContext context) {
    var provider =Provider.of<bottomNavigtor>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.notifications_active_rounded),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text('Leave Request'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade100, // background color
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  border: InputBorder.none, // remove inside border
                  labelText: "Select Staff Category",
                ),
                value: provider.DropdownValue,
                items: provider.items
                    .map((String value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ))
                    .toList(),
                onChanged: (String? newValue) {
                  provider.DropdownValue = newValue!;
                  provider.notifyListeners();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

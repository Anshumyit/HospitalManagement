import 'package:flutter/material.dart';

class RecordManagementScreen extends StatefulWidget {
  const RecordManagementScreen({super.key});

  @override
  State<RecordManagementScreen> createState() => _RecordManagementScreenState();
}

class _RecordManagementScreenState extends State<RecordManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Record Management',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

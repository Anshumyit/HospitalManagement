import 'package:flutter/material.dart';
import 'package:hospitalmanagment/reception/view/PatientRecordRec..dart';
import 'package:hospitalmanagment/reception/view/RecordManagementScreen.dart';
import 'package:hospitalmanagment/reception/view/admissionRecep.dart';
import 'package:hospitalmanagment/reception/view/appointmentRecep.dart';
import 'package:hospitalmanagment/reception/view/billingReception.dart';
import 'package:hospitalmanagment/reception/view/reportScreen.dart';

import 'CommunicationScreen.dart';



class ReceptionHome extends StatefulWidget {
  const ReceptionHome({super.key});

  @override
  State<ReceptionHome> createState() => _ReceptionHomeState();
}

class _ReceptionHomeState extends State<ReceptionHome> {
  final List<Map<String, dynamic>> workList = const [
    {'title': 'Appointments', 'icon': Icons.calendar_today},
    {'title': 'Billing', 'icon': Icons.receipt_long},
    {'title': 'Patient Records', 'icon': Icons.folder_shared},
    {'title': 'Communication', 'icon': Icons.chat_bubble_outline},
    {'title': 'Admission & Discharge', 'icon': Icons.hotel},
    {'title': 'Reporting & Documentation', 'icon': Icons.bar_chart},
    {'title': 'Record Management', 'icon': Icons.assignment},
    {'title': 'Other Responsibilities', 'icon': Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hospital Receptionist',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: workList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final item = workList[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  switch (item['title']) {
                    case 'Appointments':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const AppointmentScreen()));
                      break;
                    case 'Billing':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const BillingScreen()));
                      break;
                    case 'Patient Records':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const PatientRecordScreen()));
                      break;
                    case 'Communication':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CommunicationScreen()));
                      break;
                    case 'Admission & Discharge':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const AdmissionScreen()));
                      break;
                    case 'Reporting & Documentation':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ReportScreen()));
                      break;
                    case 'Record Management':
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const RecordManagementScreen()));
                      break;
                    case 'Other Responsibilities':
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => const OtherResponsibilitiesScreen()));
                      break;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item['title']} clicked'),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item['icon'],
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

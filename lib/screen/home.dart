import 'package:flutter/material.dart';

import '../constant/vertical_horiztal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> staffData = [
    {'title': 'Total Doctors', 'value': '25', 'icon': Icons.person},
    {'title': 'Total Nurses', 'value': '40', 'icon': Icons.person_2_outlined},
    {
      'title': 'Cleaning Staff',
      'value': '10',
      'icon': Icons.cleaning_services_outlined,
    },
    {
      'title': 'Medical Store',
      'value': '320',
      'icon': Icons.local_pharmacy_outlined,
    },
  ];

  final List<Map<String, String>> doctors = [
    {
      'name': 'Dr. A.K. Sharma',
      'department': 'Cardiology',
      'timing': '9 AM – 4 PM',
      'status': 'Available',
    },
    {
      'name': 'Dr. S.L. Rao',
      'department': 'Orthopedic',
      'timing': '10 AM – 5 PM',
      'status': 'On Leave',
    },
    {
      'name': 'Dr. P. Menon',
      'department': 'Neurology',
      'timing': '9 AM – 3 PM',
      'status': 'Available',
    },
  ];

  final List<Map<String, dynamic>> gridData = [
    {
      'title': 'Total Appointment',
      'value': '150',
      'icon': Icons.calendar_month,
    },
    {
      'title': 'Total Admit Patient',
      'value': '120',
      'icon': Icons.local_hospital,
    },
    {'title': 'Discharged Patient', 'value': '95', 'icon': Icons.check_circle},
    {'title': 'OPD Visits', 'value': '80', 'icon': Icons.local_hotel_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Hospital Dashboard',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SectionTitle("aataff Overview"),
            UtilityWidget.VerticalWidget(10),
            StaffGrid(),
            UtilityWidget.VerticalWidget(25),
            SectionTitle("Doctor Management"),
            UtilityWidget.VerticalWidget(10),
            DoctorList(),
            UtilityWidget.VerticalWidget(25),
            SectionTitle("Hospital Overview"),
            UtilityWidget.VerticalWidget(10),
            buildOverviewGrid(),
          ],
        ),
      ),
    );
  }

  //  Section Title Widget
  Widget SectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.teal,
        ),
      ),
    );
  }

  //  Staff Grid
  Widget StaffGrid() {
    final crossCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: staffData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final item = staffData[index];
        return buildInfoCard(
          icon: item['icon'],
          title: item['title'],
          value: item['value'],
          color: Colors.tealAccent.shade100,
        );
      },
    );
  }

  //  Reusable Info Card
  Widget buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.teal.shade50,
              child: Icon(icon, color: Colors.teal),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //  Doctor Management List
  Widget DoctorList() {
    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children:
              doctors.map((doctor) {
                final isAvailable = doctor['status'] == 'Available';
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.tealAccent,
                          child: Icon(
                            Icons.medical_services,
                            color: Colors.teal,
                          ),
                        ),
                        UtilityWidget.HorizantalWidget(12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctor['name']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              UtilityWidget.VerticalWidget(2),
                              Text(
                                '${doctor['department']} | ${doctor['timing']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              UtilityWidget.VerticalWidget(3),
                              Text(
                                doctor['status']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      isAvailable
                                          ? Colors.green
                                          : Colors.redAccent,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (doctor != doctors.last)
                      const Divider(thickness: 1, color: Colors.grey),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }

  //  Overview Grid (Appointments, Patients, etc.)
  Widget buildOverviewGrid() {
    final crossCount = MediaQuery.of(context).size.width > 600 ? 3 : 2;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: gridData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final details = gridData[index];
        return buildInfoCard(
          icon: details['icon'],
          title: details['title'],
          value: details['value'],
          color: Colors.white,
        );
      },
    );
  }
}

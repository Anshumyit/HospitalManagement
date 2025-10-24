import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> data = [
    {'title': 'Total Doctors', 'value': '25', 'icon': Icons.person},
    {'title': 'Total Nurses', 'value': '40', 'icon': Icons.person},
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
    {
      'title': 'Discharged Patient',
      'value': '95',
      'icon': Icons.check_circle,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: data.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 1.5,
                        ),
                    itemBuilder: (context, index) {
                      final item = data[index];
                      return Card(
                        color: Colors.white30,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CircleAvatar(
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                child: Icon(item['icon'], color: Colors.blue),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  item['value'],
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Doctor Management',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(height: 1, thickness: 1),
                    const SizedBox(height: 10),
                    // List of Doctors
                    Column(
                      children:
                          doctors.map((doctor) {
                            final isAvailable = doctor['status'] == 'Available';
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        doctor['name']!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${doctor['department']} | ${doctor['timing']}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
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
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: gridData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                final details = gridData[index];
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(details['icon'], color: Colors.blue, size: 30),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(details['title'],),
                           Text(details['value'])
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

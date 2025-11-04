import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../doctor_screen/view/login.dart';
import '../reception/view/login.dart';
import 'login.dart';

class CommanScreen extends StatefulWidget {
  const CommanScreen({super.key});

  @override
  State<CommanScreen> createState() => _CommanScreenState();
}

class _CommanScreenState extends State<CommanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  child: Lottie.asset("assets/images/Doctor.json"),
                ),
                const SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true, // important for scrolling inside Column
                  physics: const NeverScrollableScrollPhysics(), // disable GridView's own scroll
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildGridItem(
                      title: "Doctor Section",
                      icon: Icons.medical_services,
                      color: Colors.teal,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    _buildGridItem(
                      title: "Admin Section",
                      icon: Icons.admin_panel_settings,
                      color: Colors.deepPurple,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginEmployees(),
                          ),
                        );
                      },
                    ),
                    _buildGridItem(
                      title: "Reception",
                      icon: Icons.receipt_long,
                      color: Colors.orange,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReceptionLogin(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

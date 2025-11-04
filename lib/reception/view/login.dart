import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'home.dart';

class ReceptionLogin extends StatefulWidget {
  const ReceptionLogin({super.key});

  @override
  State<ReceptionLogin> createState() => _ReceptionLoginState();
}

class _ReceptionLoginState extends State<ReceptionLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Email validation
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email address';
    return null;
  }

  // Password validation
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    final regexUpper = RegExp(r'[A-Z]');
    final regexLower = RegExp(r'[a-z]');
    final regexDigit = RegExp(r'\d');
    final regexSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!regexUpper.hasMatch(value)) return 'Include at least one uppercase letter';
    if (!regexLower.hasMatch(value)) return 'Include at least one lowercase letter';
    if (!regexDigit.hasMatch(value)) return 'Include at least one number';
    if (!regexSpecial.hasMatch(value)) return 'Include at least one special character';
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReceptionHome()));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            Positioned.fill(
              child: Lottie.asset(
                "assets/images/Desk inglese.json",
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      "Reception Login",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        _submitForm();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ],
          ),
        )
      ),
    );
  }
}

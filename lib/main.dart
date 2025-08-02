// ignore_for_file: unused_field, body_might_complete_normally_nullable, avoid_print

import 'package:flutter/material.dart';
import 'package:validation/Screen2.dart'; // Ensure Screen2.dart exists

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidgetPage(),
      debugShowCheckedModeBanner: false,
      title: 'Validation',
    );
  }
}

class MyWidgetPage extends StatefulWidget {
  const MyWidgetPage({super.key});

  @override
  State<MyWidgetPage> createState() => _MyWidgetPageState();
}

class _MyWidgetPageState extends State<MyWidgetPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _ageController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Validation',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Text(
              'Fill the details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            // Name
            TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Enter Your Name',
                prefixIcon: const Icon(Icons.person),
                suffixIcon: const Icon(Icons.double_arrow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length <= 2) {
                  return 'Please enter a valid name (min 3 chars)';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // Email
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter Your Email',
                prefixIcon: const Icon(Icons.email),
                suffixIcon: const Icon(Icons.double_arrow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegEx.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // Phone
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Enter Your Phone',
                prefixIcon: const Icon(Icons.phone),
                suffixIcon: const Icon(Icons.double_arrow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length != 10) {
                  return 'Please enter a valid 10-digit phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // Password
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Enter Your Password',
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                final passwordRegex = RegExp(
                  r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
                );
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                } else if (!passwordRegex.hasMatch(value)) {
                  return 'Password must be 6+ chars with letters & numbers';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // Address
            TextFormField(
              controller: _addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                labelText: 'Enter Your Address',
                prefixIcon: const Icon(Icons.location_city),
                suffixIcon: const Icon(Icons.double_arrow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),

            // Age
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Your Age',
                prefixIcon: const Icon(Icons.numbers),
                suffixIcon: const Icon(Icons.double_arrow),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                final age = int.tryParse(value);
                if (age == null || age <= 0) {
                  return 'Enter a valid age';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Print to console
                  print("Name: ${_nameController.text}");
                  print("Email: ${_emailController.text}");
                  print("Phone: ${_phoneController.text}");
                  print("Password: ${_passwordController.text}");
                  print("Address: ${_addressController.text}");
                  print("Age: ${_ageController.text}");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen2()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields correctly'),
                    ),
                  );
                }
              },
              child: const Text('Click me!'),
            ),
          ],
        ),
      ),
    );
  }
}

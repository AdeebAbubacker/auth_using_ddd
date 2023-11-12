import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Future<void> RegisterUser() async {
    final String url = 'http://192.168.1.5:3000/register';

    final Map<String, dynamic> requestData = {
      'username': nameController.text,
      'password': passwordController.text,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestData),
    );

    if (response.statusCode == 201) {
      var response1 = response.body;
      // ignore: avoid_print
      print(response1);
      // ignore: avoid_print
      print('Registration successful!');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful!')));
    } else if (response.statusCode == 500) {
      // Handle login failure
      // ignore: avoid_print, use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Registration failed: User already registered')));
      print('Registration failed: User already registered');
    } else if (response.statusCode == 400) {
      // Handle login failure
      // ignore: avoid_print, use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Registration failed: username and paassword required1')));
      print('Registration failed: username and paassword required1');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 90),
            const CircleAvatar(radius: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Enter name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                RegisterUser();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

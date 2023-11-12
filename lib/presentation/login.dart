import 'dart:convert';
import 'package:auth_using_ddd/infrastructure/infrastructure.dart';
import 'package:auth_using_ddd/presentation/regsiter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Declare requestData as a class field
  final Map<String, dynamic> requestData = {};

  final ApiService apiService = ApiService();

  Future<void> loginUser() async {
    final http.Response response = await apiService.loginUser(
      nameController.text,
      passwordController.text,
    );

    if (response.statusCode == 200) {
      var token = response.body;
 
      // ignore: avoid_print
      print(token);
      // ignore: avoid_print
      print('Login successful!');
    } else {

    
  
      // ignore: avoid_print
      print('Login failed: ${response.body}');
    }
  }

//sssxxxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
s
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 90),
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
                loginUser();
              },
              child: const Text('Login'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterPage();
                        },
                      ),
                    );
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl ='http://192.168.1.5:3000';

  ApiService();

  Future<http.Response> loginUser(String username, String password) async {
    final String url = '$baseUrl/login';

    final Map<String, dynamic> requestData = {
      'username': username,
      'password': password,
    };

    return await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestData),
    );
  }

  Future<http.Response> registerUser(String username, String password) async {
    final String url = '$baseUrl/register';

    final Map<String, dynamic> requestData = {
      'username': username,
      'password': password,
    };

    return await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestData),
    );
  }
}

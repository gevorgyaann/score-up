import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../requestes/screens/request_list.dart';

class AuthService {
  final Dio _dio = Dio();

  AuthService() {
    // Initialize Dio with any necessary configuration
    _dio.options.baseUrl = 'https://yourapi.com/api';
    _dio.options.connectTimeout = 5000 as Duration?;
    _dio.options.receiveTimeout = 3000 as Duration?;
  }

  Future<void> login(String phoneNumber, String password, BuildContext context) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'phone_number': phoneNumber,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful response
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RequestList(),
          ),
        );
        // You can save tokens or any necessary data here
      } else {
        // Handle non-200 status code
        print('Login failed: ${response.statusCode} ${response.statusMessage}');
      }
    } on DioException catch (e) {
      // Handle Dio error
      if (e.response != null) {
        print('Dio error: ${e.response?.data}');
      } else {
        print('Error sending request: $e');
      }
    } catch (e) {
      // Handle any other errors
      print('Unexpected error: $e');
    }
  }
}
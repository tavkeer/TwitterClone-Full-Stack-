import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:twitterclone/exports.dart';
import 'package:twitterclone/api/api_endpoints.dart';

class LoginServicesApi {
  static loginUserAccount({
    required String email,
    required String password,
  }) async {
    String jwt = "";
    try {
      final response = await http.post(
        Uri.parse(loginUser),
        body: {
          "Email": email,
          "Password": password,
        },
      );
      debugPrint("code: ${response.statusCode}");
      debugPrint("User: ${response.body}");

      final data = jsonDecode(response.body);
      jwt = data['Token'] ?? "";
      debugPrint("Token : ${data['Token']}");
    } catch (err) {
      debugPrint("Failed to create the user: $err");
    }
    return jwt;
  }
}

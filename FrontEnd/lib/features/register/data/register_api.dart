import 'package:twitterclone/api/api_endpoints.dart';
import 'package:twitterclone/exports.dart';
import 'package:http/http.dart' as http;

class RegistrationServiceApi {
  static Future<int> checkUserName(String userName) async {
    int statusCode = 400;
    try {
      final response = await http.post(
        Uri.parse(checkName),
        body: {"UserName": userName},
      );
      statusCode = response.statusCode;
    } catch (err) {
      debugPrint("UserName checking error: $err");
    }
    return statusCode;
  }

  static checkUserEmail(String email) async {
    int statusCode = 400;
    try {
      final response = await http.post(
        Uri.parse(checkEmail),
        body: {"Email": email},
      );
      statusCode = response.statusCode;
    } catch (err) {
      debugPrint("Email checking error: $err");
    }
    return statusCode;
  }

  static registerUserAccount({
    required String email,
    required String password,
    required String userName,
  }) async {
    int statusCode = 400;
    try {
      final response = await http.post(
        Uri.parse(registerUser),
        body: {
          "Email": email,
          "Password": password,
          "UserName": userName,
        },
      );
      statusCode = response.statusCode;
      debugPrint(response.body);
    } catch (err) {
      debugPrint("Failed to create the user: $err");
    }
    return statusCode;
  }
}

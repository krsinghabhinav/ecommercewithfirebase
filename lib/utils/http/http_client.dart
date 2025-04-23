import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomHelper {
  static const String _baseUrl = "https://your-api-base-url.com";

  // GET
  static Future<Map<String, dynamic>> getApi(String endPointurl) async {
    final url = Uri.parse('$_baseUrl/$endPointurl');
    print("GET Request URL: $url");

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },
    );

    print("GET Response: ${response.statusCode}, Body: ${response.body}");
    return _handleResponse(response);
  }

  // POST
  static Future<Map<String, dynamic>> postApi(
    String endPointurl,
    dynamic data,
  ) async {
    final url = Uri.parse('$_baseUrl/$endPointurl');
    print("POST Request URL: $url");
    print("POST Body: $data");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },
      body: jsonEncode(data),
    );

    print("POST Response: ${response.statusCode}, Body: ${response.body}");
    return _handleResponse(response);
  }

  // PUT
  static Future<Map<String, dynamic>> putApi(
    String endPointurl,
    dynamic data,
  ) async {
    final url = Uri.parse('$_baseUrl/$endPointurl');
    print("PUT Request URL: $url");
    print("PUT Body: $data");

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },
      body: jsonEncode(data),
    );

    print("PUT Response: ${response.statusCode}, Body: ${response.body}");
    return _handleResponse(response);
  }

  // PATCH
  static Future<Map<String, dynamic>> patchApi(
    String endPointurl,
    dynamic data,
  ) async {
    final url = Uri.parse('$_baseUrl/$endPointurl');
    print("PATCH Request URL: $url");
    print("PATCH Body: $data");

    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },
      body: jsonEncode(data),
    );

    print("PATCH Response: ${response.statusCode}, Body: ${response.body}");
    return _handleResponse(response);
  }

  // DELETE
  static Future<Map<String, dynamic>> deleteApi(
    String endPointurl,
    dynamic data,
  ) async {
    final url = Uri.parse('$_baseUrl/$endPointurl');
    print("DELETE Request URL: $url");
    print("DELETE Body: $data");

    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer token',
      },
      body: jsonEncode(data),
    );

    print("DELETE Response: ${response.statusCode}, Body: ${response.body}");
    return _handleResponse(response);
  }

  // Handle response with status code
  static Map<String, dynamic> _handleResponse(http.Response response) {
    print("Handling response...");

    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 204:
        return {"message": "No Content"};
      case 400:
        throw Exception('Bad Request: ${response.body}');
      case 401:
        throw Exception('Unauthorized: ${response.body}');
      case 403:
        throw Exception('Forbidden: ${response.body}');
      case 404:
        throw Exception('Not Found: ${response.body}');
      case 500:
        throw Exception('Internal Server Error: ${response.body}');
      default:
        print("Unhandled status code: ${response.statusCode}");
        throw Exception(
          'Error: ${response.statusCode} - ${response.reasonPhrase}\nBody: ${response.body}',
        );
    }
  }
}

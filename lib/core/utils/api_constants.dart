import 'dart:convert';
import 'dart:io'; // For SocketException
import 'dart:async';

import 'package:homekru_owner/core/utils/constants.dart';
import 'package:http/http.dart' as http; // For TimeoutException

class ApiService {
  final Map<String, String> _defaultHeaders;
  final Duration _timeoutDuration;

  ApiService({
    Map<String, String>? defaultHeaders,
    Duration timeoutDuration = const Duration(seconds: 30),
  }) : _defaultHeaders = defaultHeaders ?? {'Content-Type': 'application/json; charset=UTF-8'},
       _timeoutDuration = timeoutDuration;

  // --- Private Helper for processing responses ---
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
        if (response.body.isEmpty) {
          return null; // Or an empty map: {}
        }
        return jsonDecode(response.body);
      case 204: // No Content
        return null; // Or an empty map: {}
      case 400: // Bad Request
        throw ApiException(message: 'Bad Request: ${response.body}', statusCode: response.statusCode);
      case 401: // Unauthorized
        throw ApiException(message: 'Unauthorized: ${response.body}', statusCode: response.statusCode);
      case 403: // Forbidden
        throw ApiException(message: 'Forbidden: ${response.body}', statusCode: response.statusCode);
      case 404: // Not Found
        throw ApiException(message: 'Not Found: ${response.body}', statusCode: response.statusCode);
      case 500: // Internal Server Error
      default:
        throw ApiException(message: 'Error occurred with status code ${response.statusCode}: ${response.body}', statusCode: response.statusCode);
    }
  }

  // --- Private Helper for handling common exceptions ---
  Future<T> _handleRequest<T>(Future<T> Function() requestFunction) async {
    try {
      return await requestFunction().timeout(_timeoutDuration);
    } on SocketException {
      throw ApiException(message: 'No Internet connection.');
    } on TimeoutException {
      throw ApiException(message: 'Request timed out. Please try again.');
    } on ApiException {
      rethrow; // Re-throw ApiException if it's already handled by _processResponse
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: ${e.toString()}');
    }
  }

  // --- Public API Methods ---

  /// **HTTP Method: GET**

  Future<dynamic> get(String endpoint, {Map<String, String>? queryParams, Map<String, String>? customHeaders}) async {
    return _handleRequest(() async {
      final uri = Uri.parse('${Constants.baseUrl}/$endpoint').replace(queryParameters: queryParams);
      final headers = {..._defaultHeaders, ...?customHeaders};

      print('GET Request: $uri');
      print('Headers: $headers');

      final response = await http.get(uri, headers: headers);
      return _processResponse(response);
    });
  }

  /// **HTTP Method: POST**
  ///
  /// Sends a POST request to the specified [endpoint] with the given [body].
  /// The [body] will be JSON encoded.
  /// Optional [queryParams] can be provided.
  /// Optional [customHeaders] can override or add to default headers.
  Future<dynamic> post(String endpoint, {required Map<String, dynamic> body, Map<String, String>? queryParams, Map<String, String>? customHeaders}) async {
    return _handleRequest(() async {
      final uri = Uri.parse('${Constants.baseUrl}/$endpoint').replace(queryParameters: queryParams);
      final headers = {..._defaultHeaders, ...?customHeaders};
      final encodedBody = jsonEncode(body);

      print('POST Request: $uri');
      print('Headers: $headers');
      print('Body: $encodedBody');

      final response = await http.post(uri, headers: headers, body: encodedBody);
      // print(response);
      return _processResponse(response);
    });
  }

  /// **HTTP Method: PUT**
  ///
  /// Sends a PUT request to the specified [endpoint] with the given [body].
  /// The [body] will be JSON encoded.
  /// Optional [queryParams] can be provided.
  /// Optional [customHeaders] can override or add to default headers.
  Future<dynamic> put(String endpoint, {required Map<String, dynamic> body, Map<String, String>? queryParams, Map<String, String>? customHeaders}) async {
    return _handleRequest(() async {
      final uri = Uri.parse('${Constants.baseUrl}/$endpoint').replace(queryParameters: queryParams);
      final headers = {..._defaultHeaders, ...?customHeaders};
      final encodedBody = jsonEncode(body);

      print('PUT Request: $uri');
      print('Headers: $headers');
      print('Body: $encodedBody');

      final response = await http.put(uri, headers: headers, body: encodedBody);
      return _processResponse(response);
    });
  }

  /// **HTTP Method: DELETE**
  ///
  /// Sends a DELETE request to the specified [endpoint].
  /// Optional [body] can be provided (some APIs might require it).
  /// Optional [queryParams] can be provided.
  /// Optional [customHeaders] can override or add to default headers.
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? body, // Optional body for DELETE
    Map<String, String>? queryParams,
    Map<String, String>? customHeaders,
  }) async {
    return _handleRequest(() async {
      final uri = Uri.parse('${Constants.baseUrl}/$endpoint').replace(queryParameters: queryParams);
      final headers = {..._defaultHeaders, ...?customHeaders};
      String? encodedBody;
      if (body != null) {
        encodedBody = jsonEncode(body);
      }

      print('DELETE Request: $uri');
      print('Headers: $headers');
      if (encodedBody != null) print('Body: $encodedBody');

      final response = await http.delete(uri, headers: headers, body: encodedBody);
      return _processResponse(response);
    });
  }

  /// **HTTP Method: PATCH** (Example - similar to POST/PUT)
  ///
  /// Sends a PATCH request to the specified [endpoint] with the given [body].
  /// The [body] will be JSON encoded.
  /// Optional [queryParams] can be provided.
  /// Optional [customHeaders] can override or add to default headers.
  Future<dynamic> patch(String endpoint, {required Map<String, dynamic> body, Map<String, String>? queryParams, Map<String, String>? customHeaders}) async {
    return _handleRequest(() async {
      final uri = Uri.parse('${Constants.baseUrl}/$endpoint').replace(queryParameters: queryParams);
      final headers = {..._defaultHeaders, ...?customHeaders};
      final encodedBody = jsonEncode(body);

      print('PATCH Request: $uri');
      print('Headers: $headers');
      print('Body: $encodedBody');

      final response = await http.patch(uri, headers: headers, body: encodedBody);
      return _processResponse(response);
    });
  }

  // --- Utility for adding Authorization token ---
  /// Updates the default headers to include an Authorization Bearer token.
  void setAuthToken(String token) {
    _defaultHeaders['Authorization'] = 'Bearer $token';
  }

  /// Clears the Authorization token from default headers.
  void clearAuthToken() {
    _defaultHeaders.remove('Authorization');
  }
}

// --- Custom Exception Class ---
class ApiException implements Exception {
  final String message;
  final int? statusCode; // Optional: to store HTTP status code

  ApiException({required this.message, this.statusCode});

  @override
  String toString() {
    if (statusCode != null) {
      return 'ApiException (Status $statusCode): $message';
    }
    return 'ApiException: $message';
  }
}

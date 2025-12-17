

import 'package:homekru_owner/core/utils/api_constants.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<List<User>> fetchUsers() async {
    try {
      final response = await _apiService.get('users');
      // Assuming response is a List of user objects
      if (response is List) {
        return response.map((json) => User.fromJson(json)).toList();
      }
      throw ApiException(message: 'Invalid response format for users list');
    } on ApiException catch (e) {
      print('API Error fetching users: ${e.message}');
      // Handle specific API errors (e.g., show a message to the user)
      rethrow;
    } catch (e) {
      print('Unexpected error fetching users: $e');
      // Handle other unexpected errors
      rethrow;
    }
  }

  Future<User> createUser(String name, String email) async {
    try {
      final response = await _apiService.post(
        'users',
        body: {'name': name, 'email': email},
        // Example of custom header for a specific request
        // customHeaders: {'X-Transaction-ID': 'some-unique-id'}
      );
      // Assuming response is a single user object
      return User.fromJson(response);
    } on ApiException catch (e) {
      print('API Error creating user: ${e.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error creating user: $e');
      rethrow;
    }
  }

  Future<User> updateUser(int userId, Map<String, dynamic> data) async {
    try {
      final response = await _apiService.put('users/$userId', body: data);
      return User.fromJson(response);
    } on ApiException catch (e) {
      print('API Error updating user $userId: ${e.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error updating user $userId: $e');
      rethrow;
    }
  }

  Future<void> deleteUser(int userId) async {
    try {
      // Delete often returns 204 No Content, so response might be null
      await _apiService.delete('users/$userId');
      print('User $userId deleted successfully.');
    } on ApiException catch (e) {
      print('API Error deleting user $userId: ${e.message}');
      rethrow;
    } catch (e) {
      print('Unexpected error deleting user $userId: $e');
      rethrow;
    }
  }

  // If you use JWT or similar tokens:
  void loginAndSetToken(String token) {
    _apiService.setAuthToken(token);
  }

  void logoutAndClearToken() {
    _apiService.clearAuthToken();
  }
}

// Dummy User model for the example
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0, // Provide default or handle null
      name: json['name'] ?? 'Unknown',
      email: json['email'] ?? 'no-email@example.com',
    );
  }
}

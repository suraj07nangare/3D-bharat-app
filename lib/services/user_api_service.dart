import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

/// Handles the API call to fetch random users.
/// Keeps networking logic separate from the Bloc/UI.
class UserApiService {
  static const String _baseUrl = "https://randomuser.me/api/?results=20";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      return results
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}

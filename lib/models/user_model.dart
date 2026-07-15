/// Simple model representing a user from the RandomUser API.
/// Only holds the dynamic fields we need from the API response.
class UserModel {
  final String firstName;
  final String lastName;
  final int age;
  final String city;
  final String state;
  final String country;
  final String imageUrl;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.city,
    required this.state,
    required this.country,
    required this.imageUrl,
  });

  String get fullName => "$firstName $lastName";

  String get location => "$city, $state";

  /// Creates a UserModel from a single "result" item in the API JSON.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] ?? {};
    final location = json['location'] ?? {};
    final picture = json['picture'] ?? {};

    return UserModel(
      firstName: name['first'] ?? '',
      lastName: name['last'] ?? '',
      age: json['dob']?['age'] ?? 0,
      city: location['city'] ?? '',
      state: location['state'] ?? '',
      country: location['country'] ?? '',
      imageUrl: picture['large'] ?? '',
    );
  }
}

class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.fullName,
    required this.birthDate,
    required this.phoneNumber,
    required this.gender,
    required this.ci,
    required this.createdAt,
  });

  /// User ID of the profile
  final String id;

  /// Username of the profile
  final String username;

  /// Full name of the profile
  final String fullName;

  /// Dni of the profile
  final String ci;

  /// Gender of the profile
  final String gender;

  /// Phone number of the profile
  final String phoneNumber;

  /// Birth date of the profile
  final DateTime birthDate;

  /// Date and time when the profile was created
  final DateTime createdAt;

  /// Returns a new [Profile] instance from a JSON object
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'] as String,
      username: json['username'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      fullName: json['fullname'] as String,
      birthDate: DateTime.parse(json['birthdate'] as String),
      ci: json['ci'] as String,
      gender: json['genero'] as String,
      phoneNumber: json['phonenumber'] as String,
    );
  }

  /// Returns a JSON object from a [Profile] instance
}

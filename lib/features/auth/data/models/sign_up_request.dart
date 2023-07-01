// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpRequest {
  final String email;
  final String username;
  final String password;
  final String fullName;
  final String ci;
  final String phoneNumber;
  final String gender;
  final String birthDate;
  SignUpRequest({
    required this.email,
    required this.username,
    required this.password,
    required this.fullName,
    required this.ci,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
  });

  SignUpRequest copyWith({
    String? email,
    String? username,
    String? password,
    String? fullName,
    String? ci,
    String? phoneNumber,
    String? gender,
    String? birthDate,
  }) {
    return SignUpRequest(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      ci: ci ?? this.ci,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'fullName': fullName,
      'ci': ci,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthDate': birthDate,
    };
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
      fullName: map['fullName'] as String,
      ci: map['ci'] as String,
      phoneNumber: map['phoneNumber'] as String,
      gender: map['gender'] as String,
      birthDate: map['birthDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SignUpRequest(email: $email, username: $username, password: $password, fullName: $fullName, ci: $ci, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate)';
  }

  @override
  bool operator ==(covariant SignUpRequest other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.username == username &&
        other.password == password &&
        other.fullName == fullName &&
        other.ci == ci &&
        other.phoneNumber == phoneNumber &&
        other.gender == gender &&
        other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        username.hashCode ^
        password.hashCode ^
        fullName.hashCode ^
        ci.hashCode ^
        phoneNumber.hashCode ^
        gender.hashCode ^
        birthDate.hashCode;
  }
}

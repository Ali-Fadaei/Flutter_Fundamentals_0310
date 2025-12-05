import 'package:equatable/equatable.dart';

class User extends Equatable {
  //
  final int id;

  final String firstName;

  final String lastName;

  final String? email;

  final String mobileNumber;

  final String address;

  final String? token;

  final bool isRegistered;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.address,
    required this.token,
    required this.isRegistered,
  });

  factory User.fromMap(Map map) {
    return User(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      mobileNumber: map['mobileNumber'],
      address: map['address'],
      token: map['token'],
      isRegistered: map['isRegistered'],
    );
  }

  toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobileNumber': mobileNumber,
      'address': address,
      'token': token,
      'isRegistered': isRegistered,
    };
  }

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        mobileNumber,
        address,
        token,
        isRegistered,
      ];
}

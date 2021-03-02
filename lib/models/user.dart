import 'package:flutter/foundation.dart';
import 'package:roam_free/enums/roles.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String profilePicture;
  final String roleString;

  RolesType role;

  User({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    this.profilePicture,
    @required this.roleString,
  });

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        profilePicture = data['profilePicture'],
        roleString = data['role'] {
    role = roleStringToEnum(roleString);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'profilePicture': profilePicture,
      'role': roleString,
    };
  }

  static RolesType roleStringToEnum(roleString) {
    switch (roleString) {
      case 'user':
        return RolesType.user;
      case 'host':
        return RolesType.host;
      case 'admin':
        return RolesType.admin;
      default:
        return RolesType.no_role;
    }
  }

  static String roleEnumToString(RolesType roleEnum) {
    switch (roleEnum) {
      case RolesType.user:
        return 'user';
      case RolesType.host:
        return 'host';
      case RolesType.admin:
        return 'admin';
      default:
        return 'no_role';
    }
  }
}

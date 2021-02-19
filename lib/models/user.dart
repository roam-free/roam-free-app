class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  User({this.id, this.firstName, this.lastName, this.email});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}

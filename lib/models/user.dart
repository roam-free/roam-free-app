class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String profilePicture;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.profilePicture});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'],
        profilePicture = data['profilePicture'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}

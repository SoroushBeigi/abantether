class User {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  const User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
  });

  User copyWith({required String phoneNumber}) => User(
        id: id,
        email: email,
        phoneNumber: phoneNumber,
        name: name,
      );
}

class User{

  final String email;
  final String password;
  final List<Object> favorites;
  final DateTime createdAt;
  
  User({
    this.email,
    this.password,
    this.favorites,
    this.createdAt
  });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      favorites: json['favorites'],
      createdAt: json['createdAt']
    );
  }

}
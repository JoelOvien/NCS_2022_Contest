class User {
  String? name;
  String? email;
  String? occupation;
  String? username;
  String? password;

  User({
    this.name,
    this.email,
    this.occupation,
    this.username,
    this.password,
  });

  // create toJson model
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'occupation': occupation,
      'username': username,
      'password': password,
    };
  }

  // create fromJson model
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      occupation: json['occupation'],
      username: json['username'],
      password: json['password'],
    );
  }
}

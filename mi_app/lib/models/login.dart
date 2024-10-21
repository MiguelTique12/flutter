class login {
  final String jwt;

  login({required this.jwt});

  factory login.fromJson(Map<String, dynamic> json) {
    return login(
      jwt: json['jwt'],
    );
  }
}

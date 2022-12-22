class User{
  int id;
  String email;
  String username;
  String phone;

  User(this.id, this.email, this.username, this.phone);

  factory User.fromJson(dynamic json){
    return User(json['id'] as int, json['email'] as String, json['username'] as String, json['phone'] as String);
  }
}
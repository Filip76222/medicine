class UserModel {
  late String user_id;
  late String name;
  late String surname;
  late String password;
  late String email;
  late String phone;

  UserModel(this.user_id, this.name, this.surname, this.password, this.email,
      this.phone);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'user_id': user_id,
      'name': name,
      'surname': surname,
      'password': password,
      'email': email,
      'phone': phone,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    user_id = map['user_id'];
    name = map['name'];
    surname = map['surname'];
    password = map['password'];
    email = map['email'];
    phone = map['phone'];
  }
}

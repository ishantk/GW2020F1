class User{

  String name;
  String email;
  String phone;
  String gender;
  String password;

  User({this.name, this.email, this.phone, this.gender, this.password});

  Map<String, dynamic> getUserMap(){
    return {
      'name':this.name,
      'email':this.email,
      'phone':this.phone,
      'gender':this.gender,
    };
  }

}
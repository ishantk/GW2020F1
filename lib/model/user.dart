import 'package:gw2020f1/model/address.dart';

class User{

  String documentID;
  String name;
  String phone;
  String email;
  String gender;

  List<Address> addresses;

  // If we wish to create a User Object with no addresses
  User.init({this.name, this.phone, this.email, this.gender});

  // If we wish to create a User Object with all the attributes
  User.initWithAddresses({this.name, this.phone, this.email, this.gender, this.addresses});
  User.initFromFirebase({this.name, this.phone, this.email, this.gender, this.addresses, this.documentID});

  Map<String, dynamic> toMap(){
   return {
     'name': this.name,
     'phone': this.phone,
     'email': this.email,
     'gender': this.gender,
     'addresses': this.addresses // this is automatically taken as List<Address>
   };
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gw2020f1/model/address.dart';
import 'package:gw2020f1/model/util.dart';


class AddressPage extends StatefulWidget{
  createState() => AddressPageState();
}

addAddress(){
  Address address = Address.init(adrsLine: "2144-B220", city: "Ludhiana", state: "Punjab", zipCode: 141002, label: "Home");
  Firestore db = Firestore.instance;
  db.collection("users").document(Utils.UID).updateData({"addresses":FieldValue.arrayUnion([address.toMap()])}).then((value){

  });
}

fetchAddresses(){
  Firestore db = Firestore.instance;
  db.collection("users").document(Utils.UID).get().then((DocumentSnapshot documentSnapshot) {
    List<Address> addresses = documentSnapshot['addresses']; // ListView builder => data must be shown on UI
    for(int i=0;i<addresses.length;i++){
      Address aRef = addresses[i];
    }
    String name = documentSnapshot['name'];
  });
}

class AddressPageState extends State<AddressPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("Add Address"),
          onPressed: () async{
            addAddress();
          },
        ),
      ),
    );
  }
}
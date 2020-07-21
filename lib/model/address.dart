class Address{

  // Attributes
  String documentID;
  String adrsLine;
  String city;
  String state;
  int zipCode;
  String label;

  // Having a named Constructor can help us to create an Address Object with default constructor i.e. passing no data in the input while object construction
  Address.init({this.adrsLine, this.city, this.state, this.zipCode, this.label});
  Address.initFromFirebase({this.adrsLine, this.city, this.state, this.zipCode, this.label, this.documentID});

  Map<String, dynamic> toMap(){

    /*Map<String, dynamic> map = Map<String, dynamic>();
    map['adrsLine'] = this.adrsLine;
    map['city'] = this.city;
    map['state'] = this.state;
    map['zipCode'] = this.zipCode;
    map['label'] = this.label;
    return map;*/

    return {
      'adrsLine': this.adrsLine,
      'city': this.city,
      'state': this.state,
      'zipCode': this.zipCode,
      'label': this.label,
    };
  }
}
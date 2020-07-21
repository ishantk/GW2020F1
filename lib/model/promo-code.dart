class PromoCode{

  // Attributes
  String documentID;
  String name;
  String description;
  int discount;
  DateTime validTill;

  /*
    // Example Code foe DateTime API
    var now = DateTime.now();
    print(now);
    print(now.runtimeType);
   */

  PromoCode.init({this.name, this.description, this.discount, this.validTill});
  PromoCode.initFromFirebase({this.name, this.description, this.discount, this.validTill, this.documentID});

  Map<String, dynamic> toMap(){
    return {
      'name': this.name,
      'description': this.description,
      'discount': this.discount,
      'validTill': this.validTill
    };
  }
}
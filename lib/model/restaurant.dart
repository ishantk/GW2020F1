class Restaurant{

  // Attributes
  String documentID;
  String name;
  String phone;
  String email;
  String imageUrl;
  List<String> categories;
  List<String> tags;

  Restaurant.init({this.name, this.phone, this.email, this.imageUrl, this.categories, this.tags});
  Restaurant.initFromFirebase({this.name, this.phone, this.email, this.imageUrl, this.categories, this.tags, this.documentID});

  Map<String, dynamic> toMap(){
    return {
      'name': this.name,
      'phone': this.phone,
      'email': this.email,
      'imageUrl': this.imageUrl,
      'categories': this.categories,
      'tags': this.tags
    };
  }
}
class Dish{

  // Attributes
  String documentID;
  String name;
  String category;
  String description;
  int price;
  int discount;
  String imageUrl;
  List<String> tags;

  Dish.init({this.name, this.category, this.description, this.price, this.discount, this.imageUrl, this.tags});
  Dish.initFromFirebase({this.name, this.category, this.description, this.price, this.discount, this.imageUrl, this.tags, this.documentID});

  Map<String, dynamic> toMap(){
    return {
      'name': this.name,
      'category': this.category,
      'description': this.description,
      'price': this.price,
      'discount': this.discount,
      'imageUrl': this.imageUrl,
      'tags': this.tags
    };
  }
}
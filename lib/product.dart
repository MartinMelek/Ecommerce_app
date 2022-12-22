// This class to get these variables only of from product data
class Product{
  String title;
  dynamic price;
  String description;
  String category;
  String image;

  Product(this.title, this.price, this.description, this.category, this.image);

  factory Product.fromJson(dynamic json){
    return Product(json['title'] as String, json['price'] as dynamic,
        json['description'] as String, json['category'] as String, json['image'] as String);
  }
}
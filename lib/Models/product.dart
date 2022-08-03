import 'package:conference/Models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product{
  int id;
  String? name;
  String? image;
  String? details;

  Product(this.id, this.name,
      {this.image, this.details});

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return  Product(
        parsedJson['id'], parsedJson['name'],
      image: parsedJson['image']??"",
      details: parsedJson['details']??""
    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "details": details
    };
  }

}

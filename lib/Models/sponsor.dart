import 'package:conference/Models/event.dart';
import 'package:conference/Models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sponsor{
  int id;
  String? name;
  String? logo;
  String? details;
  String? website;
  String? email;
  String? phone;
  String? address;
  String? country;
  Event? event;
  List<Product>? products;

  Sponsor(this.id, this.name,
      {this.logo, this.event, this.address, this.phone, this.country, this.email, this.website, this.products, this.details});

  factory Sponsor.fromJson(Map<String, dynamic> parsedJson) {
    return  Sponsor(
        parsedJson['id'], parsedJson['name'],
      logo: parsedJson['logo']??"",
      website: parsedJson['website']??"",
      email: parsedJson['email']??"",
      phone: parsedJson['phone']??"",
      address: parsedJson['address']??"",
      details: parsedJson['details']??"",
      country: parsedJson['country']??"",
      event: (parsedJson['event_sponsors']!=null)?Event.fromJson(parsedJson['event_sponsors']):null,
      products: (parsedJson['sponsor_products']!=null)?
    List.from(parsedJson['sponsor_products']).map((elem) {
      return Product.fromJson(elem);
    }).toList() :null,
    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "logo": logo,
      "website": website,
      "email": email,
      "phone": phone,
      "address": address,
      "details": details,
      "country": country,
      "event": event?.toJson(),
    };
  }

}

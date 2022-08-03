import 'package:shared_preferences/shared_preferences.dart';

import 'Itinerary.dart';

class Speaker{
  int id;
  String name;
  String? title;
  String? email;
  String? phone;
  String? bio;
  String? image;
  String? country;
  List<Itinerary>? itineraries = [];

  Speaker(this.id, this.name,
      {this.email, this.phone, this.title, this.bio, this.image,
        this.country, this.itineraries});

  factory Speaker.fromJson(Map<String, dynamic> parsedJson) {
    return  Speaker(
        parsedJson['id'], parsedJson['name'],
        title: parsedJson['title'] ?? "",
        email: parsedJson['email'] ?? "",
        phone: parsedJson['phone'] ?? "",
        bio: parsedJson['bio']??"",
        image: parsedJson['image'] ?? "",
        country: parsedJson['country'] ?? "",
      itineraries: (parsedJson['speaker_itineraries']!=null)?
      List.from(parsedJson['speaker_itineraries']).map((elem) {
        return Itinerary.fromJson(elem);
      }).toList() :null,
    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email ??"",
      "phone": phone??"",
      "title": title??"",
      "name": name,
      "bio":bio ?? "",
      "image":image?? "",
      "country":country ?? ""
    };
  }

}

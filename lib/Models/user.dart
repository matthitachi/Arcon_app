import 'package:shared_preferences/shared_preferences.dart';

class User{
  int id;
  String? first_name;
  String? last_name;
  String email;
  String? phone;
  String? profession;
  String? speciality;
  String? location;
  String? address;
  String? gender;
  String? occupation;
  String? city;
  String? state;
  String? country;

  User(this.id, this.email, this.phone,
      {this.last_name, this.first_name, this.address,this.profession,this.speciality, this.city, this.state,
        this.country, this.gender,this.location, this.occupation});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return  User(
        parsedJson['id'], parsedJson['email'],
      parsedJson['phone']??"",
        first_name: parsedJson['first_name'] ?? "",
        last_name: parsedJson['last_name'] ?? "",
        address: parsedJson['address'] ?? "",
        profession: parsedJson['profession'] ?? "",
        speciality: parsedJson['speciality'] ?? "",
        state: parsedJson['state']??"",
        city: parsedJson['city'] ?? "",
        country: parsedJson['country'] ?? "",
        gender: parsedJson['gender'] ?? "",
      location: parsedJson['location'] ?? "",
      occupation: parsedJson['occupation'] ?? "",
    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "phone": phone,
      "first_name": first_name ?? "",
      "address":address ?? "",
      "profession":profession ?? "",
      "speciality":speciality ?? "",
      "get_state":state?? "null",
      "city":city ?? "",
      "country":country ?? "",
      "last_name":last_name ?? "",
      "location": location ?? "",
      "gender": gender ?? "",
      "occupation": occupation ?? "",
    };
  }

}

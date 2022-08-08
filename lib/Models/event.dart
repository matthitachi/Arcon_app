import 'package:conference/Models/Itinerary.dart';
import 'package:conference/Models/speaker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Event{
  int id;
  String name;
  String? header;
  String? description;
  String? image;
  String? startDate;
  String? endDate;
  String? floorPlan;
  String? streamId;
  bool? isMembership;
  double? amount;
  bool? isPaid;
  String? location;
  String? address;
  String? longitude;
  String? latitude;
  String? state;
  String? country;
  String? createdAt;
  int? transaction;
  List<Speaker>? speakers;
  List<Itinerary>? itineraries;

  Event(this.id, this.name,
      {this.header, this.description, this.image, this.startDate, this.endDate, this.state,
        this.country, this.isMembership,this.location,this.address, this.isPaid,
        this.longitude, this.latitude, this.createdAt, this.speakers, this.amount,
        this.transaction, this.floorPlan, this.streamId, this.itineraries});

  factory Event.fromJson(Map<String, dynamic> parsedJson) {
    return  Event(
        parsedJson['id'], parsedJson['name'],
      description: parsedJson['description']??"",
      header: parsedJson['header']??"",
        image: parsedJson['image'] ?? "",
        startDate: parsedJson['start_date'] ?? "",
        endDate: parsedJson['end_date'] ?? "",
      isPaid: (parsedJson['is_paid'] == 1) ? true: false,
      isMembership: (parsedJson['is_membership'] == 1) ? true: false,
      amount: double.parse(parsedJson['amount'].toString()),
      address: parsedJson['address'] ?? "",
      location: parsedJson['location'] ?? "",
      floorPlan: parsedJson['floor_plan'],
      streamId: parsedJson['stream_id'] ?? "",
      longitude: parsedJson['longitude'] ?? "",
      latitude: parsedJson['latitude'] ?? "",
        state: parsedJson['state']??"",
        country: parsedJson['country'] ?? "",
        createdAt: parsedJson['created_at'] ?? "",
        transaction: parsedJson['event_transactions_count'],
      speakers: (parsedJson['event_speakers']!=null)?
      List.from(parsedJson['event_speakers']).map((elem) {
        return Speaker.fromJson(elem);
      }).toList() :[],
      itineraries: (parsedJson['event_itinerary']!=null)?List.from(parsedJson['event_itinerary']).map((elem) {
        return Itinerary.fromJson(elem);
      }).toList() : [],
    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "header": header,
      "description": description,
      "image": image ?? "",
      "startDate":startDate ?? "",
      "endDate":endDate?? "",
      "floor_plan":floorPlan,
      "stream_id":streamId?? "",
      "isMembership": isMembership ?? false,
      "isPaid": isPaid ?? false,
      "longitude":longitude ?? "",
      "latitude": latitude ?? "",
      "state": state ?? "",
      "country":country ?? "",
      "location": location ?? "",
      "address": address ?? "",
    };
  }

}

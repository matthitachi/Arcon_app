import 'package:conference/Models/speaker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Itinerary{
  int id;
  String title;
  String? details;
  String day;
  String? startTime;
  String? endTime;
  Speaker? speaker;

  Itinerary(this.id, this.title, this.day,
      {this.details, this.startTime, this.endTime, this.speaker});

  factory Itinerary.fromJson(Map<String, dynamic> parsedJson) {
    return  Itinerary(
        parsedJson['id'], parsedJson['title'], parsedJson['day'],
        details: parsedJson['details'] ?? "",
        startTime: parsedJson['start_time'] ?? "0:00",
        endTime: parsedJson['end_time'] ?? "0:00",
      speaker: (parsedJson['itinerary_speaker']!=null)?Speaker.fromJson(parsedJson['itinerary_speaker']):null,

    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "details": details,
      "day":day,
      "startTime":startTime?? "",
      "endTime":endTime ?? "",
    "speaker": speaker?.toJson(),
    };
  }

}

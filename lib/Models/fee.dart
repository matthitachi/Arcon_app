import 'package:conference/Models/event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fee{
  int id;
  String? name;
  String? currency;
  double fee;

  Fee(this.id, this.name, this.fee,
      {this.currency});

  factory Fee.fromJson(Map<String, dynamic> parsedJson) {
    return  Fee(
        parsedJson['id'], parsedJson['name'], parsedJson['fee'],
      currency: parsedJson['currency']??"Naira",
    );
  }
//
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "fee": fee,
      "currency": currency
    };
  }

}

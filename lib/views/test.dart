import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/event.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Models/speaker.dart';
import 'package:conference/Models/user.dart';
import 'package:conference/Service/authdata.dart';
import 'package:conference/Service/event.dart';
import 'package:conference/views/eventsingle.dart';
import 'package:conference/views/liveevent.dart';
import 'package:conference/views/speakersingle.dart';
import 'package:conference/views/test.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';



enum SingingCharacter { lafayette, jefferson }

class PaymentPrompts extends StatefulWidget {
  Event event;

  PaymentPrompts(this.event, {Key? key}) : super(key: key);

  @override
  State<PaymentPrompts> createState() => _PaymentPromptsState(this.event);
}


class _PaymentPromptsState extends State<PaymentPrompts> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  final int PAYMENT_METHOD_PAYSTACK = 0;
  final int PAYMENT_METHOD_FLUTTERWAVE = 1;
  final int TRANSACTION_COMPLETED = 2;
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  User? user;
  Event event;
  String publicKey = '';
  String encryptionKey = '';
  final paystackPlugin = PaystackPlugin();
  _PaymentPromptsState(this.event); // Create a key

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  getUser() async {
    User? getUser = await AuthData.getUser();
    setState(() {
      user = getUser;
    });
    // print(getUser.attr!['address']);
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getPaystackKey() async {
    initLoading();

    EventService service = EventService();
    Response rs = await service.getPaystackKey();
    closeLoading();
    if (rs.status == 200) {
      Map data = rs.data;
      publicKey = data['PUBLIC_KEY'];
      // publicKey = "pk_test_4f379241e6b21392538e63bc6888ddd96945aa3e";
      paystackPlugin.initialize(publicKey: publicKey);
      dynamic response =
      await paystackPayment(context, event.amount.toString(), user!.email);
      if (response != null) {
        print(response);
        CheckoutResponse resp = response;
        print(resp);
        if (resp.status) {
          var reference = resp.reference;
          print(reference);
          print('transaction complete');
          Map<String, dynamic> payInfo = {
            'event_id': event.id,
            'reference': reference,
            'amount': event.amount,
            'status': TRANSACTION_COMPLETED,
            'payment_method': PAYMENT_METHOD_PAYSTACK,
            'description': 'Paid ₦${event.amount} via Paystack',
          };
          print(payInfo);
          sendPayment(payInfo);
        } else {
          displaySnackbar(_key, response.message, Colors.orange);
        }
      }
    } else {
      displaySnackbar(_key,
          "An error occurred while initiating payment.", Colors.redAccent);
    }
  }

  sendPayment(Map<String, dynamic> payInfo) async {
    initLoading();
    EventService service = EventService();
    Response rs = await service.makePayment(payInfo);
    closeLoading();
    if (rs.status == 200) {
      displaySnackbar(_key, rs.message,
          Colors.greenAccent);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => EventSingle(event.id)));

    } else {
      displaySnackbar(_key, rs.message,
          Colors.orangeAccent);
    }
  }

  paystackPayment(context, amountStr, email) async {
    // int amount = (amount + vat.toInt()) * 100 ;
    print(amountStr);
    int amount = (double.parse(amountStr) * 100).toInt();
    initLoading();
    Map<String, dynamic> initDetails = {'amount': amount, 'email': email};
    print(initDetails);
    EventService service = EventService();
    Response rs = await service.initPaystack(initDetails);
    closeLoading();
    if (rs.status == 200) {
      Map data = rs.data;
      var accessCode = data['access_code'];
      var reference = data['reference'];
//      print(data);
      Charge charge = Charge()
        ..amount = amount
        ..reference = reference
        ..accessCode = accessCode
        ..email = email;
      CheckoutResponse response = await paystackPlugin.checkout(
        context,
        method:
        CheckoutMethod.selectable, // Defaults to CheckoutMethod.selectable
        charge: charge,
      );
      return response;
    } else if (rs.status == 401) {
      displaySnackbar(_key, rs.data[0], Colors.orange);
      return null;
    } else {
      displaySnackbar(_key, rs.message, Colors.orange);
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pop(
              context,
            );
          },
          child: Image(
            image: AssetImage(
                'assets/images/menu_icon_back.png'),
          ),
        ),
        ListTile(
          title: const Text('Lafayette'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Thomas Jefferson'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}


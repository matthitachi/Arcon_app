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
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class PaymentPrompt extends StatefulWidget {
  Event event;

  PaymentPrompt(this.event, {Key? key}) : super(key: key);

  @override
  State<PaymentPrompt> createState() => _PaymentPromptState(this.event);
}

enum paymentOptions { Consultants, Participants, Diaspora }

class _PaymentPromptState extends State<PaymentPrompt> {

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
  _PaymentPromptState(this.event); // Create a key

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
  double _height = SizeConfig.safeBlockVertical! * 5;
  double _width = SizeConfig.safeBlockHorizontal! * 10;
  Color _dateBckColor = Color(0x000D605C);
  Color _dateTxtColor = textColor;
  double _minHeights = SizeConfig.safeBlockVertical! * 0;
  double _bottomLeft = SizeConfig.safeBlockVertical! * 1.5;
  double _bottomRight = SizeConfig.safeBlockVertical! * 1.5;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
      _height = SizeConfig.safeBlockVertical! * 8;
      _width = SizeConfig.safeBlockHorizontal! * 12;
      _dateBckColor = Color(0xFF0D605C);
      _dateTxtColor = Colors.white;
    });
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
    paymentOptions? _character = paymentOptions.Consultants;
    SizeConfig().init(context);
    return Scaffold(
      key: _key,
      body: Container(
        child: Stack(
          children: [
            const Center(
              child: Image(
                image: AssetImage('assets/images/background.png'),
                width: 1600,
                height: 1200,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: SizeConfig.safeBlockHorizontal! * 100,
                height: SizeConfig.safeBlockVertical! * 19,
                color: Colors.white,
              ),
            ),

            // BODY
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal! * 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _key.currentState!.openDrawer();
                              },
                              child: Image(
                                image:
                                    AssetImage('assets/images/menu_icon.png'),
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                            ),
                            Text(
                              "",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: SizeConfig.safeBlockHorizontal! * 5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: SizeConfig.safeBlockHorizontal! * 15,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // body
                Container(
                  height: SizeConfig.safeBlockVertical! * 96.5,
                  width: SizeConfig.safeBlockHorizontal! * 100,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.safeBlockHorizontal! * 5,
                        vertical: 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 2,
                        ),

                        // each speaker
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.safeBlockHorizontal! * 2),
                          child: Container(
                            width: SizeConfig.safeBlockHorizontal! * 100,
                            child: GestureDetector(
                              child: Column(
                                children: [
                                  Center(
                                    child: Image.network(
                                      event.image ?? '',
                                      fit: BoxFit.cover,
                                      height:
                                          SizeConfig.safeBlockVertical! * 30,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1.5,
                                  ),
                                  GestureDetector(
                                    // onTap: () async {
                                    //   Navigator.of(context).push(
                                    //       MaterialPageRoute(builder: (context) => exhibitorSingle()));
                                    // },
                                    child: Row(
                                      children: [
                                        Container(
                                          width:
                                              SizeConfig.blockSizeHorizontal! *
                                                  90,
                                          child: Text(
                                            "Sorry, You do not have a subscription to view this event",
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  4,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1.5,
                                  ),
                                  // horizontal line
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical:
                                              SizeConfig.safeBlockHorizontal! *
                                                  3),
                                      child: Container(
                                        width:
                                            SizeConfig.safeBlockVertical! * 90,
                                        child: Divider(
                                          height: 1,
                                          thickness:
                                              SizeConfig.safeBlockHorizontal! *
                                                  .2,
                                          color: Colors.black38,
                                        ),
                                      )
                                  ),
                                  // horizontal line end
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1.5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Container(
                                        width:
                                            SizeConfig.blockSizeHorizontal! *
                                                70,
                                        child: Text(
                                          event.name,
                                          style: GoogleFonts.montserrat(
                                            color: textColor,
                                            fontSize: SizeConfig
                                                    .safeBlockHorizontal! *
                                                4,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1.5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Start Date: ",
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              DateFormat('d MMM yyyy').format(DateTime.parse(event.startDate??'')),
                                              style: GoogleFonts.montserrat(
                                                color: textColor,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal! *
                                                    3,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: SizeConfig.safeBlockVertical! * 1.5,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "End Date: ",
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              DateFormat('d MMM yyyy').format(DateTime.parse(event.endDate??'')),
                                              style: GoogleFonts.montserrat(
                                                color: textColor,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal! *
                                                    3,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: SizeConfig.safeBlockVertical! * 1.5,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                          focusColor: mainColor,
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            'Conference fees Consultants: ₦50000.00',
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                  .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          leading: Radio<paymentOptions>(
                                            fillColor: MaterialStateColor.resolveWith((states) => secondaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => secondaryColor),
                                            value: paymentOptions.Consultants,
                                            groupValue: _character,
                                            onChanged: (paymentOptions? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                          contentPadding: EdgeInsets.zero,
                                          minVerticalPadding: 0,
                                          title: Text(
                                              'Residents and other Participants: ₦30000.00',
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                  .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          leading: Radio<paymentOptions>(
                                            fillColor: MaterialStateColor.resolveWith((states) => secondaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => secondaryColor),
                                            value: paymentOptions.Participants,
                                            groupValue: _character,
                                            onChanged: (paymentOptions? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                                          contentPadding: EdgeInsets.zero,
                                          minVerticalPadding: 0,
                                          title: Text(
                                              'Diaspora: USD100.00',
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                  .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          leading: Radio<paymentOptions>(
                                            fillColor: MaterialStateColor.resolveWith((states) => secondaryColor),
                                            focusColor: MaterialStateColor.resolveWith((states) => secondaryColor),
                                            value: paymentOptions.Diaspora,
                                            groupValue: _character,
                                            onChanged: (paymentOptions? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: SizeConfig.safeBlockHorizontal! *
                                            20,
                                        child: Expanded(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 20,
                                                child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      for (Speaker speaker
                                                      in event.speakers?.take(4) ?? <Speaker>[])
                                                        Positioned(
                                                            left: 0,
                                                            child: Avatar(
                                                                urlImage: speaker.image ?? '',
                                                                radius:
                                                                SizeConfig.safeBlockHorizontal! *
                                                                    2.1))
                                                    ]),
                                              ),
                                              Text(
                                                "${event.speakers?.length ?? 0} Speakers",
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.dmSans(
                                                  color: textColor,
                                                  fontSize: SizeConfig
                                                          .safeBlockHorizontal! *
                                                      2.5,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 1.5,
                                  ),
                                  Row(
                                    children: [
                                       Expanded(
                                            child: GestureDetector(
                                                onTap: (){
                                                  getPaystackKey();
                                                },
                                                child:Container(
                                              decoration: BoxDecoration(
                                                  color: secondaryColor,
                                                  borderRadius:
                                                  BorderRadius.circular(30)),
                                              padding: EdgeInsets.all(8),
                                              child: const Center(
                                                child: Text(
                                                  "Make Payment",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),

            // Navigation
            Positioned(
              bottom: 0,
              left: SizeConfig.safeBlockHorizontal! * 2.5,
              child: SafeArea(
                child: Column(
                  children: [
                    Container(
                        width: SizeConfig.safeBlockHorizontal! * 95,
                        height: SizeConfig.safeBlockVertical! * 9,
                        decoration: BoxDecoration(
                          color: mainColorSub,
                          borderRadius: BorderRadius.all(Radius.circular(
                              SizeConfig.safeBlockVertical! * 6)),
                        ),
                        child: Navigation(
                          selectedIndex: selectedIndex,
                          onClicked: onClicked,
                        )),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 1,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}

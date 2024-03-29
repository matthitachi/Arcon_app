import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';


customYMargin(double y) => SizedBox(height: y);
customXMargin(double x) => SizedBox(width: x);
screenWidth(context) => MediaQuery.of(context).size.width;
screenHeight(context) => MediaQuery.of(context).size.height;

String? getCookie(Headers headers) {
  String? rawCookie = headers.value("set-cookie");
  String resultCookie = "";
  if (rawCookie != null) {
    int index = rawCookie.indexOf(';');
    resultCookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
    // index = resultCookie.indexOf('=');
    // resultCookie = (index == -1) ? rawCookie : rawCookie.substring(index+1, resultCookie.length);
    return resultCookie;
  }
  return null;
}

Widget HeaderandSub(context, header, subheader, {space = 5.0}) => Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            maxLines: 1,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: space,
          ),
          if (subheader == null || subheader == "")
            Container()
          else
            Text(
              subheader,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
        ],
      ),
    );

Widget HeaderandSub2(@required context, header, subheader,
        {space = 5.0, pad = 0.0}) =>
    Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: pad),
      width: screenWidth(context),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1.0, color: Colors.black.withOpacity(0.1)),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            header,
            maxLines: 1,
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: space,
          ),
          if (subheader != null && subheader != "")
            Text(
              subheader,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
        ],
      ),
    );

Widget InputboxandLabel(label,
        {space: 10.0,
        autofocus: false,
        hintText: "",
        keyboardType: TextInputType.text,
        obscureText: false,
        validator,
        controller,
        maxLines: 1}) =>
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          SizedBox(height: space),
          TextFormField(
            keyboardType: keyboardType,
            autofocus: autofocus,
            obscureText: obscureText,
            validator: validator,
            maxLines: maxLines,
            controller: controller,
//  initialValue: 'MrK@gmail.com',
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                fillColor: Colors.grey.withOpacity(0.3),
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
//            disabledBorder: new OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: new BorderSide(color: Colors.yellow.withOpacity(1))),
//            focusedBorder: new OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: new BorderSide(color: Colors.yellow.withOpacity(1))),
                enabledBorder: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        new BorderSide(color: Colors.grey.withOpacity(0.1))),
                border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        new BorderSide(color: Colors.grey.withOpacity(0.1)))),
          )
        ],
      ),
    );
Widget BodyInputboxandLabel(label,
        {space: 10.0,
        autofocus: false,
        hintText: "",
        keyboardType: TextInputType.text,
        obscureText: false}) =>
    Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          SizedBox(height: space),
          TextFormField(
            keyboardType: keyboardType, autofocus: autofocus,
            obscureText: obscureText, textAlign: TextAlign.right,
//  initialValue: 'MrK@gmail.com',
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.7),
                ),
                fillColor: Colors.grey.withOpacity(0.3),
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                )),
          )
        ],
      ),
    );

Widget paragraph(text,
        {marginLeft: 0.0,
        marginRight: 0.0,
        marginTop: 10.0,
        marginDown: 0.0,
        fontSize: 15.0}) =>
    Container(
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginDown),
      child: Text(text,
          style: TextStyle(fontSize: fontSize, fontFamily: 'Montserrat')),
    );
Widget richParagraph(text,
        {marginLeft: 0.0,
        marginRight: 0.0,
        marginTop: 10.0,
        marginDown: 0.0,
        fontSize: 15.0,
        children}) =>
    Container(
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginDown),
      child: RichText(
          text: TextSpan(
              text: text,
              style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.black87,
                  fontFamily: 'Montserrat'),
              children: children)),
    );
Widget Header(text,
        {marginLeft: 0.0,
        marginRight: 0.0,
        marginTop: 10.0,
        marginDown: 0.0,
        fontSize: 20.0}) =>
    Container(
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginDown),
      child: Text(text,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
    );

displaySnackbar(scaffoldkey, content, background) {
  scaffoldkey.currentState.showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: background,
    elevation: 1000,
    behavior: SnackBarBehavior.floating,
  ));
}

startTime(secs, function) async {
  var duration = new Duration(seconds: secs);
  return new Timer(duration, function);
}

currencyFMT(val) {
//  FlutterMoneyFormatter fmf = FlutterMoneyFormatter(
//      amount: val
//  );
//  return fmf.output.nonSymbol;
  final formatCurrency =  NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

  return formatCurrency.format(val);
//return val;
}
setTtmeLocale() async {
  await Jiffy.locale("fr");
}
timeDiffForHumans(date) {
  return Jiffy(date).fromNow();
//      .fromNow();
}

appendParam(List param) {
  String urlParam = '';
  for (String e in param) {
    urlParam += '/' + e;
  }
  return urlParam;
}

Widget alertDialog(
    BuildContext context, String Header, String Description, fnYEs, fnNo) {
  return AlertDialog(
    title: Text(Header),
    content: Text(Description),
    actions: <Widget>[
      TextButton(
        onPressed: fnNo,
        child: const Text('No'),
      ),
      TextButton(
        onPressed: fnYEs,
        child: const Text('Yes'),
      ),
    ],
  );
}

String getRandomString(int length) {
  const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}

// callCompleteDialog(context, String text, {String subtext: '', String img: '', barrierDismissible: true, String buttonText: 'Continue', onClose}) {
//   return showDialog(
//     barrierDismissible: barrierDismissible,
//     context: context,
//     builder: (BuildContext context) =>
//         completeDialog(context, text, subtext: subtext, buttonText: buttonText, img: img, onClose: onClose),
//   );
// }

// Widget completeDialog(BuildContext context, String text,
//     {String subtext: '', String img: '', String buttonText: 'Continue', onClose}) {
//   return AlertDialog(
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10)
//     ),
//     contentPadding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
// //      title: const Text('About Pop up'),
//     content: Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: <Widget>[
//         if(img != '')
//           Padding(padding: EdgeInsets.symmetric(vertical: 10.h),
//             child: Image.asset(img, fit: BoxFit.cover,height: 100,width: 100,),)
//           ,
//         SizedBox(height: 10.h,),
//         Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 16.sp,
//             fontWeight: FontWeight.bold
//           ),
//         ),
//         SizedBox(height: 20.h,),
//         if(subtext != '')
//          Text(
//             subtext, textAlign: TextAlign.center,
//             style: TextStyle(color: Color(0xff1B1B1B).withOpacity(0.6), fontSize: 10.sp),
//           ),
//         SizedBox(height: 20.h,),
//         Row(
//           children: [
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: () async {
//                   Navigator.pop(context);
//                   onClose();
//                 },
//                 child: Text(
//                   buttonText,
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(
//                         Color(0xff065E54)),
//                     padding: MaterialStateProperty.all(
//                         EdgeInsets.symmetric(
//                             vertical: 15, horizontal: 20)),
//                     side: MaterialStateProperty.all(
//                         BorderSide(color: Color(0xff065E54))),
//                     shape: MaterialStateProperty.all<
//                         RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                           borderRadius:
//                           BorderRadius.circular(10.0)),
//                     )),
//               ),
//             )
//           ],
//         ),
//
//       ],
//     ),
//   );
// }

initLoading(){
  EasyLoading.show(
    status: 'Loading...',
    maskType: EasyLoadingMaskType.black,
  );
}
closeLoading(){
  if(EasyLoading.isShow){
    EasyLoading.dismiss();
  }

}

focus(BuildContext context){
  FocusScope.of(context).requestFocus(FocusNode());
}
Widget backButton(BuildContext context){
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    ),
    child: Icon(
      Icons.arrow_back,
      color: Color(0xff065E54),
    ),
    onPressed: () {
      if(Navigator.canPop(context)){
        Navigator.of(context).pop();
      }
    },
  );
}

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}
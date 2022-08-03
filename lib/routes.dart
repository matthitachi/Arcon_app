
import 'package:conference/views/home.dart';
import 'package:conference/views/onboading/forgot.dart';
import 'package:conference/views/onboading/signin.dart';
import 'package:conference/views/onboading/signup.dart';
import 'package:conference/views/onboading/splash.dart';
import 'package:conference/views/onboading/verify.dart';
import 'package:conference/views/onboading/welcome.dart';
import 'package:flutter/material.dart';


const String SPLASHSCREEN = '/splashscreen';
const String HOME = '/';
const String LOGIN = '/loginpage';
const String WELCOME = '/welcome';
const String REGISTER = '/register';
const String FORGOTPAGE = '/forgotpage';
const String VERIFYSCREEN = '/verifyscreen';
const String RESETSCREEN = '/resetscreen';
const String INVESTMENTPAGE = '/investmentpage';
const String PASSWORD = '/password';
const String IMAGEHOST = '';



Map <String, WidgetBuilder> routes = <String, WidgetBuilder>{
  SPLASHSCREEN: (BuildContext context) => Splash(),
  HOME: (BuildContext context) =>  const Home(),
  FORGOTPAGE: (BuildContext context) =>  const Forgot(),
  VERIFYSCREEN: (BuildContext context) => const Verify(),
  LOGIN: (BuildContext context) =>  const SignIn(),
  REGISTER: (BuildContext context) =>  SignUp(),
  WELCOME: (BuildContext context) =>  Welcome(),
  // OTP: (BuildContext context) =>  Otp(),
  // RESETSCREEN: (BuildContext context) => const ResetPage(),
  // INVESTMENTPAGE: (BuildContext context) => const investmentpage(),
  // WALLET: (BuildContext context) => const wallet(),
  // VERIFICATION: (BuildContext context) => verification(),
  // REFERRAL: (BuildContext context) => referral(),
  // PASSWORD: (BuildContext context) =>  password(),
  // TRANSACTIONS: (BuildContext context) =>  transactions(),
  // BASICDETAILS: (BuildContext context) =>  basicdetails(),
  // PHONE: (BuildContext context) =>  phone(),
  // BVN: (BuildContext context) =>  bvn(),
  // IDVERIFICATION: (BuildContext context) => id_verification(),
  // PHONEVERIFICATION: (BuildContext context) =>  const PhoneVerification(),
};
import 'package:conference/Helpers/helper.dart';
import 'package:conference/Models/response.dart';
import 'package:conference/Service/auth.dart';
import 'package:conference/views/onboading/signin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Stack(
            children: [
              const Center(
                child: Image(
                  image: AssetImage('assets/images/background.png'),
                  width: 1600,
                  height: 1500,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: SizeConfig.safeBlockVertical! * 100,
                  height: SizeConfig.safeBlockVertical! * 30,
                  color: Colors.white,
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.safeBlockVertical! * 15,
                            ),
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                              width: SizeConfig.safeBlockHorizontal! * 53,
                            ),
                            SizedBox(
                              height: SizeConfig.safeBlockVertical! * 10,
                            ),
                          ],
                        ),
                      ),
                      Form(key: formKey,
                          child:Container(
                        height: SizeConfig.safeBlockVertical! * 65,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal! * 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Get Started",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.montserrat(
                                          color: textColor,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal! *
                                                  7.5,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Get access to every conference, ",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.dmSans(
                                          color: textColor,
                                          fontSize:
                                              SizeConfig.safeBlockHorizontal! *
                                                  3.5,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: SizeConfig.safeBlockVertical! * 2,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "First Name",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color: mainColor,
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal! *
                                                                3,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig
                                                              .safeBlockVertical! *
                                                          1.5,
                                                    ),
                                                    Container(
                                                      height: SizeConfig
                                                              .safeBlockVertical! *
                                                          5,
                                                      child: TextFormField(
                                                        controller:
                                                            firstNameController,
                                                        validator: (value) {
                                                          List isEmpty =
                                                              Validator.isEmpty(
                                                                  value);
                                                          if (isEmpty[0]) {
                                                            return isEmpty[1]
                                                                .toString();
                                                          }
                                                          return null;
                                                        },
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: mainColor,
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              3,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                        keyboardType:
                                                            TextInputType.name,
                                                        cursorColor: mainColor,
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.transparent,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 14.0,
                                                                  bottom: 5.0,
                                                                  top: 5.0),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFECE2DC),
                                                              width: 0.8,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFECE2DC),
                                                              width: 0.8,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Last Name",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            color: mainColor,
                                                            fontSize: SizeConfig
                                                                    .safeBlockHorizontal! *
                                                                3,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig
                                                              .safeBlockVertical! *
                                                          1.5,
                                                    ),
                                                    Container(
                                                      height: SizeConfig
                                                              .safeBlockVertical! *
                                                          5,
                                                      child: TextFormField(
                                                        controller:
                                                            lastNameController,
                                                        validator: (value) {
                                                          List isEmpty =
                                                              Validator.isEmpty(
                                                                  value);
                                                          if (isEmpty[0]) {
                                                            return isEmpty[1]
                                                                .toString();
                                                          }
                                                          return null;
                                                        },
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          color: mainColor,
                                                          fontSize: SizeConfig
                                                                  .safeBlockHorizontal! *
                                                              3,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                        keyboardType:
                                                            TextInputType.name,
                                                        cursorColor: mainColor,
                                                        decoration:
                                                            InputDecoration(
                                                          filled: true,
                                                          fillColor:
                                                              Colors.transparent,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 14.0,
                                                                  bottom: 5.0,
                                                                  top: 5.0),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFECE2DC),
                                                              width: 0.8,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFECE2DC),
                                                              width: 0.8,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            SizeConfig.safeBlockVertical! * 1.5,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Email Address",
                                              style: GoogleFonts.montserrat(
                                                color: mainColor,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal! *
                                                    3,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.safeBlockVertical! * 1.5,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.safeBlockVertical! * 5,
                                          child: TextFormField(
                                            controller: emailController,
                                            validator: (value) {
                                              List isEmpty =
                                                  Validator.isEmpty(value);
                                              if (isEmpty[0]) {
                                                return isEmpty[1].toString();
                                              }
                                              return null;
                                            },
                                            style: GoogleFonts.montserrat(
                                              color: mainColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            keyboardType: TextInputType.name,
                                            cursorColor: mainColor,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 5.0,
                                                      top: 5.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFECE2DC),
                                                  width: 0.8,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFECE2DC),
                                                  width: 0.8,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height:
                                              SizeConfig.safeBlockVertical! * 1,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Password",
                                              style: GoogleFonts.montserrat(
                                                color: mainColor,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal! *
                                                    3,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height:
                                              SizeConfig.safeBlockVertical! * 1.5,
                                        ),
                                        Container(
                                          height:
                                              SizeConfig.safeBlockVertical! * 5,
                                          child: TextFormField(
                                            controller: passwordController,
                                            validator: (value) {
                                              List isEmpty =
                                                  Validator.isEmpty(value);
                                              List min = Validator.min(value, 8);
                                              if (isEmpty[0]) {
                                                return isEmpty[1].toString();
                                              }
                                              if (min[0]) {
                                                return min[1].toString();
                                              }
                                              return null;
                                            },
                                            obscureText: obscureText,
                                            style: GoogleFonts.montserrat(
                                              color: mainColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  3,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            cursorColor: mainColor,
                                            decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    obscureText = !obscureText;
                                                  });
                                                },
                                                icon: Icon(
                                                  obscureText
                                                      ? Icons.visibility_rounded
                                                      : Icons
                                                          .visibility_off_rounded,
                                                  color: mainColor,
                                                  size: 15,
                                                ),
                                              ),
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 14.0,
                                                      bottom: 8.0,
                                                      top: 13.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFECE2DC),
                                                  width: 0.8,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFECE2DC),
                                                  width: 0.8,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Sign Up",
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                              color: textColor,
                                              fontSize: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  5.5,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: SizeConfig.safeBlockVertical! * 2,
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                          SignIn()));
                                            },
                                            child: Text(
                                              "Sign in",
                                              textAlign: TextAlign.left,
                                              style: GoogleFonts.dmSans(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: textColor,
                                                fontSize: SizeConfig
                                                        .safeBlockHorizontal! *
                                                    3.5,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  RawMaterialButton(
                                    onPressed: () async {
                                      if (formKey.currentState!
                                          .validate()) {
                                        initLoading();
                                        Map<String, dynamic> formInfo = {
                                          'first_name':
                                          firstNameController.text,
                                          'last_name':
                                          lastNameController.text,
                                          'email': emailController.text,
                                          'password':
                                          passwordController.text,
                                        };
                                        print(formInfo);
                                        Auth auth = Auth();
                                        Response rs =
                                            await auth.Register(formInfo);
                                        closeLoading();
                                        if (rs.status == 200) {
                                          displaySnackbar(
                                              scaffoldKey,
                                              "Sign Up successful.",
                                              Colors.greenAccent);

                                          startTime(
                                              1,
                                                  () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                          SignIn())));
                                        } else {
                                          passwordController.clear();
                                          displaySnackbar(
                                              scaffoldKey,
                                              rs.message,
                                              Colors.orange
                                                  .withOpacity(0.6));
                                        }
                                      }
                                    },
                                    elevation: 2.0,
                                    fillColor: secondaryColor,
                                    child: Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 35.0,
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    shape: CircleBorder(),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

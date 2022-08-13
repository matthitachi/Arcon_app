import 'package:conference/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/SizeConfig.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class policy extends StatefulWidget {
  const policy({Key? key}) : super(key: key);

  @override
  _policyState createState() => _policyState();

}

class _policyState extends State<policy> {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key


  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5),
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
                                image: AssetImage('assets/images/menu_icon.png'),
                                width: SizeConfig.safeBlockHorizontal! * 7,
                              ),
                            ),
                            Text(
                              "Privacy Policy",
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
                  height: SizeConfig.safeBlockVertical! * 95,
                  width: SizeConfig.safeBlockHorizontal! * 100,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                    child:  ListView(
                      children: [
                        Container(
                          child: Text(
                            "Privacy Policy",
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "Association of Radiation and Clinical Oncologists of Nigeria built the Arcon app as an Ad Supported app. This SERVICE is provided by Association of Radiation and Clinical Oncologists of Nigeria at no cost and is intended for use as is."
                                "This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service."
                                "If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy."
                                "The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Arcon unless otherwise defined in this Privacy Policy."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Information Collection and Use",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to First Name, Last Name, Phone Number, Email, City, State, Nationality, Contact Address, Employer's Information. The information that we request will be retained by us and used as described in this privacy policy."
                                "The app does use third-party services that may collect information used to identify you."
                                "Link to the privacy policy of third-party service providers used by the app"
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Log Data",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Cookies",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory."
                                "This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Service Providers",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "We may employ third-party companies and individuals due to the following reasons:"
                                "•	To facilitate our Service;"
                                "•	To provide the Service on our behalf;"
                                "•	To perform Service-related services; or"
                                "•	To assist us in analyzing how our Service is used."
                            "We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Security",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Links to Other Sites",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Children’s Privacy",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions."
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Changes to This Privacy Policy",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page."
                                "This policy is effective as of 2022-08-04"
                            ,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child:
                          Row(
                            children: [
                              Text(
                                "Contact Us",
                                style: GoogleFonts.poppins(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child:
                          Text(
                            "If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at secetariat@arconigeria.org.",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              color: mainColor,
                              fontSize: SizeConfig.safeBlockHorizontal! * 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 15,
                        )
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
                        child: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,)
                    ),
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
      drawer: const drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}

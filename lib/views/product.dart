
import 'package:conference/Models/product.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../Helpers/validator.dart';
import '../../utils/SizeConfig.dart';
import '../../utils/constants.dart';
import '../widgets/drawer.dart';
import '../widgets/navigation.dart';

class ProductPage extends StatefulWidget {
  Product product;

  ProductPage(this.product, {Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState(this.product);
}

class _ProductPageState extends State<ProductPage> {
  bool obscureText = true;
  bool _isVisible = true;
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
Product product;
  _ProductPageState(this.product); // Create a key


  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  void initState(){
    super.initState();
  }



  @override


  Widget build(BuildContext context)  {
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
                                  Navigator.of(
                                    context,
                                  ).pop(
                                    context,
                                  );
                                },
                                child: Image(
                                  image: AssetImage('assets/images/menu_icon_back.png'),
                                  width: SizeConfig.safeBlockHorizontal! * 7,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 5,
                          ),
                          Column(
                            children: [
                              Center(
                                child: Image.network(
                                  product.image ?? '',
                                  fit: BoxFit.cover,
                                  height: SizeConfig.safeBlockVertical! * 7,
                                  errorBuilder:
                                      (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 2,
                              ),
                              Text(
                                product.name??'',
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 4,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // body
                  Container(
                    height: SizeConfig.safeBlockVertical! * 78,
                    width: SizeConfig.safeBlockHorizontal! * 100,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal! * 5, vertical: 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(
                          height: SizeConfig.safeBlockVertical! * 2,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Details",
                                    style: GoogleFonts.montserrat(
                                      fontSize: SizeConfig.safeBlockHorizontal! * 3.5,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * .5,
                              ),
                              Text(
                                product.details??'',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.dmSans(
                                  color: mainColor,
                                  fontSize: SizeConfig.safeBlockHorizontal! * 3,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ),

                  )
                ],
              ),

            ],
          ),
        ),
      drawer: drawer(),
      // bottomNavigationBar: Navigation(selectedIndex: selectedIndex, onClicked: onClicked,),
    );
  }
}
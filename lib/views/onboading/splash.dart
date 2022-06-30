import 'package:conference/views/onboading/welcome.dart';
import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';


class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  bool cirAn = false;
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>welcome()));
  }


  @override


  Widget build(BuildContext context)  {
    SizeConfig().init(context);
    return Scaffold(
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
              Container(
                child: Center(
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      Padding(
                        padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal! * 7),
                        child: Image(
                            image: AssetImage('assets/images/logo.png'),
                          width: SizeConfig.safeBlockHorizontal! * 53,
                          ),
                      ),
                      ],
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}
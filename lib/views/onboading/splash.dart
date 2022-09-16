import 'package:conference/Service/authdata.dart';
import 'package:conference/routes.dart';
import 'package:conference/views/onboading/welcome.dart';
import 'package:flutter/material.dart';

import '../../utils/SizeConfig.dart';


class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool cirAn = false;
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }


  void navigationToNextPage() async{
    String? token  = await AuthData.getToken();
    if(token == null){
      Navigator.of(context).pushReplacementNamed(WELCOME);
    }else{
      Navigator.of(context).pushReplacementNamed(HOME);
    }

  }
  _navigatetohome() async{
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    navigationToNextPage();
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
                  height: 1400,
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
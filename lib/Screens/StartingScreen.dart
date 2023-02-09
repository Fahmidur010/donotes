import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:donotes/Style/Style.dart';
import 'package:get/get.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 5),(){
        Get.offNamed("/notesscreen");
    }
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('Assets/Images/Logo.png'),alignment: Alignment.center,),
                  Text("Do Notes", style: H1Text(colorDarkBlue)),
                  Text("Store Your Notes Easily",style: H2Text(colorLightGray))
                ],
              ),
            ),
          )
        ],
      ),



    );
  }
}

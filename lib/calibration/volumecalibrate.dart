import 'package:dichotic/Start_Page.dart';
import 'package:dichotic/calibration/leftearcalibrate.dart';
import 'package:flutter/material.dart';

class VolumeCalibrate extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarHeight = appBar.preferredSize.height;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text("Calibrate volume"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, (screenHeight - appBarHeight - statusBarHeight) * 0.2, 0, (screenHeight - appBarHeight - statusBarHeight) * 0.01),
              child: Icon(
                Icons.headphones_outlined,
                size: 300,
              ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, (screenHeight - appBarHeight - statusBarHeight) * 0.02),
            child: Text(
              "Let's calibrate the volume on each channel L and R",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16
              )
              )
          ),
        OutlinedButton(
        style:OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 3,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
        ),
        child: Text(
            "Continue",
             style: TextStyle(
                 color: Colors.black,
                 fontSize: 16
             )
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => LeftEarCalibrate()));
        }
    ),
        ],
      ),
    )
    );
  }

}
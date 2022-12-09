
import 'package:audioplayers/audioplayers.dart';
import 'package:dichotic/Start_Page.dart';
import 'package:flutter/material.dart';

class RightEarCalibrate extends StatefulWidget{
  final double leftEarResult;
  const RightEarCalibrate({super.key,required this.leftEarResult});

  @override
  State<StatefulWidget> createState() => RightEarCalibrateState(leftsideoffset: leftEarResult);

}

class RightEarCalibrateState extends State<RightEarCalibrate>{
  final double leftsideoffset;
  RightEarCalibrateState({
    required this.leftsideoffset
});

  var rightsideoffset = 0.0;
  var _value = 0.0;
  String sound = "calibration/1000R2.wav";
  AudioPlayer player = AudioPlayer();


  @override
  void initState(){
    // TODO: implement initState

    super.initState();
    changeVolume(player, _value);
    play(sound, player);

  }

  void play(String filepath, AudioPlayer player) async{
    await player.play(AssetSource(filepath));

  }
  void pause(AudioPlayer player) async{
    await player.pause();

  }


  void changeVolume(AudioPlayer player, double value) async{
    await player.setVolume(value);
  }

@override
  void dispose() {
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Right Ear"),
        centerTitle: true,
        backgroundColor: Colors.transparent,

      ),
      body: Center(child: Column(
        children: [
          Icon(
            Icons.arrow_forward,
            size: 150,
          ),
          Text(
              "Focus on your right ear, slide the slider until you cannot hear the sound + ${_value}"
          ),
        SliderTheme(
          data: SliderThemeData(
            thumbColor: Colors.black,
            inactiveTrackColor: Colors.black12,
            activeTrackColor: Colors.black45,
          ),
          child: Slider(
              min: 0,
              max: 1,
              value:_value,
              onChanged: (value){
                setState(() {
                  _value = value;
                  changeVolume(player, value);
                  rightsideoffset = _value;
                });
              }),
        ),
          Row(
            children: [
              TextButton(onPressed: (){
                setState(() {
                  player.state != PlayerState.playing ? play(sound, player) : pause(player);
                });
              }, child: Text(
                "Play/Pause",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                ),)),
              TextButton(onPressed: (){
                setState(() {
                  player.stop();
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => StartApp(title: "tekst")));
                });
              }, child: Text(
                "Done",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16
                ),)),

              Text(
                  "right - left ${rightsideoffset - leftsideoffset}"
              ),
            ],

          )

        ],
      ),
      ),
    );
  }



}


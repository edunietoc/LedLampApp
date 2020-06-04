

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;


class SliderRGB extends StatefulWidget {
  
  final String sliderColor;
  const SliderRGB(this.sliderColor);
  @override
  _SliderRGBState createState() => _SliderRGBState(sliderColor);
}


List <int> rgb = new List(3);

class _SliderRGBState extends State<SliderRGB> {
  Color colorTrack;
  Color colorThumb;
  Color inactColorTrack;
  String sliderColor;


  _SliderRGBState(this.sliderColor){
    
    switch (sliderColor) {
      case "red":
        colorTrack = Colors.red[400];
        colorThumb = Colors.red[800];
        inactColorTrack = Colors.red[100];
        break;

      case "blue":
        colorTrack = Colors.blue[400];
        colorThumb = Colors.blue[800];
        inactColorTrack = Colors.blue[100];
        break;

      case "green":
        colorTrack = Colors.green[400];
        colorThumb = Colors.green[800];
        inactColorTrack = Colors.green[100];
        break;

      default:
    }


  }


Future<http.Response> sendRGBData1() {

  return http.post(
    'http://192.168.4.1/data',
    headers: <String, String>{
      'Content-Type': 'text/html; charset=UTF-8',
    },
    body: rgb.toString(),
  );
}

  double slidervalue = 0;

  Widget build(BuildContext context) {
    return SliderTheme(data: SliderTheme.of(context).copyWith(
    activeTrackColor: colorTrack,
    trackHeight: 4.0,
    thumbColor: colorThumb,
    inactiveTrackColor: inactColorTrack
    ), child: 
          Slider(value: slidervalue, onChanged: (value){
              setState(() {
                  slidervalue = value;
                  if(sliderColor=="red"){
                    rgb[0] = slidervalue.toInt();
                    sendRGBData1();
                    print(rgb);
                    
                  }
                  if(sliderColor=="green"){
                    rgb[1] = slidervalue.toInt();
                   sendRGBData1();
                   print(rgb);
                  }
                  if(sliderColor=="blue"){
                    rgb[2] = slidervalue.toInt();
                   sendRGBData1();
                   print(rgb);
                  }
                  

                });
              }, min: 0, max: 255,));
  }
}


class TextTitleRGB extends StatelessWidget {
  final String text;
  const TextTitleRGB(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600

      ),)
    );
  }
}
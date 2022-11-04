import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:weather_app/models/weather.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String place = "Kathmandu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Homepage Screen")),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding:EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val){
                  if(val.length >=3){
                    setState(() {
                      place = val;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weather Location',
                  hintText: 'Kathmandu',
                ),
              ),
            ),

            FutureBuilder<Weather?>(
              builder:(context,snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }

                if (snapshot.data!= null){
                  Weather? _weather = snapshot.data;
                  if(_weather == null){
                    return Text("Kathmandu");
                  }
                  else {
                    return weatherBox(_weather);
                  }
                }
                else {
                  return CircularProgressIndicator();
                }
              },
              future: getCurrentWeather(),


              //
              // }) ,)
            ),

          ],
        ),
        ),

    );

  }


  Widget weatherBox(Weather _weather) {
    return Column(
      children: [
        // Text("Temp:${_weather.temp}*C"),
        Text("Lat:${_weather.lat}"),
        Text("Lon:${_weather.lon}"),
        Text("Condition:${_weather.condition}"),
        // Text("Icon:${_weather.icon}"),
        // // Text("${_weather.}"),
        // Text("Feels:${_weather.lat}*C"),


        //
        // Text("Temp_C:${_weather.temp}*C"),
        // // Text("${_weather.}"),
        // Text("Feels:${_weather.lat}*C"),




      ],
    );
  }

  Future<Weather?> getCurrentWeather() async {
    Weather? weather;
    // String city ="Kathmandu";
    // String apiKey ="07ab48c4a9d2415592485359220311";
    // var url ="http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=48.8567,2.350";
    // var url ="http://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=07ab48c4a9d2415592485359220311&units=metric";
    try {
      var url = "http://api.weatherapi.com/v1/forecast.json?key=07ab48c4a9d2415592485359220311&q=$place&days=1&aqi=yes&alerts=yes";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        weather = Weather.fromJson(jsonDecode(response.body));
      }
      else {
//ToDO: THrow error here
      }
      return weather;
    }catch(e,stack){
      print("Err $e Stack $stack");
    }
  }
}
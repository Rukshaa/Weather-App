
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'dart:convert';
//
// import 'models/weather.dart';
//
// class CurrentWeather extends StatefulWidget {
//   const CurrentWeather({Key? key}) : super(key: key);
//
//   @override
//   _CurrentWeatherState createState() => _CurrentWeatherState();
// }
//
// class _CurrentWeatherState extends State<CurrentWeather> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Center(
//         child: FutureBuilder<Weather?>(
//           builder:(context,snapshot) {
//             if(snapshot.connectionState==ConnectionState.waiting){
//               return const CircularProgressIndicator();
//             }
//
//             if (snapshot.data!= null){
//               Weather? _weather = snapshot.data;
//               if(_weather == null){
//                 return Text("Kathmandu");
//               }
//               else {
//                 return weatherBox(_weather);
//               }
//             }
//                 else {
//               return CircularProgressIndicator();
//             }
//             },
//     future: getCurrentWeather(),
//
//
//           //
//           // }) ,)
//       ),
//       ),
//     );
//   }
//
//   Widget weatherBox(Weather _weather) {
//     return Column(
//       children: [
//         Text("Condition:${_weather.condition}*C"),
//         // Text("${_weather.}"),
//          Text("Feels:${_weather.lat}*C"),
//       //   Text("H:${_weather.high}*C L:${_weather.low}*C"),
//       ],
//     );
//     }
//
//   Future<Weather?> getCurrentWeather() async {
//     Weather? weather;
//     // String city ="Kathmandu";
//     // String apiKey ="07ab48c4a9d2415592485359220311";
//     // var url ="http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=48.8567,2.350";
//     // var url ="http://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid=07ab48c4a9d2415592485359220311&units=metric";
// try {
//   var url = "http://api.weatherapi.com/v1/forecast.json?key=07ab48c4a9d2415592485359220311&q=Kathmandu&days=1&aqi=yes&alerts=yes";
//
//   final response = await http.get(Uri.parse(url));
//
//   if (response.statusCode == 200) {
//     weather = Weather.fromJson(jsonDecode(response.body));
//   }
//   else {
// //ToDO: THrow error here
//   }
//   return weather;
// }catch(e,stack){
//   print("Error $e Stack $stack");
// }
//   }
// }

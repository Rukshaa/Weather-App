import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather_app/homepage.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override

   void initState(){
     super.initState();
     Timer(Duration(seconds:5),()=> Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage())));
   }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         width: double.infinity,
         height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background_image.png"),
          )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text("We show weather for you",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              ),
                ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              padding: const EdgeInsets.all(20),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomePage()),
                );
              },
              child: const Text('SKIP'),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
            // fit:BoxFit.cover,

          ),
    );
    
  }
}
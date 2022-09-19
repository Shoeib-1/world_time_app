// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;

    String bgImg = data["isDayimg"] ? "bright.jpg" : "dark.jpg";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(31, 73, 68, 68),
            image: DecorationImage(
                image: AssetImage("assets/$bgImg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/Location');
                  setState(() {
                    if (result == null) {
                      data = {
                        "time": "Error",
                        "location": "Please choose location",
                        "isDayimg": false
                      };
                    } else {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayimg": result["isDayimg"]
                      };
                    }
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Color.fromARGB(137, 112, 111, 111),
                  size: 24.0,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 154, 158, 182)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                width: double.infinity,
                color: Color.fromARGB(24, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      data["time"],
                      style: TextStyle(
                          fontSize: 44,
                          color: Color.fromARGB(255, 189, 194, 224)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(
                          fontSize: 28,
                          color: Color.fromARGB(255, 189, 194, 224)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:world_time_app/classes/getData-class.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoading() async {
    AllFlag AllFlagss = AllFlag(
      countryName: "Egypt",
      flag: "egypt",
      link: "Africa/Cairo",
    );
    await AllFlagss.getData();

    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      "time": AllFlagss.timeNow,
      "location": AllFlagss.timeZone,
      "isDayimg": AllFlagss.isDayimg,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(137, 112, 111, 111),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(
              size: 110.0,
              color: Color.fromARGB(255, 9, 199, 167),
            )
          ],
        ),
      ),
    );
  }
}

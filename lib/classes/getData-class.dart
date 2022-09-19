// ignore_for_file: file_names

import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class AllFlag {
  final String flag;
  final String countryName;
  final String link;
  AllFlag({required this.flag, required this.countryName, required this.link});

  late bool isDayimg;
  late String timeNow;
  late String timeZone;

  getData() async {
    Response receivedDataFromAPI =
        await get(Uri.parse('http://worldtimeapi.org/api/timezone/$link'));

    Map receivedData = jsonDecode(receivedDataFromAPI.body);
    DateTime dateTime = DateTime.parse(receivedData["utc_datetime"]);

    int offset = int.parse(receivedData["utc_offset"].substring(0, 3));

    DateTime realTime = dateTime.add(Duration(hours: offset));
    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayimg = true;
    } else {
      isDayimg = false;
    }

    timeNow = DateFormat("hh:mm a").format(realTime);

    timeZone = receivedData["timezone"];
  }
}

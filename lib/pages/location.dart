import 'package:flutter/material.dart';
import 'package:world_time_app/classes/getData-class.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AllFlag> allcountry = [
    AllFlag(
      countryName: 'Egypt - Cairo',
      flag: 'egypt.png',
      link: 'Africa/Cairo',
    ),
    AllFlag(
      countryName: '	Saudi Arabia - Riyadh',
      flag: 'sa.png',
      link: 'Asia/Riyadh',
    ),
    AllFlag(
      countryName: 'Tunisia - Tunis',
      flag: 'tunisia.png',
      link: 'Africa/Tunis',
    ),
    AllFlag(
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png',
        link: 'Africa/Algiers'),
    AllFlag(
        countryName: 'Australia - Sydney',
        flag: 'australia.png',
        link: 'Australia/Sydney'),
    AllFlag(
      countryName: 'Canada - Toronto',
      flag: 'canada.png',
      link: 'America/Toronto',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 216, 216),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 164, 170, 172),
        title: Text(
          "Choose Location",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: allcountry.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(9),
                child: Card(
                  child: ListTile(
                    onTap: () async {
                      AllFlag clickCountry = allcountry[index];
                      await clickCountry.getData();
                      Navigator.pop(context, {
                        "time": clickCountry.timeNow,
                        "location": clickCountry.timeZone,
                        "isDayimg": clickCountry.isDayimg,
                      });
                    },
                    title: Text(
                      allcountry[index].countryName,
                      style: TextStyle(fontSize: 22),
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/${allcountry[index].flag}"),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

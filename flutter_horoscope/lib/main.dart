import 'package:flutter/material.dart';
import 'package:flutter_horoscope/year.dart';
import 'package:http/http.dart';
import 'dart:convert';

// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'day.dart';
import 'month.dart';
import 'week.dart';
import 'year.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:url_launcher/url_launcher.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(fontFamily: 'Montserrat'),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = 'http://horoscope-api.herokuapp.com/horoscope/today/Virgo';
  var weekUrl = 'http://horoscope-api.herokuapp.com/horoscope/week/Virgo';
  var monthUrl = 'http://horoscope-api.herokuapp.com/horoscope/month/Virgo';
  var yearUrl = 'http://horoscope-api.herokuapp.com/horoscope/year/Virgo';

  String virgoDay;
  String virgoWeek;
  String virgoMonth;
  String virgoYear;
  var currentDate;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    fetchData();
  }

  fetchData() async {
    var day = await get(url);
    var week = await get(weekUrl);
    var month = await get(monthUrl);
    var year = await get(yearUrl);

    print('upppp');

    var dayDetail = jsonDecode(day.body);
    virgoDay = dayDetail['horoscope'];
    // virgoDay = dayDetail;

    var weekDetail = jsonDecode(week.body);
    virgoWeek = weekDetail['horoscope'];

    var monthDetail = jsonDecode(month.body);
    virgoMonth = monthDetail['horoscope'];

    var yearDetail = jsonDecode(year.body);
    virgoYear = yearDetail['horoscope'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: virgoDay == null
          ? Center(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF141E30), Color(0xFF243B55)],
                    ),
                ),
                child: SpinKitPulse(
                  color: Colors.white,
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  // colors: [Color(0xFF29323C), Color(0xFF485563)],
                  colors: [Color(0xFF141E30), Color(0xFF243B55)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/pd.jpeg'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: currentDate.hour < 12
                            ? Text(
                                "Good Morning\n PD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  "Good Evening\n PD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => Month(),
                                  settings: RouteSettings(
                                    arguments: virgoMonth,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF2C3E50),
                                      Color(0xFF4CA1AF)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Monthly\nHoroscope',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => Year(),
                                  settings: RouteSettings(
                                    arguments: virgoYear,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF4B79A1),
                                      Color(0xFF283E51)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Yearly\nHoroscope',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => Day(),
                                  settings: RouteSettings(arguments: virgoDay),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF29323C),
                                      Color(0xFF485563)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Daily\nHoroscope',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => Week(),
                                  settings: RouteSettings(
                                    arguments: virgoWeek,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF000428),
                                      Color(0xFF004e92)
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: SizedBox(
                                width: 150,
                                height: 150,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      'Weekly\nHoroscope',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white54,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

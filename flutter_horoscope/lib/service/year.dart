import 'package:flutter/Material.dart';

class Year extends StatefulWidget {
  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context).settings.arguments;

     var curntDate = DateTime.now();
    // /String dd = curntDate.day.toString();
    String yy = curntDate.year.toString();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF434343)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Heres your horoscope for \n the year',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '$yy',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
              child: Container(
                height: 450,
                // color: Colors.blueGrey,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4B79A1), Color(0xFF283E51)],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      data,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

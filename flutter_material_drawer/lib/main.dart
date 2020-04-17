import 'package:flutter/material.dart';
import 'package:flutter_material_drawer/first.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('KP'),
              accountEmail: Text('kaveen@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  'KP',
                ),
                backgroundColor: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(
                Icons.home,
              ),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
            ListTile(
              title: Text('Next Page'),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => First(),
                ),
              ),
            ),
            Divider(),
            // ListTile(
            //   title: Text('Previous Page'),
            //   trailing: Icon(
            //     Icons.arrow_back_ios,
            //   ),
            // ),
            // Divider(),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text(
            'HOME',
          ),
        ),
      ),
    );
  }
}

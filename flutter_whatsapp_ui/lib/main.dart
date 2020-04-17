import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_ui/Pages/camera.dart';
import 'package:flutter_whatsapp_ui/Pages/calls.dart';
import 'package:flutter_whatsapp_ui/Pages/status.dart';
import 'package:flutter_whatsapp_ui/Pages/chats.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xFF075e54),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'WhatsApp',
          ),
          bottom: TabBar(
            //labelPadding: EdgeInsets.only(right: 25),
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.camera_alt,
                ),
              ),
              Tab(
                child: Text(
                  'CHATS',
                ),
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'CALLS',
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.more_vert,
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            Camera(),
            Chats(),
            Status(),
            Calls(),
          ],
        ),
      ),
    );
  }
}

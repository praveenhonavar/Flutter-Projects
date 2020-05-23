import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_firebase/main.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  List todos = ['P', 'D'];
  String items = '';
  String todo;

  CollectionReference collectionReference =
      Firestore.instance.collection('flutter-signin-firebase');

  Future createTodo() async {

     await collectionReference.document().setData(
        {
          'Name':"PDDD",
          'Age':'200'
        }
      );

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Fuser d = ModalRoute.of(context).settings.arguments;
    // print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO',
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('flutter-signin-firebase')
              .snapshots(),
          builder: (context, snapshot) {
            print('dwnfpnfp' + snapshot.data);

            return ListView.builder(
              itemCount: snapshot.data,
              itemBuilder: (BuildContext context, index) {
                return Dismissible(
                  key: Key(todos[index]),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data.toString()),
                      trailing: FlatButton.icon(
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                        icon: Icon(Icons.delete),
                        label: Text('delete'),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        return showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Add items'),
            content: TextField(
              onChanged: (items) {
                todo = items;
              },
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  setState(() {
                    todos.add(todo);
                  });
                },
                child: Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        );
      }),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    d.img,
                  ),
                  radius: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Signed IN as ${d.uname}',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            OutlineButton.icon(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              onPressed: () => signOut().whenComplete(() {
                Navigator.pop(context);
              }),
              icon: Icon(
                Icons.exit_to_app,
              ),
              label: Text('Signout'),
            )
          ],
        ),
      ),
    );
  }
}

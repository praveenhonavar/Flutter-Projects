import 'package:flutter/material.dart';
import 'pokemon.dart';

class PokeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Pokemon details = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text(
          details.name,
        ),
      ),
      body: bodyWidget(context, details),
    );
  }

  bodyWidget(BuildContext context, Pokemon details) => Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            // child: Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              borderOnForeground: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.,
                children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          details.img,
                          scale: .5,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    details.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Height:${details.height}',
                  ),
                  Text(
                    'Weight:${details.weight}',
                  ),
                  Text(
                    'Types',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: details.type
                        .map((t) => FilterChip(
                            label: Text(
                              t,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                //backgroundColor: Colors.white,
                                color: Colors.white,
                              ),
                            ),
                            //selected: true,
                            showCheckmark: false,
                            selected: true,
                            selectedColor: Colors.greenAccent,
                            //backgroundColor: Colors.green,

                            onSelected: null))
                        .toList(),
                  ),
                  Text(
                    'Weakness',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: details.weaknesses
                        .map(
                          (t) => FilterChip(
                            label: Text(
                              t,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            onSelected: null,
                            disabledColor: Colors.redAccent,
                          ),
                        )
                        .toList(),
                  ),
                  Text(
                    'Next Evolution',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: details.nextEvolution == null
                        ? List<Widget>(0)
                        : details.nextEvolution
                            .map((n) => FilterChip(
                                disabledColor: Colors.lightBlueAccent,
                                label: Text(
                                  n.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onSelected: null))
                            .toList(),
                  ),
                  Text(
                    'Previous Evolution',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: details.prevEvolution == null
                        ? List<Widget>(0)
                        : details.prevEvolution
                            .map((t) => FilterChip(
                                disabledColor: Colors.yellowAccent,
                                label: Text(t.name),
                                onSelected: null))
                            .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}

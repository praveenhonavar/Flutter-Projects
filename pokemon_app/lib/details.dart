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
                children: <Widget>[
                  Text(
                    details.name,
                  ),
                  Text(
                    'Height:${details.height}',
                  ),
                  Text(
                    'Weight:${details.weight}',
                  ),
                  Text(
                    'Types',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: details.type
                        .map(
                            (t) => FilterChip(label: Text(t), onSelected: null))
                        .toList(),
                  ),
                  Text(
                    'Weakness',
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: details.weaknesses
                        .map(
                            (t) => FilterChip(label: Text(t), onSelected: null))
                        .toList(),
                  ),

                  Text(
                    'Next Evolution',
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: details.nextEvolution==null? ()=>print('efef'):details.nextEvolution
                  //       .map((t) => FilterChip(label: Text(t.name), onSelected: null))
                  //       .toList(),
                  // ),

                  //  Text(
                  //   'Previous Evolution',
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: details.prevEvolution
                  //       .map((t) => FilterChip(label: Text(t.name), onSelected: null))
                  //       .toList(),
                  // ),
                ],
              ),
            ),
          ),
        ],
      );
}

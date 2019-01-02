
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';



class Second extends StatefulWidget {
   Set<WordPair> saved = new Set<WordPair>();
  Second(this.saved);

  @override
  Seconddetail createState() => Seconddetail(saved);

}

class Seconddetail extends State<Second> {

   Set<WordPair> saved = new Set<WordPair>();

  Seconddetail(this.saved);

  @override

    Widget build(BuildContext context) {
      // TODO: implement build
      final Iterable<ListTile> tiles = saved.map(
            (WordPair pair) {
          return new ListTile(
            title: new Text(
              ''
             // pair,
              //style: _biggerFont,

            ),
          );
        },
      );
      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
//          backgroundColor: Colors.pink[100],
        title: const Text('Saved Suggestions'),

      ),
      body: new ListView(children: divided),
    );
  }

}
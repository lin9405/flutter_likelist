

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'second.dart';

class RandomWordsState extends State<RandomWords> {



  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        leading: new Icon(
          alreadySaved ? Icons.star : Icons.star_border,
          color: alreadySaved ? Colors.yellow : null,

        ),

        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            }
            else {
              _saved.add(pair);
            }
          });
        }
    );
  }

  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = new Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);


  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        itemBuilder: (BuildContext _context, int i) {
          // Add a one-pixel-high divider widget before each row
          // in the ListView.
          if (i.isOdd) {
            return new Divider();
          }

          final int index = i ~/ 2;
          // If you've reached the end of the available word
          // pairings...
          if (index >= _suggestions.length) {
            // ...then generate 10 more and add them to the
            // suggestions list.
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: false,

        //     backgroundColor: Colors.pink[100],
        title: new Text('21300322 Park Chaerin', style: new TextStyle(),),

        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.list), onPressed: () {
            Second(_saved);
          }),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}


class RandomWords extends StatefulWidget {

  @override
  RandomWordsState createState() => new RandomWordsState();
}


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.blue.shade100,

        //  backgroundColor: Colors.red,
      ),

      home:  new RandomWords(),                 // ... this line.
    );
  }
}
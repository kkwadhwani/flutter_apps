import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List movies = [
    "Rocky",
    "Life of Pi",
    "KGF 2",
    "Tere Naam",
    "Dilliwale",
    "Batman",
    "Superman",
    "Chachi 420",
    "Dabang",
    "Dangal",
    "Ganga Jal",
    "Joker",
    "Inception",
    "Titanic",
    "Wall Street",
    "Catch Me If You Can",
    "Gatsby"
  ];

  // const MovieList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
        backgroundColor: Colors.blueGrey.shade900,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey.shade50,
      body: ListView.builder(
        //Listview
        itemCount: movies.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          //itembuilder
          return Card(
            elevation: 2.5,
            color: Colors.white,
            child: ListTile(
              title: Text(movies[index]),
              subtitle: Text("Subtitle"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetails(
                              movieName: movies.elementAt(index),
                            )));
              },
              // onTap: () => debugPrint("Movie name is ${movies[index]}"),
              leading: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.blue,
                    borderRadius: BorderRadius.circular(13.9),
                  ),
                  child: Text("H"),
                ),
              ),
              trailing: Text("---"),
            ),
          );
        },
      ),
    );
  }
}

//New route or say page. In flutter its called route

class MovieDetails extends StatelessWidget {
  final String movieName;
  const MovieDetails({Key key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies List"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        child: RaisedButton(
          child: Text(
            "Go back : $movieName",
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

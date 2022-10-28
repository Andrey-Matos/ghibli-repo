import 'package:flutter/material.dart';

import '../models/movie.dart';

class FilmDetail extends StatefulWidget {
  FilmDetail({required this.movie});
  final Movie movie;

  @override
  _FilmDetailState createState() => _FilmDetailState(movie);
}

class _FilmDetailState extends State<FilmDetail> {
  Movie movie;

  _FilmDetailState(this.movie);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: Image.network(
            movie.image,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(32.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    movie.title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: 10),
                  Container(
                      child: Text(
                    "Rating : ${movie.rating}",
                    style: TextStyle(color: Colors.red),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                      child: Text(
                    movie.description,
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  )),
                ],
              )),
            ],
          ),
        )
      ],
    ));
  }
}

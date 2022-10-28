import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  Movie movie;
  MovieCard({
    required this.movie,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Row(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.height / 5,
              child: Image.network(movie.image)),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .05, right: 8),
                  child: Text(
                    movie.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                Divider(
                  color: Colors.red,
                  thickness: 2,
                ),
                Text(
                  movie.originalTitle,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                ),
                //Divider()
              ],
            ),
          )
        ],
      ),
    );
  }
}

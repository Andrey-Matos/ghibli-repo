import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghibli_repository/controllers/search_controller.dart';
import '../http/movie_handler.dart';
import '../models/movie.dart';
import '../controllers/film_controller.dart';
import '../screens/film_detail.dart';
import 'movie_card.dart';

class FilmListPage extends StatefulWidget {
  //const FilmListPage();
  FilmController controller = FilmController();
  @override
  _FilmListPageState createState() => _FilmListPageState();
}

class _FilmListPageState extends State<FilmListPage> {
  late Future<List<Movie>> futureFilms;
  late List<Movie> lista = [];

  @override
  void initState() {
    super.initState();
    futureFilms = fetchAllFilm();
  }

  callback(value) {
    setState(() {
      lista = value;
    });
  }

  Widget createListView(List<Movie> films) {
    return ListView.builder(
      itemCount: films.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FilmDetail(
                          movie: films[index],
                        )),
              );
            },
            child: MovieCard(movie: films[index]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(callback: callback, list: lista),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<List<Movie>>(
          future: futureFilms,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              lista = snapshot.data!;
              return createListView(lista);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  SearchBar({Key? key, required this.list, required this.callback})
      : super(key: key);
  List list;
  Function callback;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(hintText: 'search'),
            controller: controller,
            onSubmitted: (value) =>
                SearchController.filter(value, list, callback)));
  }
}

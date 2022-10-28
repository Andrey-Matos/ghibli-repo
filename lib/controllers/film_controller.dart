import '../http/movie_handler.dart';
import '../models/movie.dart';

class FilmController {
  late Future<List<Movie>> _futureFilms;
  List<Movie> _films = [];

  List<Movie> get films => _films;
  set films(newList) => _films = newList;

  Future<List<Movie>> get futureFilms => _futureFilms;

  fetchFuture() {
    _futureFilms = fetchAllFilm();
  }
}

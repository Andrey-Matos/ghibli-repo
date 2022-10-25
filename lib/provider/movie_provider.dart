import 'package:flutter/foundation.dart';
import 'package:ghibli_repository/http/movie_handler.dart';
import '../models/movie.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _fetchResult = [];
  List<Movie> _viewList = [];

  List<Movie> get getMovies {
    //fetchAll();
    return _viewList;
  }

  void fetchAll() async {
    var l = await fetchMovie();
    _fetchResult = l.map((item) => Movie.fromJson(item)).toList();
    _viewList = _fetchResult;
    notifyListeners();
  }

  void filterMovies(String searchName) {
    _viewList = _viewList.where((i) => i.title.contains(searchName)).toList();
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

Future fetchMovie() async {
  final response =
      await http.get(Uri.parse('https://ghibliapi.herokuapp.com/films'));

  if (response.statusCode == 200) {
    var l = json.decode(response.body);
    return l.map((item) => Movie.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load movie');
  }
}

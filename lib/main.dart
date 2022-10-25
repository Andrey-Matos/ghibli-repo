import 'package:flutter/material.dart';
import 'package:ghibli_repository/provider/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MovieProvider(),
    child: homeScreen(),
  ));
}

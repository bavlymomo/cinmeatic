import 'dart:convert';
import 'package:cinmeatic/data/Models/movie.dart';
import 'package:flutter/services.dart' show rootBundle;

class MovielistApi {
  static Future<List<Movie>> loadJson() async {
    try {
      final response = await rootBundle.loadString('assets/data/Movies.json');
      final data = jsonDecode(response);
      if(data['movies'] == null) return [];
      final List moviesList = data['movies'];   
      return moviesList.map((e) => Movie.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

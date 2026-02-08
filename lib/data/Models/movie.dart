

class Movie  {
  final int id;
  final String title;
  final String image;
  final double rating;
  final String releaseDate;
  final String duration;
  final String language;
  final String overview;
  final List<String> genres;

  const Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.releaseDate,
    required this.duration,
    required this.language,
    required this.overview,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      releaseDate: json['release_date'],
      duration: json['duration'],
      language: json['language'],
      overview: json['overview'],
      genres: List<String>.from(json['genres']),
    );
  }


}

class Movie {
  String title;
  String originalTitle;
  String description;
  String image;
  String rating;

  Movie(this.title, this.originalTitle, this.description, this.image,
      this.rating);

  Movie.fromJson(json)
      : title = json['title'],
        originalTitle = json['original_title'],
        description = json['description'],
        image = json['image'],
        rating = json['rt_score'];

  @override
  toString() {
    return "title: $title, original title: $originalTitle rating: $rating";
  }
}

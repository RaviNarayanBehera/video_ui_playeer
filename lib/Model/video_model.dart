class Movie {
  String description;
  String sources;
  String subtitle;
  String thumb;
  String title;

  Movie({
    this.description = '',
    this.sources = '',
    this.subtitle = '',
    this.thumb = '',
    this.title = '',
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      description: json['description'] ?? '',
      sources: json['sources'] ?? '',
      subtitle: json['subtitle'] ?? '',
      thumb: json['thumb'] ?? 'https://www.shutterstock.com/image-vector/play-button-icon-vector-illustration-600nw-1697833306.jpg',
      title: json['title'] ?? '',
    );
  }
}
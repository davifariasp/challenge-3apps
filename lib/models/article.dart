class Article {
  int id;
  String goal;
  List<String> tags;
  String title;
  String author;
  String content;
  String imageUrl;
  DateTime publishedDate;

  Article({
    required this.id,
    required this.goal,
    required this.tags,
    required this.title,
    required this.author,
    required this.content,
    required this.imageUrl,
    required this.publishedDate,
  });

  // Método para converter JSON em um objeto Article
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      goal: json['goal'],
      tags: List<String>.from(json['tags']), // Convertendo a lista de tags
      title: json['title'],
      author: json['author'],
      content: json['content'],
      imageUrl: json['image_url'], // Nome do campo no JSON
      publishedDate: DateTime.parse(json['published_date']), // Convertendo a string para DateTime
    );
  }
}

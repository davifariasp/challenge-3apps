import 'dart:convert';

import 'package:challenge_3apps/data/datasources/remote/http/http_client.dart';
import 'package:challenge_3apps/interfaces/i_articles_repository.dart';
import 'package:challenge_3apps/models/article.dart';

class ArticlesRepository extends IArticlesRepository {
  final HttpClient client;

  ArticlesRepository({required this.client});

  @override
  Future getArticles() async {
    final response =
        await client.get(url: "https://api.npoint.io/cd5cc92e412c4058c90d");

    if (response.statusCode == 200) {
      List<Article> articles = [];

      final body = jsonDecode(response.body);

      body['articles'].forEach((article) {
        articles.add(Article.fromJson(article));
      });

      return articles;
    } else {
      throw Exception("Erro ao buscar os artigos");
    }
  }
}

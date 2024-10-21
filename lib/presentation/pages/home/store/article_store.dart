import 'package:challenge_3apps/interfaces/i_articles_repository.dart';
import 'package:challenge_3apps/models/article.dart';
import 'package:flutter/material.dart';

class ArticlesStore {
  final IArticlesRepository repository;
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List> list = ValueNotifier<List>([]);
  final ValueNotifier<String> error = ValueNotifier<String>('');

  ArticlesStore({required this.repository});

  getArticles() async {
    isLoading.value = true;

    try {
      List<Article> articles = await repository.getArticles();
      list.value = articles;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}

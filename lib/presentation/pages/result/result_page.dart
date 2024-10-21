import 'package:challenge_3apps/data/datasources/remote/http/http_client.dart';
import 'package:challenge_3apps/data/datasources/remote/repositories/articles_repository.dart';
import 'package:challenge_3apps/enums/goal.dart';
import 'package:challenge_3apps/models/article.dart';
import 'package:challenge_3apps/models/data_user.dart';
import 'package:challenge_3apps/presentation/pages/home/store/article_store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultPage extends StatefulWidget {
  final DataUser dataUser;
  const ResultPage({super.key, required this.dataUser});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<Article> articlesFiltered = [];
  final ArticlesStore articlesStore =
      ArticlesStore(repository: ArticlesRepository(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    articlesStore.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String filter = '';

    if (widget.dataUser.goal == Goal.lossWeight) {
      filter = 'weight_loss';
    } else {
      filter = 'weight_gain';
    }

    openBottomSheet(Article article) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: size.height,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      article.imageUrl,
                      scale: 0.8,
                    ),
                    Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(article.author),
                    article.tags.isNotEmpty
                        ? Text("Tags: ${article.tags.join(', ')}")
                        : const SizedBox(),
                    Text(
                        "Publicado em: ${DateFormat('dd/MM/yyyy').format(article.publishedDate)}"),
                    Text(
                      article.content,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Resultado"),
        ),
        body: Column(
          children: [
            Text(widget.dataUser.caloriesDay.toString()),
            AnimatedBuilder(
                animation: Listenable.merge([
                  articlesStore.isLoading,
                  articlesStore.list,
                  articlesStore.error
                ]),
                builder: (context, child) {
                  if (articlesStore.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else if (articlesStore.error.value.isNotEmpty) {
                    return Text(articlesStore.error.value);
                  } else {
                    var filteredList = articlesStore.list.value
                        .where((article) => article.goal == filter)
                        .toList();

                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredList[index].title),
                            onTap: () => openBottomSheet(filteredList[index]),
                          );
                        },
                      ),
                    );
                  }
                })
          ],
        ));
  }
}

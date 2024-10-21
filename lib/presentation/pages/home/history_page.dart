import 'package:challenge_3apps/data/datasources/local/repositories/history_repository.dart';
import 'package:challenge_3apps/enums/activity_level.dart';
import 'package:challenge_3apps/enums/gender.dart';
import 'package:challenge_3apps/enums/goal.dart';
import 'package:challenge_3apps/models/data_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late HistoryRepository repository;

  @override
  Widget build(BuildContext context) {
    repository = Provider.of<HistoryRepository>(context);

    DataUser? history = repository.getHistory();

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            (history == null)
                ? const Text('Nenhum registro')
                : Column(
                    children: [
                      Text('Peso: ${history.weight}'),
                      Text('Altura: ${history.height}'),
                      Text('Idade: ${history.age}'),
                      Text('Gênero: ${history.gender.displayName}'),
                      Text(
                          'Nível de atividade: ${history.activityLevel.displayName}'),
                      Text('Objetivo: ${history.goal.displayName}'),
                      Text('Calorias: ${history.caloriesDay.roundToDouble()}'),
                    ],
                  ),
            TextButton(
                onPressed: () {
                  repository.clear();
                },
                child: const Text('Limpar'))
          ],
        ),
      ),
    );
  }
}

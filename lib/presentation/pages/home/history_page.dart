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
        title: const Text(
          'Histórico',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (history == null)
                    ? const Text('Nenhum registro')
                    : Container(
                        padding: const EdgeInsets.all(20.0),
                        height: size.height * 0.6,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 244, 67, 54),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Peso: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: history.weight.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Altura: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: history.height.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Idade: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: history.age.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Gênero: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: history.gender.displayName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Nível de atividade: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text:
                                              history.activityLevel.displayName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Objetivo: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: history.goal.displayName,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Calorias: ',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: history.caloriesDay
                                              .roundToDouble()
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        fixedSize:
                            MaterialStateProperty.all(const Size(200, 50)),
                      ),
                      onPressed: () {
                        repository.clear();
                      },
                      child: const Text(
                        'Limpar',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

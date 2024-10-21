import 'package:challenge_3apps/app.dart';
import 'package:challenge_3apps/data/datasources/local/repositories/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HistoryRepository(),
      child: const MyApp(),
    ),
  );
}
import 'package:challenge_3apps/presentation/pages/home/calculator_page.dart';
import 'package:challenge_3apps/presentation/pages/home/history_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tabIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: tabIndex);
  }

  setTab(tab) {
    setState(() {
      tabIndex = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: setTab,
        children: const [CalculatorPage(), HistoryPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Calculadora',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_timeline),
            label: 'Histórico',
          ),
        ],
        onTap: (page) {
          pageController.animateToPage(page,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}

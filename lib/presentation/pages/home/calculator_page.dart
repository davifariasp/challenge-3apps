import 'package:challenge_3apps/data/datasources/local/repositories/history_repository.dart';
import 'package:challenge_3apps/enums/activity_level.dart';
import 'package:challenge_3apps/enums/gender.dart';
import 'package:challenge_3apps/enums/goal.dart';
import 'package:challenge_3apps/models/data_user.dart';
import 'package:challenge_3apps/presentation/pages/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late HistoryRepository historyRepository;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _ageController;

  Gender? selectedGender;
  ActivityLevel? selectedActivityLevel;
  Goal? selectedGoal;
  double tmb = 0.0;

  @override
  void initState() {
    super.initState();
    _weightController = TextEditingController();
    _heightController = TextEditingController();
    _ageController = TextEditingController();
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    historyRepository = Provider.of<HistoryRepository>(context);

    void calculateCalories() {
      var weight = double.parse(_weightController.text);
      var height = double.parse(_heightController.text);
      var age = double.parse(_ageController.text);

      if (selectedGender == Gender.male) {
        tmb = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      } else {
        tmb = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      }

      switch (selectedActivityLevel) {
        case ActivityLevel.sedentary:
          tmb *= 1.2;
          break;
        case ActivityLevel.lightlyActive:
          tmb *= 1.375;
          break;
        case ActivityLevel.moderatelyActive:
          tmb *= 1.55;
          break;
        case ActivityLevel.veryActive:
          tmb *= 1.725;
          break;
        default:
          break;
      }

      switch (selectedGoal) {
        case Goal.lossWeight:
          tmb *= 0.8;
          break;
        case Goal.gainWeight:
          tmb *= 1.15;
          break;
        default:
          break;
      }

      DataUser dataUser = DataUser(
          weight: weight,
          height: int.parse(_heightController.text),
          age: int.parse(_ageController.text),
          gender: selectedGender!,
          activityLevel: selectedActivityLevel!,
          goal: selectedGoal!,
          caloriesDay: tmb);

      historyRepository.save(dataUser);

      setState(() {
        tmb = tmb;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(dataUser: dataUser),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Peso'),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _weightController,
                            decoration: const InputDecoration(
                              hintText: 'Peso (kg)',
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Altura'),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _heightController,
                            decoration: const InputDecoration(
                              hintText: 'Altura (cm)',
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Idade'),
                        SizedBox(
                          width: 200,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _ageController,
                            decoration: const InputDecoration(
                              hintText: 'Idade (anos)',
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Gênero'),
                          SizedBox(
                            width: 200,
                            child: DropdownButton<Gender>(
                              value: selectedGender,
                              hint: const Text('Gênero'),
                              items: Gender.values.map((Gender gender) {
                                return DropdownMenuItem<Gender>(
                                    value: gender,
                                    child: Text(gender.displayName));
                              }).toList(),
                              onChanged: (Gender? newGender) {
                                setState(() {
                                  selectedGender = newGender;
                                });
                              },
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Nível'),
                        SizedBox(
                          width: 200,
                          child: DropdownButton<ActivityLevel>(
                            value: selectedActivityLevel,
                            hint: const Text('Nível'),
                            items: ActivityLevel.values
                                .map((ActivityLevel activityLevel) {
                              return DropdownMenuItem<ActivityLevel>(
                                  value: activityLevel,
                                  child: Text(activityLevel.displayName));
                            }).toList(),
                            onChanged: (ActivityLevel? newActivityLevel) {
                              setState(() {
                                selectedActivityLevel = newActivityLevel;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Objetivo'),
                        SizedBox(
                          width: 200,
                          child: DropdownButton<Goal>(
                            value: selectedGoal,
                            hint: const Text('Objetivo'),
                            items: Goal.values.map((Goal goal) {
                              return DropdownMenuItem<Goal>(
                                  value: goal, child: Text(goal.displayName));
                            }).toList(),
                            onChanged: (Goal? newGoal) {
                              setState(() {
                                selectedGoal = newGoal;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      fixedSize: MaterialStateProperty.all(const Size(200, 50)),
                    ),
                    onPressed: calculateCalories,
                    child: const Text(
                      'Calcular',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

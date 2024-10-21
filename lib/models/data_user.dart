import 'package:challenge_3apps/enums/activity_level.dart';
import 'package:challenge_3apps/enums/gender.dart';
import 'package:challenge_3apps/enums/goal.dart';

class DataUser {
  double weight;
  int height;
  int age;
  Gender gender;
  ActivityLevel activityLevel;
  Goal goal;
  double caloriesDay;

  DataUser(
      {required this.weight,
      required this.height,
      required this.age,
      required this.gender,
      required this.activityLevel,
      required this.goal,
      required this.caloriesDay});
}

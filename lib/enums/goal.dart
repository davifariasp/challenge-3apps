enum Goal{
  lossWeight,
  gainWeight,
}

extension GoalExtension on Goal {
  String get displayName {
    switch (this) {
      case Goal.lossWeight:
        return 'Perder peso';
      case Goal.gainWeight:
        return 'Ganhar peso';
    }
  }
}
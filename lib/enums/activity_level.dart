enum ActivityLevel { sedentary, lightlyActive, moderatelyActive, veryActive }

extension ActivityLevelExtension on ActivityLevel {
  String get displayName {
    switch (this) {
      case ActivityLevel.sedentary:
        return 'Sedentário';
      case ActivityLevel.lightlyActive:
        return 'Levemente ativo';
      case ActivityLevel.moderatelyActive:
        return 'Moderadamente ativo';
      case ActivityLevel.veryActive:
        return 'Muito ativo';
      default:
        return '';
    }
  }
}

enum Gender { male, female }

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Masculino';
      case Gender.female:
        return 'Feminino';
      default:
        return '';
    }
  }
}

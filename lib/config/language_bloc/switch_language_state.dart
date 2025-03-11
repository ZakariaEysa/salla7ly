part of 'switch_language_bloc.dart';

class SwitchLanguageState extends Equatable {
  final bool switchLanguageValue;
  const SwitchLanguageState(
    this.switchLanguageValue,
  );

  @override
  List<Object> get props => [
        switchLanguageValue,
      ];
}

final class SwitchLanguageInitial extends SwitchLanguageState {
  const SwitchLanguageInitial(
    super.switchLanguageValue,
  );
}

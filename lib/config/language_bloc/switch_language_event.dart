part of 'switch_language_bloc.dart';

abstract class SwitchLanguageEvent extends Equatable {
  const SwitchLanguageEvent();

  @override
  List<Object> get props => [];
}

class EnglishLanguageEvent extends SwitchLanguageEvent {}

class ArabicLanguageEvent extends SwitchLanguageEvent {}

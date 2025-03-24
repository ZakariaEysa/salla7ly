import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/hive_keys.dart';
import '../../data/hive_storage.dart';

part 'switch_language_event.dart';
part 'switch_language_state.dart';

class SwitchLanguageCubit
    extends Bloc<SwitchLanguageEvent, SwitchLanguageState> {
  SwitchLanguageCubit() : super(const SwitchLanguageInitial(false)) {
    on<ArabicLanguageEvent>((event, emit) {
      HiveStorage.set(HiveKeys.isArabic, true);
      emit(const SwitchLanguageInitial(true));
    });
    on<EnglishLanguageEvent>((event, emit) {
      HiveStorage.set(HiveKeys.isArabic, false);
      emit(const SwitchLanguageInitial(false));
    });
  }
}

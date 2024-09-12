import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_page_state.dart';
part 'initial_page_logic.freezed.dart';

class InitialPageLogic extends Cubit<InitialPageState>{
  final bool isDarkMode;

   InitialPageLogic({required this.isDarkMode})
      : super(InitialPageState.loaded(isDarkMode: isDarkMode));

}
import 'package:flutter_bloc/flutter_bloc.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<List<bool>> {
  CheckboxCubit()
      : super(
            List.generate(6, (index) => false)); // 6 checkboxes, all unchecked

  void toggleCheckbox(int index, bool value) {
    final updatedState = List<bool>.from(state);
    updatedState[index] = value;
    emit(updatedState);
  }
}

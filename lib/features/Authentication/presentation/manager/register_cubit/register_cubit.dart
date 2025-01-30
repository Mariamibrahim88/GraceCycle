import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/features/Authentication/data/repo/register_repo.dart';
import 'package:grace_cycle/features/Authentication/presentation/manager/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());

  final RegisterRepo registerRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formTwoKey = GlobalKey<FormState>();

  final List<String> checkboxLabels = [
    'Heart_Disease',
    'Diabetes',
    'High_Blood_Pressure',
    'Obesity',
    'Hyperglycemia',
    'Kidney_Disease',
  ];

  List<bool> conditions = List.generate(6, (index) => false);
  List<String> selectedConditions = [];

  void toggleCheckbox(int index, bool value) {
    //final updatedState = List<bool>.from(conditions);
    conditions[index] = value;
    _updateSelectedConditions();
    emit(RegisterCheckboxState(List.from(conditions)));
  }

  void _updateSelectedConditions() {
    selectedConditions = [];
    for (int i = 0; i < conditions.length; i++) {
      if (conditions[i]) {
        selectedConditions.add(checkboxLabels[i]);
      }
    }
    //print(selectedConditions);
  }

  Future<void> register() async {
    emit(RegisterLoadingState());
    final response = await registerRepo.register(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        address: addressController.text,
        conditions: selectedConditions,
        phonenumber: phonenumberController.text);

    response.fold(
        (l) => emit(RegisterErrorState(l)), (r) => emit(RegisterSucessState()));
  }
}

part of 'checkbox_cubit.dart';

@immutable
sealed class CheckboxState {}

final class CheckboxInitial extends CheckboxState {}

final class CheckboxChecked extends CheckboxState {}

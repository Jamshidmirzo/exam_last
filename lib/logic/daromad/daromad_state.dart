// ignore_for_file: must_be_immutable

part of 'daromad_bloc.dart';

@immutable
sealed class DaromadState {}

final class DaromadInitial extends DaromadState {}

final class DaromadAddedState extends DaromadState {}

final class DaromadLoadingState extends DaromadState {}

final class DaromadDeleteState extends DaromadState {}

final class DaromadEditedState extends DaromadState {}



final class DaromadErrorState extends DaromadState {
  String message;
  DaromadErrorState({required this.message});
}

final class DaromadLoadedState extends DaromadState {
  List<Payment> payments;
  DaromadLoadedState({required this.payments});
}

final class DaromadCategoriesState extends DaromadState {
  List categories;
  DaromadCategoriesState({required this.categories});
}


final class DaromadByCategoriesState extends DaromadState {
  List<Payment> categories;
  DaromadByCategoriesState({required this.categories});
}
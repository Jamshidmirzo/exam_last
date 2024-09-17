// ignore_for_file: must_be_immutable

part of 'payment_bloc.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentAddedState extends PaymentState {}

final class PaymentLoadingState extends PaymentState {}

final class PaymentDeleteState extends PaymentState {}

final class PaymentEditedState extends PaymentState {}



final class PaymentErrorState extends PaymentState {
  String message;
  PaymentErrorState({required this.message});
}

final class PaymentLoadedState extends PaymentState {
  List<Payment> payments;
  PaymentLoadedState({required this.payments});
}

final class PaymentCategoriesState extends PaymentState {
  List categories;
  PaymentCategoriesState({required this.categories});
}


final class PaymentByCategoriesState extends PaymentState {
  List<Payment> categories;
  PaymentByCategoriesState({required this.categories});
}
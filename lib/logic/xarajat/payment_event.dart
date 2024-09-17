// ignore_for_file: must_be_immutable

part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class PaymentAddEvent extends PaymentEvent {
  Payment payment;
  PaymentAddEvent({required this.payment});
}

class PaymentEditEvent extends PaymentEvent {
  int id;
  Payment payment;
  PaymentEditEvent({required this.payment, required this.id});
}

class PaymentGetEvent extends PaymentEvent {}

class PaymentGetByCategoreisEvent extends PaymentEvent {
  String category;
  PaymentGetByCategoreisEvent({required this.category});
}

class PaymentGetCategoriesEvent extends PaymentEvent {}

class PaymentDeleteEvent extends PaymentEvent {
  int id;
  PaymentDeleteEvent({required this.id});
}

// ignore_for_file: must_be_immutable

part of 'daromad_bloc.dart';

@immutable
sealed class DaromadEvent {}

@immutable
sealed class PaymentEvent {}

class DaromadAddEvent extends DaromadEvent {
  Payment payment;
  DaromadAddEvent({required this.payment});
}

class PaymentEditEvent extends DaromadEvent {
  int id;
  Payment payment;
  PaymentEditEvent({required this.payment, required this.id});
}

class DaromadGetEvent extends DaromadEvent {}

class DaromadEditEvent extends DaromadEvent {
  int id;
  Payment payment;
  DaromadEditEvent({required this.payment, required this.id});
}

class DaromadGetByCategoreisEvent extends DaromadEvent {
  String category;
  DaromadGetByCategoreisEvent({required this.category});
}

class DaromadGetCategoriesEvent extends DaromadEvent {}

class DaromadDeleteEvent extends DaromadEvent {
  int id;
  DaromadDeleteEvent({required this.id});
}

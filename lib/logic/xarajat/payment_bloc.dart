import 'package:bloc/bloc.dart';
import 'package:exam_last/data/models/payment.dart';
import 'package:exam_last/data/repositories/payment_repositories.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentRepositories paymentRepositories = PaymentRepositories();
  PaymentBloc() : super(PaymentInitial()) {
    on<PaymentEvent>(
      (event, emit) {},
    );
    on<PaymentAddEvent>(
      _addPayment,
    );
    on<PaymentGetEvent>(
      _getPayment,
    );
    on<PaymentDeleteEvent>(
      _deletePayment,
    );
    on<PaymentEditEvent>(
      _editPayment,
    );
    on<PaymentGetCategoriesEvent>(
      _caegoryPayment,
    );
    on<PaymentGetByCategoreisEvent>(
      _byCaegoryPayment,
    );
  }

  _byCaegoryPayment(PaymentGetByCategoreisEvent event, emit) async {
    emit(
      PaymentLoadingState(),
    );
    try {
      final responce =
          await paymentRepositories.getByCategoriesPayments(event.category);
      if (responce != null) {
        emit(
          PaymentByCategoriesState(categories: responce),
        );
      } else {
        emit(PaymentCategoriesState(categories: const []));
      }
    } catch (e) {
      emit(
        PaymentErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _caegoryPayment(PaymentGetCategoriesEvent event, emit) async {
    emit(
      PaymentLoadingState(),
    );
    try {
      final responce = await paymentRepositories.getCategoriesPayments();
      if (responce != null) {
        emit(PaymentCategoriesState(categories: responce));
      } else {
        emit(PaymentCategoriesState(categories: const []));
      }
    } catch (e) {
      emit(
        PaymentErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _editPayment(PaymentEditEvent event, emit) async {
    emit(
      PaymentLoadingState(),
    );
    try {
      await paymentRepositories.editPayments(event.payment, event.id);
      emit(PaymentEditedState());
    } catch (e) {
      emit(
        PaymentErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _deletePayment(PaymentDeleteEvent event, emit) async {
    emit(
      PaymentLoadingState(),
    );
    try {
      await paymentRepositories.deletePayments(event.id);
      emit(PaymentDeleteState());
    } catch (e) {
      emit(
        PaymentErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _getPayment(PaymentGetEvent event, emit) async {
    emit(
      PaymentLoadingState(),
    );
    try {
      final responce = await paymentRepositories.getPayments();
      emit(
        PaymentLoadedState(
          payments: responce,
        ),
      );
    } catch (e) {
      emit(
        PaymentErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _addPayment(PaymentAddEvent event, emit) {
    emit(
      PaymentLoadingState(),
    );
    try {
      paymentRepositories.addPayments(event.payment);
      emit(
        PaymentAddedState(),
      );
    } catch (e) {
      emit(
        PaymentErrorState(
          message: e.toString(),
        ),
      );
    }
  }


}

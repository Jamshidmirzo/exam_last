import 'package:bloc/bloc.dart';
import 'package:exam_last/data/models/payment.dart';
import 'package:exam_last/data/repositories/payment_repositories.dart';
import 'package:meta/meta.dart';

part 'daromad_event.dart';
part 'daromad_state.dart';

class DaromadBloc extends Bloc<DaromadEvent, DaromadState> {
  PaymentRepositories paymentRepositories = PaymentRepositories();

  DaromadBloc() : super(DaromadInitial()) {
    on<DaromadEvent>(
      (event, emit) {},
    );
    on<DaromadAddEvent>(
      _addPayment,
    );
    on<DaromadGetEvent>(
      _getPayment,
    );
    on<DaromadDeleteEvent>(
      _deletePayment,
    );
    on<DaromadEditEvent>(
      _editPayment,
    );
    on<DaromadGetCategoriesEvent>(
      _caegoryPayment,
    );
    on<DaromadGetByCategoreisEvent>(
      _byCaegoryPayment,
    );
  }

  _byCaegoryPayment(DaromadGetByCategoreisEvent event, emit) async {
    emit(
      DaromadLoadingState(),
    );
    try {
      final responce =
          await paymentRepositories.getByCategoriesPayments(event.category);
      if (responce != null) {
        emit(
          DaromadByCategoriesState(categories: responce),
        );
      } else {
        emit(DaromadCategoriesState(categories: const []));
      }
    } catch (e) {
      emit(
        DaromadErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _caegoryPayment(DaromadGetCategoriesEvent event, emit) async {
    emit(
      DaromadLoadingState(),
    );
    try {
      final responce = await paymentRepositories.getCategoriesPayments();
      if (responce != null) {
        emit(DaromadCategoriesState(categories: responce));
      } else {
        emit(DaromadCategoriesState(categories: const []));
      }
    } catch (e) {
      emit(
        DaromadErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _editPayment(DaromadEditEvent event, emit) async {
    emit(
      DaromadLoadingState(),
    );
    try {
      await paymentRepositories.editPayments(event.payment, event.id);
      emit(DaromadEditedState());
    } catch (e) {
      emit(
        DaromadErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _deletePayment(DaromadDeleteEvent event, emit) async {
    emit(
      DaromadLoadingState(),
    );
    try {
      await paymentRepositories.deletePayments(event.id);
      emit(DaromadDeleteState());
    } catch (e) {
      emit(
        DaromadErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _getPayment(DaromadGetEvent event, emit) async {
    emit(
      DaromadLoadingState(),
    );
    try {
      final responce = await paymentRepositories.getPayments();
      emit(
        DaromadLoadedState(
          payments: responce,
        ),
      );
    } catch (e) {
      emit(
        DaromadErrorState(
          message: e.toString(),
        ),
      );
    }
  }

  _addPayment(DaromadAddEvent event, emit) {
    emit(
      DaromadLoadingState(),
    );
    try {
      paymentRepositories.addPayments(event.payment);
      emit(
        DaromadAddedState(),
      );
    } catch (e) {
      emit(
        DaromadErrorState(
          message: e.toString(),
        ),
      );
    }
  }
}

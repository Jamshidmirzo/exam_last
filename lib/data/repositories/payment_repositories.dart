import 'package:exam_last/data/models/payment.dart';
import 'package:exam_last/data/services/payment_service.dart';

class PaymentRepositories {
  SqlDb sqlDb = SqlDb();

  Future<List<Payment>> getPayments() async {
    try {
      final responce = await sqlDb.readData();
      List<Payment> payments = [];
      for (var element in responce) {
        payments.add(
          Payment.fromMap(element),
        );
      }
      if (payments.isNotEmpty) {
        return payments;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addPayments(Payment payment) {
    try {
      return sqlDb.insertData(payment);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePayments(int id) {
    try {
      return sqlDb.deleteData(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editPayments(Payment payment, int id) {
    try {
      return sqlDb.updateData(id, payment);
    } catch (e) {
      rethrow;
    }
  }

  Future<List?> getCategoriesPayments() async {
    try {
      final responce = await sqlDb.readData();
      List categories = [];
      for (var element in responce) {
        categories.add(element['category']);
      }
      if (categories.isNotEmpty) {
        return categories;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Payment>?> getByCategoriesPayments(String category) async {
    try {
      final responce = await sqlDb.readData();
      List<Payment> categories = [];
      List<Payment> payments = [];

      for (var element in responce) {
        payments.add(Payment.fromMap(element));
      }
      for (var element in payments) {
        if (category == element.category) {
          categories.add(element);
        }
      }
      if (categories.isNotEmpty) {
        return categories;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}

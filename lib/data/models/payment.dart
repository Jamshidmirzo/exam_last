// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Payment {
  int id;
  int amount;
  String category;
  DateTime date;
  String commnet;
  Payment({
    required this.id,
    required this.amount,
    required this.category,
    required this.date,
    required this.commnet,
  });

  Payment copyWith({
    int? id,
    int? amount,
    String? category,
    DateTime? date,
    String? commnet,
  }) {
    return Payment(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      commnet: commnet ?? this.commnet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'amount': amount,
      'category': category,
      'date': date.millisecondsSinceEpoch,
      'commnet': commnet,
    };
  }

  factory Payment.fromMap(Map<dynamic, dynamic> map) {
    return Payment(
      id: map['id'] as int,
      amount: map['amount'] as int,
      category: map['category'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(int.parse(map['date'])),
      commnet: map['commnet'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Payment(id: $id, amount: $amount, category: $category, date: $date, commnet: $commnet)';
  }

  @override
  bool operator ==(covariant Payment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.amount == amount &&
        other.category == category &&
        other.date == date &&
        other.commnet == commnet;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        category.hashCode ^
        date.hashCode ^
        commnet.hashCode;
  }
}

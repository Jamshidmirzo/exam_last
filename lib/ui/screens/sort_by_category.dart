import 'package:exam_last/logic/xarajat/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortByCategory extends StatelessWidget {
  const SortByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<PaymentBloc>().add(PaymentGetCategoriesEvent());
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Sort by Categories"),
      ),
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          if (state is PaymentByCategoriesState) {
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final payments = state.categories[index];
                return ListTile(
                  subtitle: Text(
                      '${payments.date.day}.${payments.date.month}.${payments.date.year}'),
                  title: Text(
                    payments.commnet,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: const Icon(
                      Icons.monetization_on,
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

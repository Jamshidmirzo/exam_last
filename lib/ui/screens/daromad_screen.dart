import 'dart:math';

import 'package:exam_last/data/models/payment.dart';
import 'package:exam_last/logic/daromad/daromad_bloc.dart';
import 'package:exam_last/logic/xarajat/payment_bloc.dart';
import 'package:exam_last/ui/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  final summaController = TextEditingController();
  final categoryController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<DaromadBloc>().add(
            DaromadAddEvent(
              payment: Payment(
                  id: Random().nextInt(1234),
                  amount: int.parse(summaController.text),
                  category: categoryController.text,
                  date: DateTime.now(),
                  commnet: descController.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Payment"),
      ),
      body: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          if (state is PaymentErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Error"),
                  content: Text(state.message),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    )
                  ],
                );
              },
            );
          }

          if (state is PaymentAddedState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Done"),
                  content: const Text('Muvaqiyatli qo`shildi ✅✅'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("OK"),
                    )
                  ],
                );
              },
            );
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                InputWidget(
                  controler: descController,
                  title: 'Desciption',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Input a description';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  controler: summaController,
                  title: 'Summa',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Input a sum';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Input correct sum';
                    }
                    return null;
                  },
                ),
                InputWidget(
                  controler: categoryController,
                  title: 'Category',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Input a category';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () => submit(context),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

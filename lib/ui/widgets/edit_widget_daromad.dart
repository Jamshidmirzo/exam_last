import 'package:exam_last/data/models/payment.dart';
import 'package:exam_last/logic/daromad/daromad_bloc.dart';
import 'package:exam_last/ui/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class EditWidgetDaromad extends StatefulWidget {
  Payment payment;
  EditWidgetDaromad({super.key, required this.payment});

  @override
  State<EditWidgetDaromad> createState() => _EditWidgetDaromadState();
}

class _EditWidgetDaromadState extends State<EditWidgetDaromad> {
  @override
  void initState() {
    super.initState();
    summaController.text = widget.payment.amount.toString();
    categoryController.text = widget.payment.category;
    dateController.text = widget.payment.date.toString();
    descController.text = widget.payment.commnet;
    id = widget.payment.id;
  }

  final _formKey = GlobalKey<FormState>();

  final summaController = TextEditingController();

  final categoryController = TextEditingController();

  final dateController = TextEditingController();

  final descController = TextEditingController();

  int id = 0;

  submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<DaromadBloc>().add(
            DaromadEditEvent(
                payment: Payment(
                    id: id,
                    amount: int.parse(summaController.text),
                    category: categoryController.text,
                    date: DateTime.now(),
                    commnet: descController.text),
                id: id),
          );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        ElevatedButton(
          onPressed: () => submit(context),
          child: const Text(
            'Add',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
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
                        return null;
                      },
                    ),
                    InputWidget(
                      controler: dateController,
                      title: 'Date',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Input a date';
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

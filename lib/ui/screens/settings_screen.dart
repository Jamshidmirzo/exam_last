import 'package:exam_last/data/models/payment.dart';
import 'package:exam_last/logic/daromad/daromad_bloc.dart';
import 'package:exam_last/ui/widgets/edit_widget.dart';
import 'package:exam_last/ui/widgets/edit_widget_daromad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  editPayments(Payment payment) {
    showDialog(
      context: context,
      builder: (context) {
        return EditWidgetDaromad(
          payment: payment,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings Payment"),
        ),
        body: BlocBuilder<DaromadBloc, DaromadState>(
          builder: (context, state) {
            if (state is DaromadErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is DaromadLoadedState) {
              return ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: state.payments.length,
                itemBuilder: (context, index) {
                  final payments = state.payments[index];
                  return ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            context
                                .read<DaromadBloc>()
                                .add(DaromadDeleteEvent(id: payments.id));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () => editPayments(payments),
                          icon: const Icon(
                            Icons.edit,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                        '${payments.date.day}.${payments.date.month}.${payments.date.year} ${payments.date.hour}: ${payments.date.minute}'),
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
        ));
  }
}

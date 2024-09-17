import 'package:exam_last/logic/xarajat/payment_bloc.dart';
import 'package:exam_last/ui/screens/sort_by_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

class _SavingsScreenState extends State<SavingsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentBloc>().add(PaymentGetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Payment"),
      ),
      body: Column(
        children: [
          BlocBuilder<PaymentBloc, PaymentState>(
            builder: (context, state) {
              if (state is PaymentErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is PaymentErrorState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PaymentCategoriesState) {
                return SizedBox(
                  height: 50,
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.read<PaymentBloc>().add(
                                PaymentGetByCategoreisEvent(
                                    category: state.categories[index]),
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SortByCategory();
                              },
                            ),
                          );
                        },
                        child: Container(
                          width: 100,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300),
                          child: Text(
                            state.categories[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

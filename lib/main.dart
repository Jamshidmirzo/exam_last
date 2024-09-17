import 'package:exam_last/logic/daromad/daromad_bloc.dart';
import 'package:exam_last/logic/xarajat/payment_bloc.dart';
import 'package:exam_last/ui/screens/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PaymentBloc()),
        BlocProvider(create: (context) => DaromadBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}

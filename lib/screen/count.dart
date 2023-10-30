import 'package:api_test/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icon.dart';

import '../bloc/count_cubit.dart';
import '../bloc/count_states.dart';


class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    CountCubit cubit = CountCubit.get(context);
    HomeCubit homeCubit = HomeCubit.get(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CountCubit,CountStates>(
                 listener: (context, state) {
                 },
                 builder: (context, state) {
                   return Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ElevatedButton(
                         onPressed: (){
                           cubit.inc() ;
                         }, child: Text("+")
                     ),
                     SizedBox(
                       width: 30,
                     ),
                     Text("${cubit.count}"),
                     SizedBox(
                       width: 30,
                     ),
                     ElevatedButton(
                         onPressed: (){
                           cubit.dec() ;
                         }, child: Text("-")
                     ),
                   ],
                   );
                 },
              ),
              SizedBox(
                height: 20,
              ),
              BlocConsumer<HomeCubit,HomeState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            homeCubit.printHi();
                          }, child: Text("Print Hi")
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text("${homeCubit.text}"),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: (){
                            homeCubit.printFlutter();
                          }, child: Text("Print Flutter ")
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

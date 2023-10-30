import 'package:api_test/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit , HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
         appBar: AppBar(
           elevation: 0,
           scrolledUnderElevation: 0,
           title: Text("News" , style: GoogleFonts.abel(
             fontSize: 30 ,
             color: Theme.of(context).colorScheme.primary,
             fontWeight: FontWeight.bold
           ),
           ),
         ),
          body: homeCubit.myScreen[homeCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: homeCubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap:(index){
              homeCubit.changeNavBar(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.business_sharp) , label: "Business"),
              BottomNavigationBarItem(icon: Icon(Icons.science_rounded) , label: "Science"),
              BottomNavigationBarItem(icon: Icon(Icons.rocket_launch) , label: "Technology"),
              BottomNavigationBarItem(icon: Icon(Icons.settings) , label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}

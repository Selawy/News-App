import 'package:api_test/component/my_component.dart';
import 'package:api_test/cubit/home_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Business extends StatelessWidget {
  const Business({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getBusinessNews();
    return BlocConsumer<HomeCubit , HomeState>(
      listener: (context, state) {
      },
      builder:(context, state) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               ConditionalBuilder(
                   condition: state is ! HomeGetBusinessDataLoading,
                   builder: (context) => ListView.separated(
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (context, index) => MyComponent.buildNews(context , homeCubit.models!.articles![index]),
                       separatorBuilder: (context, index) => SizedBox(height: 20,),
                       itemCount: homeCubit.models!.articles!.length ,
                   ),
                   fallback: (context) => Center(child: LinearProgressIndicator(),),
               )
            ],
          ),
        );
      },
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/my_component.dart';
import '../cubit/home_cubit.dart';

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getScienceNews();
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
                condition: homeCubit.scienceNews!=null,
                builder: (context) => ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => MyComponent.buildNews(context , homeCubit.scienceNews!.articles![index]),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: homeCubit.scienceNews!.articles!.length ,
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

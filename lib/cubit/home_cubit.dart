import 'package:api_test/constant/my_url.dart';
import 'package:api_test/http/http_helper.dart';
import 'package:api_test/models/news_models.dart';
import 'package:api_test/screen/settings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../screen/business.dart';
import '../screen/science.dart';
import '../screen/technology.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);

  bool isDark = false ;
  int currentIndex = 0 ;
  String text = "";
  NewsModels ?  models ;
  void changeTheme(){
    isDark = !isDark ;
    emit(HomeChangeThemeState());
  }
  void printHi(){
    text = "Hi";
    emit(HomePrintHiState());
  }
  void printFlutter(){
    text = "Flutter";
    emit(HomePrintFlutterState());
  }
  void changeNavBar(int index){
    currentIndex = index ;
    // switch (index){
    //   case 0 :
    //     print("0");
    //     break ;
    //   case 1 :
    //     print("1");
    //     break ;
    //   case 2 :
    //     print("2");
    //     break ;
    //   case 3 :
    //     print("3");
    //     break ;
    // }
    emit(HomeChangeNavBar());
  }
  List<Widget> myScreen =[
    Business(),
    Science(),
    Technology(),
    Settings(),
  ];


  void getBusinessNews()async{
    emit(HomeGetBusinessDataLoading());
    await HttpHelper().getDataFromApi(LINK: BusinessURL)
        .then((value){
          models = NewsModels.fromJson(value);
          emit(HomeGetBusinessDataSuss());
    }).catchError((onError){
      print(onError.toString());
      emit(HomeGetBusinessDataError());
    });
  }
  NewsModels ? scienceNews;
  void getScienceNews()async{
    emit(HomeGetScienceDataLoading());
    await HttpHelper().getDataFromApi(LINK: ScienceURL)
        .then((value){
          scienceNews = NewsModels.fromJson(value);
          emit(HomeGetScienceDataSuss());
    }).catchError((onError){
      print(onError.toString());
      emit(HomeGetScienceDataError());
    });
  }
  NewsModels ? technologyNews;
  void getTechnologyNews()async{
    emit(HomeGetTechDataLoading());
    await HttpHelper().getDataFromApi(LINK: TechnologyURL)
        .then((value){
      technologyNews = NewsModels.fromJson(value);
      emit(HomeGetTechDataSuss());
    }).catchError((onError){
      print(onError.toString());
      emit(HomeGetTechDataError());
    });
  }
}
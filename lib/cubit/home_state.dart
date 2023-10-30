part of 'home_cubit.dart';

@immutable
abstract class HomeState {}


class HomeInitial extends HomeState {}
class HomeChangeNavBar extends HomeState {}
class HomePrintHiState extends HomeState {}
class HomePrintFlutterState extends HomeState {}

class HomeChangeThemeState extends HomeState{}

class HomeGetBusinessDataLoading extends HomeState {}
class HomeGetBusinessDataSuss extends HomeState {}
class HomeGetBusinessDataError extends HomeState {}


class HomeGetScienceDataLoading extends HomeState {}
class HomeGetScienceDataSuss extends HomeState {}
class HomeGetScienceDataError extends HomeState {}


class HomeGetTechDataLoading extends HomeState {}
class HomeGetTechDataSuss extends HomeState {}
class HomeGetTechDataError extends HomeState {}



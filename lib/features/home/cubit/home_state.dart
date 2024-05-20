part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {}

final class HomeFailure extends HomeState {}

final class LoadingMoreTasks extends HomeState {}

final class LoadingMoreTasksSucess extends HomeState {}

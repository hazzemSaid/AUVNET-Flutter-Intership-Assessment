import 'package:ecommerce/features/home/domain/entities/restaurants.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Restaurants> products;

  const HomeLoaded(this.products);

  @override
  List<Object?> get props => [products];

  HomeLoaded copyWith({List<Restaurants>? products}) {
    return HomeLoaded(products ?? this.products);
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];

  HomeError copyWith({String? message}) {
    return HomeError(message ?? this.message);
  }
}

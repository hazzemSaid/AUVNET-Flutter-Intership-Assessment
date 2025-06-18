import 'package:ecommerce/features/home/domain/entities/services.dart';
import 'package:equatable/equatable.dart';

abstract class ServicesState extends Equatable {
  const ServicesState();

  @override
  List<Object?> get props => [];
}

class ServicesInitial extends ServicesState {}

class ServicesLoading extends ServicesState {}

class ServicesLoaded extends ServicesState {
  final List<Services> services;

  const ServicesLoaded(this.services);

  @override
  List<Object?> get props => [services];

  ServicesLoaded copyWith({List<Services>? services}) {
    return ServicesLoaded(services ?? this.services);
  }
}

class ServicesError extends ServicesState {
  final String message;

  const ServicesError(this.message);

  @override
  List<Object?> get props => [message];

  ServicesError copyWith({String? message}) {
    return ServicesError(message ?? this.message);
  }
}

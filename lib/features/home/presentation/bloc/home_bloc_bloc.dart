import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/usecases/get_restaurants.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc_event.dart';
import 'package:ecommerce/features/home/presentation/bloc/home_bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Getrestaurants getProducts;

  HomeBloc(this.getProducts) : super(HomeInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(HomeLoading());
      try {
        final restaurants = await getProducts();
        emit(HomeLoaded(restaurants));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}

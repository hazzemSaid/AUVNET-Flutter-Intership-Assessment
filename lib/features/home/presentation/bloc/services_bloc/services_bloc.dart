import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/home/domain/entities/services.dart';
import 'package:ecommerce/features/home/domain/usecases/get_services.dart';
import 'package:meta/meta.dart';

part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final GetServices getServices;
  ServicesBloc(this.getServices) : super(ServicesInitial()) {
    on<ServicesLoad>(_onServicesLoad);
  }

  Future<void> _onServicesLoad(
    ServicesLoad event,
    Emitter<ServicesState> emit,
  ) async {
    emit(ServicesLoading());
    try {
      final services = await getServices();
      emit(ServicesLoaded(services));
    } catch (e) {
      emit(ServicesError(e.toString()));
    }
  }
}

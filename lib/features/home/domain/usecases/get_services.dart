import 'package:ecommerce/features/home/domain/entities/services.dart';
import 'package:ecommerce/features/home/domain/repositories/home_repository.dart';

class GetServices {
  final HomeRepository repository;
  GetServices(this.repository);
  Future<List<Services>> call() => repository.getservices();
}

import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';

class BarberShopState extends Equatable {
  const BarberShopState();

  @override
  List<Object> get props => [];
}

class BarbershopLoading extends BarberShopState {}

class BarbershopLoadSuccess extends BarberShopState {
  final List<BarberShop> barberShop;

  BarbershopLoadSuccess([this.barberShop = const []]);

  @override
  List<Object> get props => [barberShop];
}

class CourseOperationFailure extends BarberShopState {}

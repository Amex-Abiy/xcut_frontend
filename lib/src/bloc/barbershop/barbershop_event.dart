import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';

abstract class BarberShopEvent extends Equatable {
  const BarberShopEvent();
}

class BarberShopLoad extends BarberShopEvent {
  const BarberShopLoad();

  @override
  List<Object> get props => [];
}

class BarberShopCreate extends BarberShopEvent {
  final BarberShop barberShop;

  const BarberShopCreate(this.barberShop);

  @override
  List<Object> get props => [barberShop];

  @override
  String toString() => 'BarberShop Created {BarberShop: $barberShop}';
}

class BarberShopUpdate extends BarberShopEvent {
  final BarberShop barberShop;

  const BarberShopUpdate(this.barberShop);

  @override
  List<Object> get props => [barberShop];

  @override
  String toString() => 'BarberShop Updated {BarberShop: $barberShop}';
}

class BarberShopDelete extends BarberShopEvent {
  final BarberShop barberShop;

  const BarberShopDelete(this.barberShop);

  @override
  List<Object> get props => [barberShop];

  @override
  toString() => 'BarberShop Deleted {BarberShop: $barberShop}';
}

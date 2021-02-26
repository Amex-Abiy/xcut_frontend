import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class BarberShopDataProvider {
   final _baseUrlBarberShop = 'https://192.168.1.1/api/barbershop';
   final http.Client httpClient;

  BarberShopDataProvider({@required this.httpClient}) : assert(httpClient != null);

  Future<List<BarberShop>> getAllBarberShops() async {
    final response = await httpClient.get(
      Uri.http(_baseUrlBarberShop, '/getAllBarberShops')
    );
    if (json.decode(response.body).status == true) {
      List<BarberShop> barberShops = [];
      json.decode(response.body).data.forEach((BarberShop barbershop, index) => {
        barberShops.add(BarberShop.fromJSON(json.decode(response.body).data))
      });
      return barberShops;
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<BarberShop>> searchBarberShop(searchValue) async {
    final response = await httpClient.get(
      Uri.http(_baseUrlBarberShop, '/searchBarberShop/$searchValue')
    );
    if (json.decode(response.body).status == true) {
      List<BarberShop> barberShops = [];
      json.decode(response.body).data.forEach((BarberShop barbershop, index) => {
        barberShops.add(BarberShop.fromJSON(json.decode(response.body).data))
      });
      return barberShops;
    } else {
      throw Exception('Failed to create course.');
    }
  }
}
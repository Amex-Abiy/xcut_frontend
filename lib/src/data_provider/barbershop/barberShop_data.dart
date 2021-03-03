import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class BarberShopDataProvider {
  final _baseUrlBarberShop = 'http://192.168.1.101:5000/api/barberShop';
  final _baseUrlUser = 'http://192.168.1.101:5000/api/user';
  final http.Client httpClient;

  BarberShopDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<List<BarberShop>> getAllBarberShops() async {
    final response =
        await httpClient.get('$_baseUrlBarberShop/getAllBarberShops');
    final body = json.decode(response.body);
    print(body['status']);
    if (body['status']) {
      return body['data']
          .map<BarberShop>((e) => BarberShop.fromJSON(e))
          .toList();
    } else {
      throw Exception('Failed to fetch.');
    }
  }

  Future<List<BarberShop>> searchBarberShop(searchValue) async {
    final response = await httpClient
        .get('$_baseUrlBarberShop/searchBarberShop/$searchValue');

    final body = json.decode(response.body);
    if (body['status']) {
      return body['data']
          .map<BarberShop>((e) => BarberShop.fromJSON(e))
          .toList();
    } else {
      throw Exception('Failed to fetch.');
    }
  }

  Future<List<BarberShop>> getAppointments() async {
    final response = await httpClient.post(
      '$_baseUrlUser/getAppointments',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    final body = json.decode(response.body);
    if (body['status']) {
      return body['data'].map<BarberShop>((e) => BarberShop.fromJSON(e))
          .toList();
    } else {
      throw Exception('Failed to create course.');
    }
  }
}

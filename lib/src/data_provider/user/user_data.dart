import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/models/user.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class UserDataProvider {
  final _baseUrlAuth = 'http://192.168.56.1:5000/api/auth';
  final _baseUrlUser = 'http://192.168.56.1:5000/api/user';
  final http.Client httpClient;
  
  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);
  
  createUser(User user) async {
    final response = await httpClient.post(
      Uri.http(_baseUrlAuth, '/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
      }),
    );

    if (json.decode(response.body).status == true) {
      TokenHandler.setToken(json.decode(response.body).jwt);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  loginUser(User user) async {
     final response = await httpClient.post(
      Uri.http(_baseUrlAuth, '/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
      }),
    );

    if (json.decode(response.body).status == true) {
      TokenHandler.setToken(json.decode(response.body).jwt);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  deleteProfile() async {
     final response = await httpClient.delete(
      Uri.http(_baseUrlUser, '/deleteProfile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    if (json.decode(response.body).status == true) {
      TokenHandler.removeToken();
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<User> getProfile() async {
     final response = await httpClient.get(
      Uri.http(_baseUrlUser, '/getProfile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    if (json.decode(response.body).status == true) {
      return User.fromJSON(jsonDecode(response.body).data);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  // reset password
  Future<User> updateProfile(String oldPassword, String password) async {
     final response = await httpClient.put(
      Uri.http(_baseUrlUser, '/getProfile'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
      body: jsonEncode(<String, dynamic>{
        'oldPassword': oldPassword,
        'password': password,
      })
    );

    if (json.decode(response.body).status == true) {
      return User.fromJSON(jsonDecode(response.body).data);
    } else {
      throw Exception('Failed to create course.');
    }
  }
  
  addFavorite(barberShopId) async {
    final response = await httpClient.post(
      Uri.http(_baseUrlUser, '/addFavorite/$barberShopId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    if (json.decode(response.body).status == true) {
      return User.fromJSON(json.decode(response.body).data);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  removeFavorite(barberShopId) async {
    final response = await httpClient.delete(
      Uri.http(_baseUrlUser, '/removeFavorite/$barberShopId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    if (json.decode(response.body).status == true) {
      return User.fromJSON(json.decode(response.body).data);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  setAppointment(barberShopId) async {
    final response = await httpClient.post(
      Uri.http(_baseUrlUser, '/setAppointment/$barberShopId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    if (json.decode(response.body).status == true) {
      return User.fromJSON(json.decode(response.body).data);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  deleteAppointment(barberShopId) async {
    final response = await httpClient.delete(
      Uri.http(_baseUrlUser, '/deleteAppointment/$barberShopId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    if (json.decode(response.body).status == true) {
      return User.fromJSON(json.decode(response.body).data);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<BarberShop>> addReview(barberShopId, String message, int rating) async {
    final response = await httpClient.post(
      Uri.http(_baseUrlUser, '/addReview/$barberShopId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
      body: jsonEncode(<String, dynamic>{
        'message': message,
        'rating': rating
      }),
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

  Future<List<BarberShop>> deleteReview(barberShopId) async {
    final response = await httpClient.post(
      Uri.http(_baseUrlUser, '/deleteReview/$barberShopId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
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
import 'dart:wasm';

class BarberShop {

  final String name;
  final String address;
  final String image;
  final Map<String, String> rating;
  final Map<String, String> review;
  final List<String> appointments;
  final Map<String, Float> location;
  final DateTime createdAt;

  BarberShop({
    this.name,
    this.address,
    this.image,
    this.rating,
    this.review,
    this.appointments,
    this.location,
    this.createdAt,
  });

  factory BarberShop.fromJSON(Map<String, dynamic> json) {
    return BarberShop(
      name: json['name'],
      address: json['address'],
      image: json['image'],
      rating: json['rating'],
      review: json['review'],
      appointments: json['appointments'],
      location: json['location'],
      createdAt: json['createdAt']
    );
  }
}
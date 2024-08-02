import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String model;
  final dynamic distance;
  final dynamic fuelCapacity;
  final dynamic pricePerHour;

  Car({
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Car(
      model: data['model'],
      distance: data['distance'],
      fuelCapacity: data['fuelCapacity'],
      pricePerHour: data['pricePerHour'],
    );
  }
}
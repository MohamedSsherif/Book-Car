import 'package:carrentalapp/data/models/Car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource{
  final FirebaseFirestore firestore;
  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> fetchCars() async {
    final cars = await firestore.collection('cars').get();
    return cars.docs.map((doc) => Car.fromDocument(doc)).toList();
  }
}
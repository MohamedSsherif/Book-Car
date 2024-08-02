import 'package:carrentalapp/data/models/Car.dart';
import 'package:carrentalapp/presentation/pages/map-details-page.dart';
import 'package:carrentalapp/presentation/widgets/car_card.dart';
import 'package:carrentalapp/presentation/widgets/more-card.dart';
import 'package:flutter/material.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key, required this.car});
  final Car car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
    ..addListener((){
      setState(() {});
    });
    _controller!.forward();
    super.initState();
    }
  
  @override
  void dispose(){
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.info_outline),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                ' Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarCard(
                car: Car(
                    model: widget.car.model,
                    distance: widget.car.distance,
                    fuelCapacity: widget.car.fuelCapacity,
                    pricePerHour: widget.car.pricePerHour)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 5)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(children: [
                      Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Mohamed Sherif',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text('\$4.253')
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MapsDetailsPage(car: widget.car);
                    }));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5)
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Transform.scale(
                        scale: _animation!.value,
                      child: Image.asset(
                        'assets/images/maps.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
                )
              ],
            ),
            MoreCard(
              car: Car(
                  model: "${widget.car.model}-1",
                  distance: widget.car.distance + 100,
                  fuelCapacity: widget.car.fuelCapacity + 100,
                  pricePerHour: widget.car.pricePerHour + 10),
            ),
            MoreCard(
                car: Car(
                    model: "${widget.car.model}-2",
                    distance: widget.car.distance + 200,
                    fuelCapacity: widget.car.fuelCapacity + 200,
                    pricePerHour: widget.car.pricePerHour + 20)),
            MoreCard(
                car: Car(
                    model: "${widget.car.model}-3",
                    distance: widget.car.distance + 300,
                    fuelCapacity: widget.car.fuelCapacity + 300,
                    pricePerHour: widget.car.pricePerHour + 30)),
          ],
        ),
      ),
    );
  }
}

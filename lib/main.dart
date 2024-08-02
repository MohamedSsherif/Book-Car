import 'package:carrentalapp/firebase_options.dart';
import 'package:carrentalapp/injection_container.dart';
import 'package:carrentalapp/presentation/bloc/car_bloc.dart';
import 'package:carrentalapp/presentation/bloc/car_event.dart';
import 'package:carrentalapp/presentation/pages/car_list_screen.dart';
import 'package:carrentalapp/presentation/pages/map-details-page.dart';
import 'package:carrentalapp/presentation/pages/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initInjection();
  runApp(const MyCar());
}

class MyCar extends StatelessWidget {
  const MyCar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CarBloc>()..add(LoadCars()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          CarListScreen.id: (context) => CarListScreen(),
        },
        home: const OnboardingPage(),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moja_lodowka/app/app.dart';
import 'package:moja_lodowka/app/injection_container.dart';
import 'firebase_options.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

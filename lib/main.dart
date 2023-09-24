import 'package:ecommerce_admin_firebase/view/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,

    routes: {
      '/':(p0) => HomeScreen(),
    },
  ));
}
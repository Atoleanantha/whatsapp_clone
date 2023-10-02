import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreens/landing_screen.dart';
import 'Screens/camera_screen.dart';
import 'Screens/login_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras=await availableCameras() ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "OpenSans",
            primaryColor: const Color(0xFF075E54),

            colorScheme: ColorScheme.fromSeed(seedColor:const Color(0xFF128C7E),secondary:const Color(0xFF128C7E))
        ),
        home: const LoginScreen());
        // home: const LandingScreen());
  }
}

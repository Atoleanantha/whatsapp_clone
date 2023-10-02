import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height-400,
                width: MediaQuery.of(context).size.width-50,
                child: Image.asset(
                  "assets/ChatImages/bg.png",
                  color: Colors.greenAccent[700],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      children: [
                        TextSpan(
                            text: "Agree and Continue to accept the ",
                            style: TextStyle(color: Colors.grey[600])),
                        const TextSpan(
                            text:
                                "WhatsApp terms of Service and Privacy Policy",
                            style: TextStyle(color: Colors.cyan))
                      ])),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (){
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>LoginScreen()), (route) => false);
              },
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 110,
                child: Card(
                  margin:const EdgeInsets.all(0),
                  elevation: 8,
                  color: Colors.greenAccent[700],
                  child: const Center(
                    child: Text(
                      "AGREE AND CONTINUE",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

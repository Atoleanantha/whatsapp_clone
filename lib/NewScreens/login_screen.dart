import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreens/counrty_page.dart';
import 'package:whatsapp_clone/NewScreens/otp_screen.dart';

import '../model/country_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  String countryName = "India";
  String countryCode = "+91";
  void setCountryData(CountryModel country) {
    setState(() {
      countryName = country.name;
      countryCode = country.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: _controller.toString().isNotEmpty &&
                      _controller.text.length == 10
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("We will be verifying your phone number "),
                        Text(
                          "$countryCode  ${_controller.text}",
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const Text(
                            "Is this ok, or would you like to edit the number?")
                      ],
                    )
                  : const Text("Enter valid phone number "),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Edit"),
              ),
              _controller.toString().isNotEmpty && _controller.text.length == 10
                  ? TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>OTPScreen(number:_controller,countryCode: countryCode,)));
                      },
                      child: const Text("Ok"),
                    )
                  : const Text(""),
            ],
          );
        });
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => CountryPage(
                      setCountryData: setCountryData,
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
        child: Row(
          children: [
            Expanded(
                child: SizedBox(
                    child: Center(
                        child: Text(
              countryName,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            )))),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Widget phoneNumber() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "+",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  countryCode.substring(1),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 1.5 - 70,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.teal, width: 1.8))),
              child: TextFormField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Phone Number"),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Enter your phone number",
          style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.w700, fontSize: 18),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "Whatsapp will send an sms message to verify your number",
                style: TextStyle(fontSize: 13.5),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "What's my number",
              style: TextStyle(fontSize: 12.8, color: Colors.cyan[800]),
            ),
            countryCard(),
            phoneNumber(),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
                onPressed: showMyDialog,
                child: const Text("Next",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600)))
          ],
        ),
      ),
    );
  }
}

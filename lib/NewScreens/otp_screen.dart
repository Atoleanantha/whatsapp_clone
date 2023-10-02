
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key,required this.number,required this.countryCode});
  final number;
  final countryCode;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Verify ${widget.countryCode.toString()} ${widget.number.text}",
          style: TextStyle(
              color: Colors.teal[500], fontWeight: FontWeight.w700, fontSize: 18),
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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(

          children: [
            const SizedBox(height: 30,),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
              children: [
                const TextSpan(
                  text: "We have send SMS with a code to\n",style: TextStyle(color: Colors.black,fontSize: 14.5)
                ),
                TextSpan(text: "${widget.countryCode} ${widget.number.text.toString()}",style:const TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16.5)),
                TextSpan(text: "\nWrong number",style: TextStyle(color: Colors.teal[500],fontSize: 14.5)),
              ]
            )),
            const SizedBox(height: 5,),
            SizedBox(
              height: 40,
              child: OTPTextField(
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 30,
                style:const TextStyle(
                    fontSize: 17
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            const SizedBox(height: 10,),
            const Text("Enter 6 digit code",style: TextStyle(color: Colors.grey),),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){},
              child: const ListTile(
                leading: Icon(Icons.message,color: Colors.teal,size: 24,),
                title:Text("Resend SMS",style: TextStyle(color: Colors.teal),),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0),
              child: Divider(thickness: 1.5,),
            ),
            InkWell(
              onTap: (){},
              child: const ListTile(
                leading: Icon(Icons.call,color: Colors.teal,size: 24,),
                title:Text("Call me",style: TextStyle(color: Colors.teal),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

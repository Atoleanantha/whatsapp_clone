import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/country_model.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({super.key,required this.setCountryData});
  final Function setCountryData;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<CountryModel>countries=[
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
  ];
  Widget countryCard(CountryModel country){
    return InkWell(
      onTap: (){
        widget.setCountryData(country);
        },
      child: Card(
        margin: const EdgeInsets.all(0.05),
        child: Container(
          height: 50,
          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: ListTile(leading: Text(country.flag),title: Text(country.name),trailing:Text(country.code),),
          //   Row(
          //   children: [
          //
          //     Text(country.code),
          //     const SizedBox(width: 15,),
          //     Text(country.flag),
          //     const SizedBox(width: 15,),
          //     Text(country.name),
          //
          //   ],
          // ),
          ),
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
          "Choose a country",
          style: TextStyle(
              color: Colors.teal, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.teal,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_rounded,
                color: Colors.teal,
              ))
        ],
      ),
      body: ListView.builder(itemCount: countries.length,itemBuilder: (context,index){
        return countryCard(countries[index]);
      }),
    );
  }
}

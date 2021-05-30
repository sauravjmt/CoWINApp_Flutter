import 'package:flutter/material.dart';

class SearchVaccineSlots extends StatefulWidget {
  @override
  _SearchVaccineState createState() => _SearchVaccineState();
}

class _SearchVaccineState extends State<SearchVaccineSlots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Vaccine Availability"),
      ),
    );
  }
}

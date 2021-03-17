import 'package:flutter/material.dart';
import 'package:Store/models/toDo.dart';

Color primaryColor = Colors.teal[800];
Color primaryLightColor = Colors.teal[50];
List<BoxShadow> shadowList = [
  BoxShadow(color: Colors.amber[100], blurRadius: 30, offset:  Offset(0,10))
];

List<Map> dailyPromos = [
  {
    "id": 0,
    "name": "Bumper offer upto 10% off"
  },
  {
    "id": 1,
    "name": "Super Bumper offer upto 20% off"
  },
  {
    "id": 2,
    "name": "Bumpest offer upto 40% off"
  },
  {
    "id": 3,
    "name": "Bump offer upto 50% off"
  }
];

List<ThingsToDo> thingsTo = [
  ThingsToDo('Yet To Start', 'Pranayama', 20, false, DateTime.now(), DateTime.now()),
  ThingsToDo('Yet To Start', 'Yoga', 20, false, DateTime.now(), DateTime.now()),
  ThingsToDo('Yet To Start', 'Earthing', 20, false, DateTime.now(), DateTime.now()),
  ThingsToDo('Yet To Start', 'Sleeping', 20, false, DateTime.now(), DateTime.now()),
];
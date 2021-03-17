import 'package:Store/models/vegetables.dart';
import 'package:flutter/material.dart';
import 'package:Store/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:Store/models/vegetables.dart';

// Access a Cloud Firestore instance from your Activity
FirebaseFirestore db = FirebaseFirestore.instance;

// Reference to a Collection
CollectionReference notesCollectionRef = db.collection('Vegetables');
class DailyPromoWidget extends StatefulWidget {
  @override
  _DailyPromoWidgetState createState() => _DailyPromoWidgetState();
}

class _DailyPromoWidgetState extends State<DailyPromoWidget> {
  final CollectionReference vegetables = FirebaseFirestore.instance.collection('Vegetables');

  @override
  Widget build(BuildContext context) {
    // notesCollectionRef.get().then((value) => {
    //   Vegetables.fromJson(value.docs.toList())
    // });
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(children: [
        Row(
          children: [
            Center(
              child: Text(
                'Daily promotions',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
          ],
        ),
        Column(children: [
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dailyPromos.length,
              itemBuilder: (context, index) {
              return Column(
                children: [
                Container(
                  height: 100,
                  width: 250,
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryLightColor,
                  ),
                  child: Center(child: Text('Daily' + dailyPromos[index]['name'])))
                ],
              );
            }),
          ),
        ])
      ]),
    );
  }
}

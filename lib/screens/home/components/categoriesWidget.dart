import 'package:Store/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:Store/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Access a Cloud Firestore instance from your Activity
FirebaseFirestore db = FirebaseFirestore.instance;

// Reference to a Collection
CollectionReference categories =
    FirebaseFirestore.instance.collection('categories');

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    Future<List<Categories>> getCategories() async {
      List<Categories> _categories = new List()..length;
      await categories.get().then((querySnapshot) => {
            querySnapshot.docs.forEach((element) {
              _categories.add(Categories.fromJson(element.data()));
            })
          });
      return _categories;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(children: [
        Row(
          children: [
            Center(
              child: Text(
                'Categories',
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
            height: 90,
            child: FutureBuilder(
              future: getCategories(),
              builder: (context, cats) {
              if (cats == null || cats.data == null) {
                return CircularProgressIndicator();
              }
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cats.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryLightColor,
                            ),
                            child: Center(
                                child:
                                    Text(cats.data[index].name)))
                      ],
                    );
                  });
            }),
          ),
        ])
      ]),
    );
  }
}

import 'package:Store/constants/constants.dart';
import 'package:flutter/material.dart';

class VegetablesAdminForm extends StatefulWidget {
  @override
  VegetablesAdminFormState createState() {
    return VegetablesAdminFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class VegetablesAdminFormState extends State<VegetablesAdminForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_sharp),
                        onPressed: () => {Navigator.pop(context)}),
                    Text(
                      'ADD NEW VEGETABLE',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.person),
                          hintText: 'Enter your name',
                          labelText: 'Name',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.phone),
                          hintText: 'Enter a phone number',
                          labelText: 'Phone',
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: const Icon(Icons.calendar_today),
                          hintText: 'Enter your date of birth',
                          labelText: 'Dob',
                        ),
                      ),
                      new Container(
                          padding:
                              const EdgeInsets.only(left: 150.0, top: 40.0),
                          child: new RaisedButton(
                              child: const Text('Submit'),
                              onPressed: () {

                              })),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

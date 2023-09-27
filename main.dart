import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
    );
  }
}

enum Gender { male, female, other,lgbtq,nonBinary, preferNotToSay, }

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String? whereFrom;
  String numberOfChildren = "";
  String? childAge;
  Gender gender = Gender.male;
  Gender childGender = Gender.male;
  String educationStyle = "";

  List<String> states = [//this part debug by ChatGPT
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming",

  ];/* END of ChatGPT-debug part. */

  List<String> ages = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "older than 10",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Which state are you from?'),
            DropdownButton<String>(
              value: whereFrom,
              onChanged: (String? value) {
                setState(() {
                  whereFrom = value;
                });
              },
              items: states.map<DropdownMenuItem<String>>((String state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
            ),

            Text('How many children do you have?'),
            TextField(
              onChanged: (value) {
                setState(() {
                  numberOfChildren = value;
                });
              },
            ),
            Text('How old are your children?'),
            DropdownButton<String>(
              value: childAge,
              onChanged: (String? value) {
                setState(() {
                  childAge = value;
                });
              },
              items: ages.map<DropdownMenuItem<String>>((String age) {
                return DropdownMenuItem<String>(
                  value: age,
                  child: Text(age),
                );
              }).toList(),
            ),
            Text('What’s your gender?'),
            DropdownButton<Gender>(
              value: gender,
              onChanged: (Gender? value) {
                setState(() {
                  gender = value!;
                });
              },
              items: Gender.values.map<DropdownMenuItem<Gender>>((Gender gender) {
                return DropdownMenuItem<Gender>(
                  value: gender,
                  child: Text(genderToString(gender)),
                );
              }).toList(),
            ),
            Text('What’s your children’s gender?'),
            Row(
              children: <Widget>[
                Radio(
                  value: Gender.male,
                  groupValue: childGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      childGender = value!;
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: Gender.female,
                  groupValue: childGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      childGender = value!;
                    });
                  },
                ),
                Text('Female'),
                Radio(
                  value: Gender.other,
                  groupValue: childGender,
                  onChanged: (Gender? value) {
                    setState(() {
                      childGender = value!;
                    });
                  },
                ),
                Text('Prefer not to say'),
              ],
            ),
            Text('What is your style for education?'),
            TextField(
              onChanged: (value) {
                setState(() {
                  educationStyle = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                print('Which state are you from? $whereFrom');
                print('How many children do you have? $numberOfChildren');
                print('How old are your children? $childAge');
                print('What’s your gender? ${genderToString(gender)}');
                print('What’s your children’s gender? ${genderToString(childGender)}');
                print('What is your style for education? $educationStyle');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  String genderToString(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.other:
        return 'Other';
      case Gender.lgbtq:
        return 'LGBTQ+';
      case Gender.nonBinary:
        return 'Non-binary';
      case Gender.preferNotToSay:
        return 'Prefer not to say';
    }
  }
}

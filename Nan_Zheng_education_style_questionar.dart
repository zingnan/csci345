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

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String? whereFrom;
  String numberOfChildren = "";
  double childAge = 1.0;
  String? selectedGender;
  String? childGender;
  String educationStyle = "";

  List<String> states = [
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
  ];

  List<String> genderOptions = [
    "Male",
    "Female",
    "Other",
    "LGBTQ+",
    "NonBinary",
    "PreferNotToSay",
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
            /*DropdownMenuItem function based on
            *https://www.jianshu.com/p/16fcbece02e4,
            *https://github.com/ACE-YANGCE/FlutterApp/blob/master/lib/page/drop_down_page.dart,
            *https://stackoverflow.com/questions/69603930/how-to-get-dropdownmenuitem-from-a-list,
            *https://stackoverflow.com/questions/59509240/how-to-display-a-listdropdownitemstring-when-using-a-list-generate-method,
            */

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


            /*slider function based on https://github.com/Burd-Courses/Flutter2023/blob/main/slider2.dart
            * based on age change the birth year */

            Text('How old are your children?'),
            Slider(
              value: childAge,
              min: 1.0,
              max: 30.0,
              divisions: 29,
              onChanged: (value) {
                setState(() {
                  childAge = value;
                });
              },
              label: '${childAge.toInt()},'
            ),

            Text('What’s your gender?'),
            DropdownButton<String>(
              value: selectedGender,
              onChanged: (String? value) {
                setState(() {
                  selectedGender = value;
                });
              },
              items: genderOptions.map<DropdownMenuItem<String>>((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
            ),

            Text('What’s your children’s gender?'),
            DropdownButton<String>(
              value: childGender,
              onChanged: (String? value) {
                setState(() {
                  childGender = value;
                });
              },
              items: genderOptions.map<DropdownMenuItem<String>>((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
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
                print('What’s your gender? $selectedGender');
                print('What’s your children’s gender? $childGender');
                print('What is your style for education? $educationStyle');
              },
              child: Text('Submit'),


              /*
              * respond page to be added*/
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? whereFrom;
  int numberOfChildren = 0;
  List<String> childGenders = [];
  List<int> childAges = [];
  String? selectedGender;
  String? educationStyle = "";

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
    if (childGenders.isEmpty || childGenders.length != numberOfChildren) {
      childGenders = List.generate(numberOfChildren, (index) => "");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[/*DropdownMenuItem function based on
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

              /*slider function based on https://github.com/Burd-Courses/Flutter2023/blob/main/slider2.dart
            * based on age change the birth year */
              //2023/10/12 was about age, now with more reasonable function.

              Text('How many children do you have?'),
              Slider(
                value: numberOfChildren.toDouble(),
                min: 0,
                max: 10,
                divisions: 10,
                onChanged: (value) {
                  setState(() {
                    numberOfChildren = value.toInt();
                    childAges = List.filled(numberOfChildren, 1);
                    childGenders = List.generate(numberOfChildren, (index) => "");
                  });
                },
                label: '$numberOfChildren',
              ),
//based on the number of children show more line of option
              for (int i = 0; i < numberOfChildren; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('What is child ${i + 1}\'s age?'),
                    Slider(
                      value: childAges[i].toDouble(),
                      min: 1,
                      max: 18,
                      divisions: 17,
                      onChanged: (value) {
                        setState(() {
                          childAges[i] = value.toInt();
                        });
                      },
                      label: '${childAges[i]}',
                    ),
                    Text('What is child ${i + 1}\'s gender?'),
                    DropdownButton<String>(
                      value: childGenders[i].isEmpty ? null : childGenders[i],
                      onChanged: (String? value) {
                        setState(() {
                          childGenders[i] = value!;
                        });
                      },
                      items: genderOptions.map<DropdownMenuItem<String>>((String gender) {
                        return DropdownMenuItem<String>(
                          value: gender,
                          child: Text(gender),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20), // Adding more space after each child
                    Divider( // Adding a horizontal line to separate each child's information https://api.flutter.dev/flutter/material/Divider-class.html
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    SizedBox(height: 20),
                  ],
                ),

              Text('What is your gender?'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Questionnaire()),//https://api.flutter.dev/flutter/material/MaterialPageRoute-class.html
                  );
                },
                child: Text('To the questions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}
//lazy and ez maintain question list
class _QuestionnaireState extends State<Questionnaire> {
  final List<String> options = [
    'Not at all',
    'Sometimes it may be considered',
    'Often',
    'Depends on the situation'
  ];

  final List<String> questions = [
    'Do you think corporal punishment is appropriate for teaching children?',
    'Do you believe that positive encouragement is essential to a child\'s development?',
    'Are you concerned about your child\'s emotional well-being and mental health?',
    'What are your thoughts on implementing technology-based learning methods for children at a young age?'
  ];

  final Map<String, int> scores = {
    'Not at all': 1,
    'Sometimes it may be considered': 2,
    'Often': 3,
    'Depends on the situation': 4,
  };

  Map<String, int> userScores = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionnaire'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(questions[index]),
                DropdownButton<String>(
                  value: userScores[questions[index]] != null
                      ? options[userScores[questions[index]]! - 1]
                      : null,
                  onChanged: (String? value) {
                    setState(() {
                      userScores[questions[index]] = options.indexOf(value!) + 1;
                    });
                  },
                  items: options.map<DropdownMenuItem<String>>((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
      //FloatingActionButton https://api.flutter.dev/flutter/material/FloatingActionButton-class.html
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int totalScore = calculateTotalScore();
          giveFeedback(totalScore, context);
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  int calculateTotalScore() {
    int totalScore = 0;
    userScores.forEach((key, value) {
      totalScore += value;
    });
    return totalScore;
  }

  void giveFeedback(int totalScore, BuildContext context) {
    String feedback;
    if (totalScore <= 6) {
      feedback =
      'Your educational style seems to be more traditional. DO BETTER';
    } else if (totalScore <= 12) {
      feedback = 'Keep up the good work!';
    } else {
      feedback = 'Your educational style leans more towards modern techniques. ';
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeedbackPage(feedback: feedback),
      ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  final String feedback;

  FeedbackPage({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            feedback,
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

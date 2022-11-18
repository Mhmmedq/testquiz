// ignore_for_file: prefer_const_constructors, camel_case_types, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'appbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Appbrain newb = Appbrain();
void main() {
  runApp(const quiz());
}

class quiz extends StatelessWidget {
  const quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(114, 68, 137, 255),
          title: Center(
            child: Text(
              "QUIZ TEST",
              style: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: dashbord(),
      ),
    );
  }
}

class dashbord extends StatefulWidget {
  const dashbord({super.key});

  @override
  State<dashbord> createState() => _dashbordState();
}

class _dashbordState extends State<dashbord> {
  List<Widget> anser = [];
  int corectanser = 0;
  void checkanswer(bool userChoice) {
    setState(() {
      if (newb.getqustionanswer() == userChoice) {
        anser.add(
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
        corectanser++;
      } else {
        anser.add(
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }

      if (newb.isfinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: " qusions finished ",
          desc: "its done , you have $corectanser corect answer of 4 answer.",
          buttons: [
            DialogButton(
              child: Text(
                "restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        newb.restart();
        anser = [];
        corectanser = 0;
      } else {
        newb.getqn();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: anser,
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(newb.getqustionimage()),
                SizedBox(
                  height: 10,
                ),
                Text(
                  newb.getqustiontext(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkanswer(true);
              },
              child: Text(
                'صح',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 53, 134, 56)),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkanswer(false);
              },
              child: Text(
                'خطأ',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 195, 4, 4)),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}

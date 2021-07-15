import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math_app/helpers/score_helper.dart';
import 'package:math_app/screens/first_grade/first_grade.dart';

class FirstGradeScoreBoard extends StatefulWidget {
  final int? score;
  final int? level;
  const FirstGradeScoreBoard({Key? key, @required this.score, this.level})
      : super(key: key);
  @override
  _FirstGradeScoreBoardState createState() => _FirstGradeScoreBoardState();
}

class _FirstGradeScoreBoardState extends State<FirstGradeScoreBoard> {
  late int? _score = widget.score;
  late int? _level = widget.level;
  late String text;
  Color scafbg = Color(0xff242b3e);
  Color btnprimary = Color(0xff30445c);
  @override
  void initState() {
    super.initState();
    setState(() {
      if (_score! <= 30 && _score! > 10) {
        text = "Hay aksi ${_score} puan.Biraz daha pratik yapsak iyi olacak!";
      }
      if (_score! <= 10) {
        text = "${_score} aldın ama tekrar deneyerek daha iyisini yapabiliriz!";
      }
      if (_score! <= 70 && _score! > 30) {
        text = "Harika ${_score} puan,matematiğin gayet iyi!";
      }
      if (_score! >= 70) {
        text = "Vay canına ${_score} puan,sen bir ustasın!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafbg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              width: 350,
              height: 400,
              decoration: BoxDecoration(
                  color: Color(0xffccdde7),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RatingBarIndicator(
                    itemSize: 100,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 3,
                    rating: scoreHelper(_score!),
                  ),
                  Container(
                    color: Color(0xffe78230),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "${_score}",
                            style: TextStyle(
                                fontSize: 90,
                                fontFamily: 'Trailer Park Girl',
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_level == 1) {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstGrade(
                                score: _score,
                                level: _level,
                              )));
                });
              }
            },
            child: Text("Test Ekranına Dön"),
            style: ElevatedButton.styleFrom(
                primary: Color(0xff30445c),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                textStyle: TextStyle(fontSize: 30),
                fixedSize: Size(275, 100)),
          )
        ],
      ),
    );
  }
}

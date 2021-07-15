import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math_app/helpers/score_helper.dart';
import 'package:math_app/screens/second_grade/second_grade.dart';

class SecondGradeScoreboard extends StatefulWidget {
  final int? score;
  final int? level;
  final String? method;
  const SecondGradeScoreboard(
      {Key? key, @required this.score, this.level, this.method})
      : super(key: key);
  @override
  _SecondGradeScoreboard createState() => _SecondGradeScoreboard();
}

class _SecondGradeScoreboard extends State<SecondGradeScoreboard> {
  late int? _score = widget.score;
  late int? _level = widget.level;
  late String? _method = widget.method;
  late String text;
  Color scafbg = Color(0xff242b3e);
  Color btnprimary = Color(0xff30445c);
  Color appbar = Color(0xff2e435a);
  Color apptext = Color(0xffF9F9F9);
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbar,
        foregroundColor: apptext,
        title: Center(child: Text("Sonuç")),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(60, 120),
          ),
        ),
      ),
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
                                fontSize: 90, fontFamily: 'Trailer Park Girl'),
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
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondGrade(
                              score: _score,
                              level: _level,
                              method: _method,
                            )));
              });
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

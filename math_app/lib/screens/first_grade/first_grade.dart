import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math_app/helpers/score_helper.dart';
import 'package:math_app/screens/first_grade/first_grade_sum_test.dart';
import 'package:math_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstGrade extends StatefulWidget {
  final int? score;
  final int? level;
  const FirstGrade({Key? key, @required this.score, this.level})
      : super(key: key);
  @override
  _FirstGradeState createState() => _FirstGradeState();
}

class _FirstGradeState extends State<FirstGrade> {
  late int? _score = widget.score;
  late int _score1 = 0;
  Color scafbg = Color(0xff242b3e);
  Color btnprimary = Color(0xff30445c);
  Color appbar = Color(0xff2e435a);
  Color btntext = Color(0xffEFFFFA);
  Color apptext = Color(0xffF9F9F9);

  Future<void> saveScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    readScore();
    var savedScore = await (sharedPref.getInt('_score1') ?? 0);
    if (savedScore < _score!) {
      await sharedPref.setInt('_score1', _score!);
      _score1 = _score!;
    }
  }

  Future<void> readScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _score1 = await (sharedPref.getInt('_score1') ?? 0);
  }

  @override
  void initState() {
    super.initState();
    saveScore().whenComplete(() => setState(() {}));
    readScore().whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: scafbg,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: appbar,
            foregroundColor: apptext,
            title: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "1",
                  style: TextStyle(
                      fontFamily: 'Trailer Park Girl',
                      color: Color(0xffe78230),
                      fontSize: 50),
                ),
                Center(child: Text("   Birinci Sınıf"))
              ],
            )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xffFFB732),
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_score1),
                        ),
                        Text(
                          "${_score1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Toplama",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FirstGradeSumTest(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Ana menüye dön'),
            content: new Text('Sınıf seçme menüsüne yönlendirileceksiniz'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Hayır'),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home())),
                child: new Text('Evet'),
              ),
            ],
          ),
        )) ??
        false;
  }
}

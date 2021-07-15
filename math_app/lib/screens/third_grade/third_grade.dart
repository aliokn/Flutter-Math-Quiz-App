import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math_app/helpers/constants.dart';
import 'package:math_app/helpers/score_helper.dart';
import 'package:math_app/screens/third_grade/third_grade_multiply.dart';
import 'package:math_app/screens/third_grade/third_grade_sub_test.dart';
import 'package:math_app/screens/third_grade/third_grade_sub_test2.dart';
import 'package:math_app/screens/third_grade/third_grade_sum_test.dart';
import 'package:math_app/screens/third_grade/third_grade_sum_test2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';

class ThirdGrade extends StatefulWidget {
  final int? score;
  final int? level;
  final String? method;
  const ThirdGrade({Key? key, @required this.score, this.level, this.method})
      : super(key: key);
  @override
  _ThirdGradeState createState() => _ThirdGradeState();
}

class _ThirdGradeState extends State<ThirdGrade> {
  late int? _level = widget.level;
  late int? _score = widget.score;
  late String? _method = widget.method;
  late int _scoresuml1 = 0;
  late int _scoresuml2 = 0;
  late int _scoresubl1 = 0;
  late int _scoresubl2 = 0;
  late int _scoremultiply = 0;
  Color scafbg = Color(0xff242b3e);
  Color btnprimary = Color(0xff30445c);
  Color appbar = Color(0xff2e435a);
  Color btntext = Color(0xffEFFFFA);
  Color apptext = Color(0xffF9F9F9);
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
                  "3",
                  style: TextStyle(
                      fontFamily: 'Trailer Park Girl',
                      color: Color(0xffe78230),
                      fontSize: 50),
                ),
                Center(child: Text("   Üçüncü Sınıf"))
              ],
            )),
          ),
          body: GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresuml1),
                        ),
                        Text(
                          "${_scoresuml1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Toplama",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThirdGradeSumTest(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresuml2),
                        ),
                        Text(
                          "${_scoresuml2}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 2 Toplama",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThirdGradeSumTest2(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresubl1),
                        ),
                        Text(
                          "${_scoresubl1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Çıkarma",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThirdGradeSubTest(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoresubl2),
                        ),
                        Text(
                          "${_scoresubl2}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 2 Çıkarma",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThirdGradeSubTest2(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: btnprimary,
                        border: Border.all(color: btnprimary),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 3,
                          rating: scoreHelper(_scoremultiply),
                        ),
                        Text(
                          "${_scoremultiply}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Çarpma ",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ThirdGradeMultiplyTest(
                                          score: 0,
                                          wrong: 0,
                                        )));
                          },
                          child: Center(child: Text("Teste başla")),
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xffe78230),
                            textStyle: TextStyle(fontSize: 22),
                          ),
                        ),
                      ],
                    )),
              ]),
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

  Future<void> saveScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    readScore();
    if (_method == Methods.sum) {
      if (_level == 2 && (_score! > _scoresuml2)) {
        await sharedPref.setInt('_scoresumg3l2', _score!);
        _scoresuml2 = _score!;
      }
      if (_level == 1 && (_score! > _scoresuml1)) {
        await sharedPref.setInt('_scoresumg3l1', _score!);
        _scoresuml1 = _score!;
      }
    }
    if (_method == Methods.sub && (_score! > _scoresubl1) && _level == 1) {
      await sharedPref.setInt('_scoresubg3l1', _score!);
      _scoresubl1 = _score!;
    }
    if (_method == Methods.sub && (_score! > _scoresubl2) && _level == 2) {
      await sharedPref.setInt('_scoresubg3l2', _score!);
      _scoresubl2 = _score!;
    }
    if (_method == Methods.multiply) {
      await sharedPref.setInt('_scoremultiplyg3l1', _score!);
      _scoremultiply = _score!;
    }
  }

  Future<void> readScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _scoresuml1 = await (sharedPref.getInt('_scoresumg3l1') ?? 0);
    _scoresuml2 = await (sharedPref.getInt('_scoresumg3l2') ?? 0);
    _scoresubl1 = await (sharedPref.getInt('_scoresubg3l1') ?? 0);
    _scoresubl2 = await (sharedPref.getInt('_scoresubg3l2') ?? 0);
    _scoremultiply = await (sharedPref.getInt('_scoremultiplyg3l1') ?? 0);
  }
}

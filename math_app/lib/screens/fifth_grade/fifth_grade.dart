import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:math_app/helpers/constants.dart';
import 'package:math_app/helpers/score_helper.dart';
import 'package:math_app/screens/fifth_grade/fifth_grade_sub_test.dart';
import 'package:math_app/screens/fifth_grade/fifth_grade_sub_test2.dart';
import 'package:math_app/screens/fifth_grade/fifth_grade_sum_test.dart';
import 'package:math_app/screens/fifth_grade/fifth_grade_sum_test2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';
import 'fifth_grade_div_test.dart';
import 'fifth_grade_div_test2.dart';
import 'fifth_grade_multiply_test.dart';
import 'fifth_grade_multiply_test2.dart';
import 'fifth_grade_sum_test.dart';
import 'fifth_grade_mixed_test2.dart';
import 'fifth_grade_mixed_test.dart';

class FifthGrade extends StatefulWidget {
  final int? score;
  final int? level;
  final String? method;
  const FifthGrade({Key? key, @required this.score, this.level, this.method})
      : super(key: key);
  @override
  _FifthGradeState createState() => _FifthGradeState();
}

class _FifthGradeState extends State<FifthGrade> {
  late int? _level = widget.level;
  late int? _score = widget.score;
  late String? _method = widget.method;
  late int _scoresuml1 = 0;
  late int _scoresuml2 = 0;
  late int _scoresubl1 = 0;
  late int _scoresubl2 = 0;
  late int _scorediv1 = 0;
  late int _scorediv2 = 0;
  late int _scoremultiply1 = 0;
  late int _scoremultiply2 = 0;
  late int _scoremixed1 = 0;
  late int _scoremixed2 = 0;
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
                  "5",
                  style: TextStyle(
                      fontFamily: 'Trailer Park Girl',
                      color: Color(0xffe78230),
                      fontSize: 50),
                ),
                Center(child: Text("   Beşinci Sınıf"))
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
                                    builder: (context) => FifthGradeSumTest(
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
                                    builder: (context) => FifthGradeSumTest2(
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
                                    builder: (context) => FifthGradeSubTest(
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
                                    builder: (context) => FifthGradeSubTest2(
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
                          rating: scoreHelper(_scoremultiply1),
                        ),
                        Text(
                          "${_scoremultiply1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Çarpma",
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
                                        FifthGradeMultiplyTest(
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
                          rating: scoreHelper(_scoremultiply2),
                        ),
                        Text(
                          "${_scoremultiply2}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 2 Çarpma",
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
                                        FifthGradeMultiplyTest2(
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
                          rating: scoreHelper(_scorediv1),
                        ),
                        Text(
                          "${_scorediv1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Bölme",
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
                                    builder: (context) => FifthGradeDivTest(
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
                          rating: scoreHelper(_scorediv2),
                        ),
                        Text(
                          "${_scorediv2}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 2 Bölme",
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
                                    builder: (context) => FifthGradeDivTest2(
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
                          rating: scoreHelper(_scoremixed1),
                        ),
                        Text(
                          "${_scoremixed1}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 1 Karma",
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
                                    builder: (context) => FifthGradeMixedTest(
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
                          rating: scoreHelper(_scoremixed2),
                        ),
                        Text(
                          "${_scoremixed2}",
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        ),
                        Center(
                          child: Text(
                            "Seviye 2 Karma",
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
                                    builder: (context) => FifthGradeMixedTest2(
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
        await sharedPref.setInt('_scoresumg5l2', _score!);
        _scoresuml2 = _score!;
      }
      if (_level == 1 && (_score! > _scoresuml1)) {
        await sharedPref.setInt('_scoresumg5l1', _score!);
        _scoresuml1 = _score!;
      }
    }
    if (_method == Methods.sub && (_score! > _scoresubl1) && _level == 1) {
      await sharedPref.setInt('_scoresubg5l1', _score!);
      _scoresubl1 = _score!;
    }
    if (_method == Methods.sub && (_score! > _scoresubl2) && _level == 2) {
      await sharedPref.setInt('_scoresubg5l2', _score!);
      _scoresubl2 = _score!;
    }
    if (_method == Methods.divide && (_score! > _scorediv1) && _level == 1) {
      await sharedPref.setInt('_scoredivg5l1', _score!);
      _scorediv1 = _score!;
    }
    if (_method == Methods.divide && (_score! > _scorediv2) && _level == 2) {
      await sharedPref.setInt('_scoredivg5l2', _score!);
      _scorediv2 = _score!;
    }
    if (_method == Methods.multiply &&
        (_score! > _scoremultiply1) &&
        _level == 1) {
      await sharedPref.setInt('_scoremultiplyg5l1', _score!);
      _scoremultiply1 = _score!;
    }
    if (_method == Methods.multiply &&
        (_score! > _scoremultiply2) &&
        _level == 2) {
      await sharedPref.setInt('_scoremultiplyg5l2', _score!);
      _scoremultiply2 = _score!;
    }
    if (_method == Methods.mixed && (_score! > _scoremixed1) && _level == 1) {
      await sharedPref.setInt('_scoremixedg5l1', _score!);
      _scoremixed1 = _score!;
    }
    if (_method == Methods.mixed && (_score! > _scoremixed2) && _level == 2) {
      await sharedPref.setInt('_scoremixedg5l2', _score!);
      _scoremixed2 = _score!;
    }
  }

  Future<void> readScore() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _scoresuml1 = await (sharedPref.getInt('_scoresumg5l1') ?? 0);
    _scoresuml2 = await (sharedPref.getInt('_scoresumg5l2') ?? 0);
    _scoresubl1 = await (sharedPref.getInt('_scoresubg5l1') ?? 0);
    _scoresubl2 = await (sharedPref.getInt('_scoresubg5l2') ?? 0);
    _scorediv1 = await (sharedPref.getInt('_scoredivg5l1') ?? 0);
    _scorediv2 = await (sharedPref.getInt('_scoredivg5l2') ?? 0);
    _scoremultiply1 = await (sharedPref.getInt('_scoremultiplyg5l1') ?? 0);
    _scoremultiply2 = await (sharedPref.getInt('_scoremultiplyg5l2') ?? 0);
    _scoremixed1 = await (sharedPref.getInt('_scoremixedg5l1') ?? 0);
    _scoremixed2 = await (sharedPref.getInt('_scoremixedg5l2') ?? 0);
  }
}

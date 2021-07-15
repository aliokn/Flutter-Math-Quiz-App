import 'package:flutter/material.dart';
import 'package:math_app/screens/fifth_grade/fifth_grade.dart';
import 'package:math_app/screens/first_grade/first_grade.dart';
import 'package:math_app/screens/fourth_grade/fourth_grade.dart';
import 'package:math_app/screens/second_grade/second_grade.dart';
import 'package:math_app/screens/third_grade/third_grade.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color scafbg = Color(0xff242b3e);
  Color btnprimary = Color(0xff30445c);
  Color appbar = Color(0xff2e435a);
  Color btntext = Color(0xffEFFFFA);
  Color apptext = Color(0xffF9F9F9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafbg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: appbar,
        foregroundColor: apptext,
        title: Center(child: Text("Matematik uygulamasına hoş geldin")),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(60, 120),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xffe78230),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Kaçıncı sınıfa gidiyorsun?",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FirstGrade(
                              score: 0,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "1",
                    style: TextStyle(
                        fontFamily: 'Trailer Park Girl',
                        color: Color(0xffe78230),
                        fontSize: 50),
                  ),
                  Center(child: Text("Birinci Sınıf"))
                ],
              ),
              style: ElevatedButton.styleFrom(
                  onPrimary: btntext,
                  primary: btnprimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(fontSize: 30),
                  fixedSize: Size(275, 100)),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondGrade(
                              score: 0,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "2",
                    style: TextStyle(
                        fontFamily: 'Trailer Park Girl',
                        color: Color(0xffe78230),
                        fontSize: 50),
                  ),
                  Center(child: Text("İkinci Sınıf"))
                ],
              ),
              style: ElevatedButton.styleFrom(
                  onPrimary: btntext,
                  primary: btnprimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(fontSize: 30),
                  fixedSize: Size(275, 100)),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdGrade(
                              score: 0,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "3",
                    style: TextStyle(
                        fontFamily: 'Trailer Park Girl',
                        color: Color(0xffe78230),
                        fontSize: 50),
                  ),
                  Center(child: Text("Üçüncü Sınıf"))
                ],
              ),
              style: ElevatedButton.styleFrom(
                  onPrimary: btntext,
                  primary: btnprimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(fontSize: 30),
                  fixedSize: Size(275, 100)),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FourthGrade(
                              score: 0,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "4",
                    style: TextStyle(
                        fontFamily: 'Trailer Park Girl',
                        color: Color(0xffe78230),
                        fontSize: 50),
                  ),
                  Center(child: Text("Dördüncü Sınıf"))
                ],
              ),
              style: ElevatedButton.styleFrom(
                  onPrimary: btntext,
                  primary: btnprimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(fontSize: 30),
                  fixedSize: Size(275, 100)),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FifthGrade(
                              score: 0,
                            )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "5",
                    style: TextStyle(
                        fontFamily: 'Trailer Park Girl',
                        color: Color(0xffe78230),
                        fontSize: 50),
                  ),
                  Center(child: Text("Beşinci Sınıf"))
                ],
              ),
              style: ElevatedButton.styleFrom(
                  onPrimary: btntext,
                  primary: btnprimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(fontSize: 30),
                  fixedSize: Size(275, 100)),
            ),
          )
        ],
      ),
    );
  }
}

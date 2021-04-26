import 'package:flutter/material.dart';

void main() {
  runApp(myapp());
}

// ignore: camel_case_types
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: myhomepage(),
    );
  }
}

// ignore: camel_case_types
class myhomepage extends StatefulWidget {
  @override
  _myhomepageState createState() => _myhomepageState();
}

// ignore: camel_case_types
class _myhomepageState extends State<myhomepage> {
  int first;
  int second;
  String texttodisplay = "";
  String res = "";
  String his = "";
  String operator;

  get value => null;

  void btnclicked(String value) {
    if (value == "C") {
      texttodisplay = "";
      first = 0;
      second = 0;
      res = "";
      his = "";
    } else if (value == "+" || value == "-" || value == "x" || value == "/") {
      first = int.parse(texttodisplay);
      res = "";
      operator = value;
    } else if (value == "=") {
      second = int.parse(texttodisplay);
      if (operator == "+") {
        res = (first + second).toString();
        his = first.toString() + operator.toString() + second.toString();
      }
      if (operator == "-") {
        res = (first - second).toString();
        his = first.toString() + operator.toString() + second.toString();
      }
      if (operator == "x") {
        res = (first * second).toString();
        his = first.toString() + operator.toString() + second.toString();
      }
      if (operator == "/") {
        res = (first / second).toString();
        his = first.toString() + operator.toString() + second.toString();
      }
    } else {
      res = int.parse(texttodisplay + value).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String value) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.all(5.0),
      child: FlatButton(
        padding: EdgeInsets.all(35.0),
        onPressed: () => btnclicked(value),
        color: Color(0xFF8ac4d0),
        child: Text(
          "$value",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Calculator",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "verdana",
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$his",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(30.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                custombutton(
                  "7",
                ),
                custombutton("8"),
                custombutton("9"),
                custombutton("+"),
              ],
            ),
            Row(
              children: [
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            Row(
              children: [
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("x"),
              ],
            ),
            Row(
              children: [
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color lightGrey = Color(0xff5A5757);
  Color darkGrey = Color(0xff414141);
  Color numColor = Color(0xff3F3F3F);
  var Style3 = TextStyle(
    color: Color(0xFFFFFFFF),
    fontFamily: 'semibold',
  );
  var input = '';
  var output = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: darkGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: darkGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Screen(
              text1: input,
              text2: output,
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                          text3: 'AC',
                          col: lightGrey,
                          onPress: () {
                            input = (input.isEmpty) ? "0" : '';
                            output = "0";
                            setState(() {});
                          },
                        ),
                        Button(
                            text3: 'Del',
                            col: lightGrey,
                            onPress: () {
                              input = input.substring(0, input.length - 1);
                              setState(() {});
                            }),
                        Button(
                            text3: '^',
                            col: lightGrey,
                            onPress: () {
                              input += "^";
                              setState(() {});
                            }),
                        Button(
                            text3: '/',
                            col: lightGrey,
                            onPress: () {
                              input += "/";
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                            text3: '7',
                            col: lightGrey,
                            onPress: () {
                              input += '7';
                              setState(() {});
                            }),
                        Button(
                            text3: '8',
                            col: lightGrey,
                            onPress: () {
                              input += '8';
                              setState(() {});
                            }),
                        Button(
                            text3: '9',
                            col: lightGrey,
                            onPress: () {
                              input += '9';
                              setState(() {});
                            }),
                        Button(
                            text3: 'x',
                            col: lightGrey,
                            onPress: () {
                              input += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                            text3: '4',
                            col: lightGrey,
                            onPress: () {
                              input += '4';
                              setState(() {});
                            }),
                        Button(
                            text3: '5',
                            col: lightGrey,
                            onPress: () {
                              input += '5';
                              setState(() {});
                            }),
                        Button(
                            text3: '6',
                            col: lightGrey,
                            onPress: () {
                              input += '6';
                              setState(() {});
                            }),
                        Button(
                            text3: '-',
                            col: lightGrey,
                            onPress: () {
                              input += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                            text3: '1',
                            col: lightGrey,
                            onPress: () {
                              input += '1';
                              setState(() {});
                            }),
                        Button(
                            text3: '2',
                            col: lightGrey,
                            onPress: () {
                              input += '2';
                              setState(() {});
                            }),
                        Button(
                            text3: '3',
                            col: lightGrey,
                            onPress: () {
                              input += '3';
                              setState(() {});
                            }),
                        Button(
                            text3: '+',
                            col: lightGrey,
                            onPress: () {
                              input += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Button(
                            text3: '.',
                            col: lightGrey,
                            onPress: () {
                              input += '.';
                              setState(() {});
                            }),
                        Button(
                            text3: '0',
                            col: lightGrey,
                            onPress: () {
                              input += '0';
                              setState(() {});
                            }),
                        Button(
                            text3: '=',
                            col: lightGrey,
                            wid: 120,
                            onPress: () {
                              equalPress();
                              setState(() {});
                            }),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finalinput = input.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, ContextModel());
    output = eval.toString();
  }
}

// screen for input/output

class Screen extends StatelessWidget {
  Color lightGrey = Color(0xff5A5757);
  Color darkGrey = Color(0xff414141);
  Color numColor = Color(0xff3F3F3F);
  var Style3 = TextStyle(
    color: Color(0xFFFFFFFF),
    fontFamily: 'semibold',
  );
  var text1;
  var text2;

  Screen({super.key, required this.text1, required this.text2});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration: BoxDecoration(
          color: lightGrey, borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              text1,
              style: TextStyle(fontSize: 24, color: Color(0xff9E9C9C)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 10, bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "=  ",
                  style: TextStyle(fontSize: 28, color: Color(0xff9E9C9C)),
                ),
                Text(
                  text2,
                  style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'semibold',
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// buttons for numbers & operators

class Button extends StatelessWidget {
  Color lightGrey = Color(0xff5A5757);
  Color darkGrey = Color(0xff414141);
  static const Color numColor = Color(0xff3F3F3F);
  var Style3 = TextStyle(
    color: Color(0xFFFFFFFF),
    fontFamily: 'semibold',
  );
  final wid;
  final col;
  final text3;
  final VoidCallback onPress;

  Button(
      {super.key,
      this.wid,
      this.col = numColor,
      required this.text3,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: (wid == null) ? 55 : wid,
          height: 55,
          decoration: BoxDecoration(
              color: col,
              boxShadow: [
                BoxShadow(
                    color: Color(0xff2C2C2C),
                    offset: Offset(0, 2),
                    spreadRadius: 3,
                    blurStyle: BlurStyle.inner,
                    blurRadius: 102),
                // BoxShadow(
                //     color: Color(0xff434343),
                //     offset: Offset(0, 0),
                //     spreadRadius: 3,
                //     blurRadius: 17,
                //     blurStyle: BlurStyle.outer)
              ],
              borderRadius: BorderRadius.circular(50)),
          child: Center(
              child: Text(
            text3,
            style: Style3,
          )),
        ),
      ),
    );
  }
}

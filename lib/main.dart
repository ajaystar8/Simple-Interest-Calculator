import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Interest Calculator",
      home: SiHome(),
    ),
  );
}

class SiHome extends StatefulWidget {
  const SiHome({Key? key}) : super(key: key);

  @override
  _SiHomeState createState() => _SiHomeState();
}

class _SiHomeState extends State<SiHome> {
  TextEditingController _principalController = TextEditingController();
  TextEditingController _roiController = TextEditingController();
  TextEditingController _termController = TextEditingController();
  double principal = 0;
  double roi = 0;
  double term = 0;
  double result = 0;
  double finalAmount = 0;
  String answerText = " ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff001E6C),
        centerTitle: true,
        title: Text(
          "Simple Interest Calculator",
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xffFFAA4C),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Image.asset('images/money_img.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: _principalController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Principal",
                      hintText: "Principal Amount",
                      labelStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: _roiController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "ROI",
                      hintText: "Rate Of Interest",
                      labelStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    controller: _termController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Term",
                      hintText: "Lock In Period",
                      labelStyle: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 20.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            finalAmountCalculator();
                            finalText();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffFFAA4C),
                        ),
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            resetFunction();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Reset",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffFFAA4C),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    child: Text(
                      "$answerText",
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double finalAmountCalculator() {
    principal = double.parse(_principalController.text);
    roi = double.parse(_roiController.text);
    term = double.parse(_termController.text);
    result = principal * roi * term * 0.01;
    finalAmount = principal + result;
    return finalAmount;
  }

  String finalText() {
    if (term != 0) {
      answerText =
          "Amount You Will Recieve by the end of $term years is  ₹$finalAmount";
    }
    return answerText;
  }

  void resetFunction() {
    _principalController.text = "";
    _roiController.text = "";
    _termController.text = "";
    answerText = "";
  }
}
